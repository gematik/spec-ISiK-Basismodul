

Es gelten die Interaktionen und der Workflow aus dem [Subscription Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/workflow.html#workflow-fhir-r4).

### Subscription-Workflow

Der Subscription-Workflow umfasst die folgenden verpflichtenden Schritte:

#### 1. Topic Discovery (MUSS)

Clients sollen in der Lage sein, die vom Subscription Server unterstützten SubscriptionTopics abzufragen. Der Server MUSS die unterstützten Topics über die Extension[`capabilitystatement-subscriptiontopic-canonical`](https://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition-capabilitystatement-subscriptiontopic-canonical.html)
im CapabilityStatement bekannt geben.

##### Abruf
```
GET [base]/metadata
```
##### Antwort
```json
{
  "resourceType": "CapabilityStatement",
  "rest": [
    {
      "mode": "server",
      "resource": [
        {
          "type": "Subscription",
          "extension": [
            {
              "url": "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/capabilitystatement-subscriptiontopic-canonical",
              "valueCanonical": "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge"
            },
            ...
          ],
          ...
        }
      ],
      ...
    }
  ]
}
```

#### 2. Subscription-Anlage (MUSS)

Clients können eine Subscription auf dem Subscription Server anlegen.
Der Subscription Server MUSS dabei die folgenden Angaben unterstützen:

- **Topic** (`Subscription.criteria`): Canonical URL eines unterstützten SubscriptionTopics aus dem ISiKSubscriptionTopic CodeSystem.
- **Filterparameter** (`Subscription.criteria.extension:filterCriteria`): Optionale Einschränkung der Ereignisse.
- **Kanal** (`Subscription.channel.type`): MUSS `rest-hook` sein.
- **Payload** (`Subscription.channel.payload.extension[content]`): MUSS `id-only` sein. Die Notification enthält die ID der geänderten Ressource, aber keine vollständigen Ressourcendaten. Der Wert `full-resource` ist nicht zulässig.

```
POST [base]/Subscription
```

#### 3. Kanal-Handshake / Aktivierung (MUSS)

Nach der Anlage MUSS der Server einen Handshake-Aufruf am angegebenen REST-Hook-Endpunkt durchführen.
Bei erfolgreicher Verarbeitung der Anfrage (HTTP 200 OK) MUSS der Subscription Server den Status der Subscription von `requested` auf `active` aktualisieren.
Tritt ein Fehler auf, MUSS der Subscription Server den Status auf `error` setzen.

Der Subscription Server KANN optional beim Handshake eine HTTP Basic Authentication mit einem statischen Secret (Subscription.channel.header) verwenden.

#### 4. Notifications (MUSS)

Der Subscription Server MUSS Benachrichtigungen als Bundle vom Typ `history` mit dem Entry `entry:subscriptionStatus` senden.
Der Subscription Server MUSS dabei `payload=id-only` verwenden, sodass die Benachrichtigung nur die ID(s) der geänderten Ressource(n), jedoch keine vollständigen Ressourcendaten enthält.

Anhand der übermittelten ID ruft der Client die aktuelle Version der Ressource über die reguläre FHIR-REST-API mit gültigem Autorisierungstoken ab (Pull-Prinzip).

#### 5. Heartbeat (MUSS)

Der Server MUSS einen Heartbeat senden, sobald die konfigurierte `heartbeatPeriod` seit der letzten erfolgreich zugestellten Benachrichtigung (Notification oder Heartbeat) abgelaufen ist und in diesem Zeitraum keine Notification erfolgt ist. Jede erfolgreiche Zustellung setzt den Zeitraum neu.

Der Subscription Server MUSS den Heartbeat als Bundle mit `type=history` und einem Entry SubscriptionStatus mit `notificationType=heartbeat` senden.

#### 6. `$status` Operation (MUSS)

Der Subscription Server MUSS die Operation `$status` unter `[base]/Subscription/[id]/$status` implementieren,
um Kanalzustand, letzte Events und Diagnosedaten zu prüfen.

```
GET [base]/Subscription/[id]/$status
```

#### 7. `$events` Operation (MUSS)

Der Server MUSS die Operation `$events` unter `[base]/Subscription/[id]/$events` unterstützen,
um verpasste Ereignisse nachzuliefern.

Die Filterparameter `eventsSinceNumber` und `eventsUntilNumber` MÜSSEN dabei unterstützt werden.

```
GET [base]/Subscription/[id]/$events?eventsSinceNumber=5&eventsUntilNumber=10
```

#### 8. Fehler- und Statushandling (MUSS)

Bei einem nicht erreichbaren REST-Hook-Endpunkt MUSS der Server den `SubscriptionStatus` auf `error`
setzen. Der Client KANN per `$status` den Fehler prüfen und den Kanal reaktivieren.

---

### Workflow-Sequenzen

Der dargestellte Workflow orientiert sich am [Workflow](https://hl7.org/fhir/uv/subscriptions-backport/workflow.html#workflow-fhir-r4) des Subscription Backport Implementation Guide (R4) und fokussiert auf die für ISiK relevanten Aspekte und verpflichtenden Interaktionen.

#### Normalfluss

```mermaid
sequenceDiagram
    participant Client
    participant Endpoint as Client (REST-Hook Endpoint)
    participant Subscription Server

    rect rgb(230, 240, 255)
    note over Client,Endpoint: Client-System
    end

    Client->>Subscription Server: GET /metadata
    Subscription Server-->>Client: CapabilityStatement

    Client->>Subscription Server: POST /Subscription
    Subscription Server->>Endpoint: POST Handshake
    Endpoint-->>Subscription Server: HTTP 200 OK
    Subscription Server->>Subscription Server: Subscription.status = active

    loop solange Subscription aktiv ist
        alt relevantes Ereignis eingetreten
            Subscription Server->>Endpoint: POST Notification Bundle (history, id-only)
            Client->>Subscription Server: GET /[ResourceType]/[id]
            Subscription Server-->>Client: Resource
        else keine Notification innerhalb heartbeatPeriod
            Subscription Server->>Endpoint: POST Heartbeat Bundle
        end
    end
```

#### Fehlerfall

```mermaid
sequenceDiagram
    participant Client
    participant Endpoint as Client (REST-Hook Endpoint)
    participant Subscription Server

    rect rgb(230, 240, 255)
    note over Client,Endpoint: Client-System
    end

    loop solange Subscription aktiv und fehlerfrei ist
        Subscription Server->>Endpoint: POST Notification Bundle
        Endpoint-->>Subscription Server: HTTP 200 OK
    end

    Subscription Server->>Endpoint: POST Notification Bundle
    Endpoint-->>Subscription Server: Fehler / keine Antwort

    Subscription Server->>Subscription Server: set Subscription.status = error
    Note over Subscription Server,Endpoint: Weitere Notifications werden<br/> nicht regulär zugestellt

    Client->>Subscription Server: GET /Subscription/[id]/$status
    Subscription Server-->>Client: Status + Diagnose

    Client->>Endpoint: Endpunkt reaktivieren

    Client->>Subscription Server: PUT /Subscription/[id] (status=requested)
    Subscription Server->>Endpoint: POST Handshake
    Endpoint-->>Subscription Server: HTTP 200 OK
    Subscription Server->>Subscription Server: set Subscription.status = active

    Client->>Subscription Server: GET /Subscription/[id]/$events?eventsSinceNumber=X
    Subscription Server-->>Client: Event-Übersicht / Nachlieferung

    Client->>Subscription Server: GET /[ResourceType]/[id]
    Subscription Server-->>Client: Resource

    loop Normalbetrieb
        Subscription Server->>Endpoint: POST Notification Bundle
        Endpoint-->>Subscription Server: HTTP 200 OK
    end
```

---

### Sicherheit

#### Grundprinzipien (MUSS)

- **id-only Payload in Notifications (MUSS)**: Benachrichtigungen enthalten die ID(s) der
  geänderten Ressourcen, aber keine vollständigen FHIR Ressourcen. Clients rufen die Ressource nach
  Erhalt der Notification gezielt per ID ab (Pull-Prinzip). Der Wert `full-resource` ist nicht
  zulässig.

- **Keine Secrets in Subscription-Ressourcen**: In `Subscription.channel.header` DÜRFEN keine
  Klartext-Secrets dauerhaft gespeichert sein. Secrets sind bei Erstellung/Aktualisierung einmalig
  übermittelbar (Write-Only). Bei READ-Interaktionen MUSS der Server den Header-Wert maskieren
  (z.B. `Authorization: Basic ****last5`).

#### Autorisierung des REST-Hook-Endpunkts (OPTIONAL)

Da keine Payload in Notifications übertragen wird, ist die Authentifizierung des Empfängers optional.
Wenn genutzt, erfolgt sie über HTTP Basic Authentication mit einem statischen Secret in
`Subscription.channel.header`. Das Secret wird bei der Anlage einmalig angegeben und kann nicht
im Klartext ausgelesen werden.
