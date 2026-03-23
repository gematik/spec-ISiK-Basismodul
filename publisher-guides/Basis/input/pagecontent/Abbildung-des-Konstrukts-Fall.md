---
topic: Fall
---

### Der Begriff "Fall" im Kontext von FHIR

Der Begriff "Fall" gruppiert im Sprachgebrauch verschiedene Konzepte, die in FHIR durch unterschiedliche Ressourcen repräsentiert werden:

* **Aufenthalt/Besuch/Kontakt (Encounter):**
Der stationäre Aufenthalt oder der ambulante Kontakt eines Patienten in einer Gesundheitseinrichtung wird in FHIR durch die [Ressource Encounter](https://hl7.org/fhir/R4/encounter.html) abgebildet.

* **Abrechnungsfall (Account):**
Der Fall, im Sinne einer Gruppierung von medizinischen Leistungen, die in einem gemeinsamen Kontext abgerechnet werden, sind in FHIR durch die [Ressource Account](https://hl7.org/fhir/R4/account.html) repräsentiert. Ein Abrechnungsfall kann mehrere Encounter umfassen (z.B. vorstationärer Besuch, stationärer Aufenthalt und nachstationäre Besuche)
<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Encounter-Modell-Abrechnung.png" alt="Fall Abbildung generisch" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong>Generische Fall Abbildung </figcaption>
</figure>

* **Medizinischer Fall (EpisodeOfCare):**
Der medizinische Fall gruppiert Informationen, die im Kontext einer gemeinsamen (Dauer-)Diagnose stehen und wird in FHIR durch die [Ressource EpisodeOfCare](https://hl7.org/fhir/R4/episodeofcare.html) dargestellt.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Encounter-Modell-Medizinisch.png" alt="Fall Abbildung generisch" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong>Generische Fall Abbildung </figcaption>
</figure>

Wichtig ist die Herausstellung, dass "Besuch" und "Fall" wechselseitig keine synonymen Begriffe sind. 

---

### Der Begriff "Fall" im Kontext der Medizininformatik-Initiative
In dem [von der Medizininformatik-Initiative zur Kontaktverfolgung (Infektionsketten) des Patienten entworfenen Modell](https://simplifier.net/guide/mii-ig-modul-fall-2025/MIIIGModulFall/BeschreibungModul/EinfachesAufbaumodell.page.md) wird der Encounter in drei verschiedenen Ebenen verwendet:

* **Einrichtungskontakt:**
Als Kontakt eines Patienten mit einer Einrichtung (z.B. Klinik) gruppiert mehrere Besuche bei einer Einrichtung als gemeinsamen Behandlungskontext.

* **Abteilungskontakt:**
Als Kontakt des Patienten mit einer Fachabteilung eines Krankenhauses (z.B. einer Ambulanz oder einer stationären Fachabteilung).

* **Versorgungsstellenkontakt:** 
Als Kontakt des Patienten mit konkreten Servicestellen, wie z.B. Radiologie oder Endoskopie

Zur Unterscheidung der verschiedenen Kontaktebenen wird in der MI-I eine Kodierung in `Encounter.type` verwendet. Die Hierarchie der Encounter wird über die `Encounter.partOf`-Relation hergestellt. Ambulante Besuche werden in dem Modell derzeit noch nicht berücksichtigt.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Encounter-Modell-MII.png" alt="MII Fall Abbildung" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong>Fall Abbildung MII</figcaption>
</figure>


---

### Der Begriff "Fall" im Kontext der ISiK-Spezifikation

Für die derzeitige Ausbaustufe des ISiK Basismoduls werden alle zuvor genannten Sichtweise und Modelle berücksichtigt:

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Encounter-Modelle.png" alt="Encounter Modelle" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong>Encounter Modelle</figcaption>
</figure>

Verpflichtend umzusetzen ist für die bestätigungsrelevanten Systeme der Account, im Sinne der Gruppierung einzelner Besuche, zu einem gemeinsamen (Abrechnungs-)Fall sowie der Encounter der Ebene "Abteilungskontakt" im Sinne des Modells der Medizininformatikinitiative.

Herstellern steht es frei, weitere Ressourcen, wie zum Beispiel die EpisodeOfCare oder den Encounter, im Sinne des Einrichtungskontaktes bzw. des Versorgungsstellenkontaktes, zu implementieren.

Wichtig sind dabei jedoch folgende Punkte zu beachten:

* Encounter im ISiK-Kontext sind stets als "Abteilungskontakte", im Sinne der MI-I mit dem entsprechenden `Encounter.type`-Code, zu kennzeichnen.
* Jegliche im ISiK-Basis-Modul, als auch in anderen ISiK-Modulen definierte Ressourcen, die über einen Encounter-Kontext verfügen, müssen auf einen ISiK-Encounter (Abteilungskontakt) referenzieren.
* Bei optionaler Implementierung eines "Einrichtungskontaktes" nach dem MII-Modell ist zu beachten, dass `Encounter.partOf` in ISiK nicht als "Must Support" markiert ist. Systeme können daher nicht verlässlich davon ausgehen, dass diese Beziehung zur Herstellung der Encounter-Hierarchie zwischen Einrichtungs- und Abteilungskontakt vorhanden ist.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Encounter-Modell-ISiK.png" alt="ISiK Fall Abbildung" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong>Fall Abbildung ISiK</figcaption>
</figure>

---

### Die Repräsentation der "Fall"-Nummer

Die "Fall"-Nummer ist ein im Kontext der stationären Versorgung häufig verwendetes Vehikel, um (insbesondere in der HL7-V2-Kommunikation) mit einfachen Mitteln den Fallkontext medizinischer Dokumentationen herzustellen.

In den meisten Fällen handelt es sich bei der "Fall"-Nummer um einen eindeutigen Identifier des Abrechnungsfalls. 
Im ISiK-Kontext ist die Fallnummer daher als Identifier des Accounts zu sehen und nicht geeignet, einen Encounter eindeutig zu identifizieren und damit den für FHIR-Ressourcen erforderlichen Encounter-Kontext zu etablieren.
Es müssen zusätzliche Kriterien, wie z.B. Zeitraum(`Encounter.period`), Fallart (`Encounter.class`) oder Status (`Encounter.status`) berücksichtigt werden, um den korrekten Encounter zu finden.

ISiK berücksichtigt jedoch die gängige Praxis, dass die Fallnummer als primäres Suchkriterium verwendet wird; auch von Systemen, die rein der medizinischen Versorgung dienen und keine Abrechnungsfunktionen implementieren. 
Um insbesondere Subsysteme von der Pflicht zu entbinden, die Account-Ressource zu implementieren, nur um Zugriff zur Fallnummer zu bekommen, ist das Mitführen des Account-Identifiers als logische Referenz auf den Account im Encounter verpflichtend. Die Fallnummer eines Encounters kann daher auch ohne Kenntnis des Accounts ermittelt werden.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Encounter-Modell-Fallnummer.png" alt="Repräsentation Fallnummer" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung:</strong>Repräsentation der Fallnummer</figcaption>
</figure>


---

### Abfrage von "Fall"-Daten über FHIR-Search

Im ISiK-Modell sind klinische Ressourcen an Abteilungskontakte geknüpft. Die Abfrage von klinischen Daten erfolgt daher in der Regel in einem zwei-Schritt-Prozess:

1. **Ermittlung der relevanten Encounter** anhand der Abrechnungsfallnummer
2. **Abfrage der klinischen Ressourcen** über die ermittelten Encounter-Referenzen

Dieser Ansatz gewährleistet, dass klinische Daten eindeutig dem korrekten Abteilungskontakt zugeordnet werden können und berücksichtigt, dass ein Abrechnungsfall mehrere Abteilungskontakte umfassen kann.

---

#### Schritt 1: Ermittlung der relevanten Encounter

Die Basis-Abfrage für alle zu einem Abrechnungsfall gehörenden Encounter erfolgt über den `account:identifier` Suchparameter:

```http
GET [BASE_URL]/Encounter?account:identifier=http://example.org/fhir/sid/fallnummer|F-2024-123456
```

Diese Abfrage liefert alle Encounter, die mit dem Account verknüpft sind, der die angegebene Fallnummer trägt.

##### Optionale Filter

Je nach Anwendungsfall können zusätzliche Filter verwendet werden, um die Ergebnismenge einzuschränken:

**Einschränkung auf Abteilungskontakte** (empfohlen für Systeme, die zusätzliche Encounter-Typen implementieren):

```http
GET [BASE_URL]/Encounter?account:identifier=http://example.org/fhir/sid/fallnummer|F-2024-123456
    &type=http://fhir.de/CodeSystem/Kontaktebene|abteilungskontakt
```

**Ausschluss vor- und nachstationärer Kontakte**:

```http
GET [BASE_URL]/Encounter?account:identifier=http://example.org/fhir/sid/fallnummer|F-2024-123456
    &type=http://fhir.de/CodeSystem/kontaktart-de|normalstationaer
```

Oder für Intensivkontakte:

```http
GET [BASE_URL]/Encounter?account:identifier=http://example.org/fhir/sid/fallnummer|F-2024-123456
    &type=http://fhir.de/CodeSystem/kontaktart-de|intensivstationaer
```

**Kombination mehrerer Kontaktarten**:

```http
GET [BASE_URL]/Encounter?account:identifier=http://example.org/fhir/sid/fallnummer|F-2024-123456
    &type=http://fhir.de/CodeSystem/kontaktart-de|normalstationaer,http://fhir.de/CodeSystem/kontaktart-de|intensivstationaer
```

**Einschränkung auf aktive Encounter**:

```http
GET [BASE_URL]/Encounter?account:identifier=http://example.org/fhir/sid/fallnummer|F-2024-123456
    &status=in-progress
```

**Zeitliche Einschränkung**:

```http
GET [BASE_URL]/Encounter?account:identifier=http://example.org/fhir/sid/fallnummer|F-2024-123456
    &date=ge2024-01-01&date=le2024-12-31
```

---

#### Schritt 2: Abfrage der klinischen Ressourcen

Nach der Ermittlung der relevanten Encounter können alle klinischen Ressourcen über die Encounter-Referenzen abgerufen werden. Die Encounter-IDs aus Schritt 1 werden dabei als Suchparameter verwendet.

##### Beispiel: Ermittlung aller Diagnosen

Angenommen, die Abfrage aus Schritt 1 hat folgende Encounter-IDs zurückgeliefert: `Encounter/123`, `Encounter/456`, `Encounter/789`

```http
GET [BASE_URL]/Condition?encounter=Encounter/123,Encounter/456,Encounter/789
```

##### Beispiel: Ermittlung aller Prozeduren

```http
GET [BASE_URL]/Procedure?encounter=Encounter/123,Encounter/456,Encounter/789
```

##### Beispiel: Ermittlung aller Observations (z.B. Vitalparameter)

```http
GET [BASE_URL]/Observation?encounter=Encounter/123,Encounter/456,Encounter/789
```

##### Beispiel: Ermittlung aller Medikationsverordnungen

```http
GET [BASE_URL]/MedicationRequest?encounter=Encounter/123,Encounter/456,Encounter/789
```

---

#### Vollständiges Beispiel-Szenario

Ein typischer Workflow für die Abfrage aller Diagnosen eines Abrechnungsfalls könnte wie folgt aussehen:

**1. Ermittlung der Encounter:**

```http
GET [BASE_URL]/Encounter?account:identifier=http://krankenhaus-beispiel.de/fhir/sid/fallnummer|F-2024-123456
    &type=http://fhir.de/CodeSystem/Kontaktebene|abteilungskontakt
```

**Antwort (vereinfacht):**

```json
{
  "resourceType": "Bundle",
  "type": "searchset",
  "entry": [
    {
      "resource": {
        "resourceType": "Encounter",
        "id": "enc-innere-medizin",
        "class": { "code": "IMP" },
        "type": [
          {
            "coding": [
              {
                "system": "http://fhir.de/CodeSystem/Kontaktebene",
                "code": "abteilungskontakt"
              }
            ]
          }
        ],
        "serviceType": {
          "coding": [
            {
              "system": "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel",
              "code": "0100",
              "display": "Innere Medizin"
            }
          ]
        }
      }
    },
    {
      "resource": {
        "resourceType": "Encounter",
        "id": "enc-intensivmedizin",
        "class": { "code": "IMP" },
        "type": [
          {
            "coding": [
              {
                "system": "http://fhir.de/CodeSystem/Kontaktebene",
                "code": "abteilungskontakt"
              }
            ]
          }
        ],
        "serviceType": {
          "coding": [
            {
              "system": "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel",
              "code": "3600",
              "display": "Intensivmedizin"
            }
          ]
        }
      }
    }
  ]
}
```

**2. Abfrage der Diagnosen für alle ermittelten Encounter:**

```http
GET [BASE_URL]/Condition?encounter=Encounter/enc-innere-medizin,Encounter/enc-intensivmedizin
```

Dieser zwei-Schritt-Prozess stellt sicher, dass alle relevanten klinischen Daten eines Abrechnungsfalls korrekt ermittelt werden, auch wenn der Patient während des Aufenthalts mehrere Fachabteilungen durchlaufen hat.

---

#### Wichtige Hinweise

* Vor (fast) jeder Abfrage klinischer Ressourcen sollte Schritt 1 ausgeführt werden, um sicherzustellen, dass alle aktuellen Abteilungskontakte berücksichtigt werden.
* Es gibt Abfragen von klinischen Ressourcen, bei denen eine Einschränkung auf den Fall über die Encounter-Referenzen nicht sinnvoll ist, bspw. die Abfrage von Allergien. In diesen Fällen kann direkt über die Patient-Referenz abgefragt werden, ohne die Encounter-IDs zu berücksichtigen.
* Die Anzahl der Encounter-Referenzen in Schritt 2 kann je nach Komplexität des Falls variieren. Bei Patienten mit vielen Abteilungswechseln kann die Liste entsprechend länger werden.
* Bestätigungsrelevante Systeme müssen den `account:identifier` Suchparameter für Encounter unterstützen.
* Die Fallnummer ist im `Encounter.account.identifier` als logische Referenz verpflichtend mitzuführen, auch wenn die Account-Ressource selbst vom anfragenden System nicht implementiert wird.
* Eine Abfrage mit Chaining über den Encounter zum Account.identifier ist zwar theoretisch möglich, wird aber im Kontext von ISiK nicht als MUSS-Kriterium definiert, da die meisten Systeme die direkte Suche über `account:identifier` unterstützen werden. Der `:identifier`-Modifier ist wiederum nicht für Chaining unterstützt.

