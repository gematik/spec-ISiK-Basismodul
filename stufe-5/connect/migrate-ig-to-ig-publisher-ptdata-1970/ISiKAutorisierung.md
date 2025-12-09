# Autorisierung - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Autorisierung**

## Autorisierung

# ISiK-Connect: Autorisierung

-------

### Normativ

-------

ISiK-Connect konkretisiert in der aktuellen Stufe die Anforderungen an eine Autorisierung zur Absicherung eines ISiK-konformen FHIR-Endpunkts. Die normativen Vorgaben beschränken sich zunächst auf Ressourcen-Server, die ein ISiK-relevantes FHIR RESTful API bereitstellen (‘ISiK-Ressourcen-Server’), d. h. die auch bereits für andere Teile von ISiK bestätigungsrelevant sind. In zukünftigen Ausbaustufen werden weitere Bausteine zur Umsetzung eines vollständigen Autorisierungssystems sowie zu weiteren Themen der Konnektivität wie z. B. Protokollierung und Authentisierung spezifiziert.

| | |
| :--- | :--- |
| **Hinweis an IT-Verantwortliche** |   |
| ![](https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/piktogramme/Ampel%20auf%20Rot_Blau_gematik.svg) | **ISiK-Ressourcen-Server kein Standalone:**Die beschriebenen Autorisierungsszenarien funktionieren nur, wenn der ISiK-Ressourcenserver entweder gleichzeitig die Anforderungen eines ISiK-Autorisierungsservers erfüllt oder an einen Autorisierungsserver gekoppelt ist, der ISiK-Anforderungen erfüllt (Rolle ISiK-Autorisierungsserver). Dies ist bei der Integration von lokalen Systemen (z.B. eines zentralen Autorisierungsservers zu beachten). |

# Zugriffsrechte und Compartments

ISiK-Connect schreibt Mechanismen für den Austausch und die Kodierung von Autorisierungen fest. Die Autorisierungen selbst instanziieren im Krankenhaus vergebene Berechtigungen für einen Zugriff einer Person auf eine geschützte Ressource (z.B. “Der zugreifende Nutzer darf Observation-Ressourcen des Patienten mit der ID 123 suchen und abrufen.”). Autorisierungen werden in dem ISiK-Connect zugrunde liegenden Bild einer IT-Infrastruktur durch einen Autorisierungsserver im Ergebnis der Prüfung festgelegter Berechtigungen vergeben. Diese Berechtigungen wiederum leiten sich aus generellen Sicherheitsregeln des Krankenhauses, Rollendefinitionen, durch Patienten gegebene Einwilligungen und weiteren Vorgaben ab. Im ISiK zugrundeliegenden Bild erfolgt die Verwaltung von Berechtigungen über einen **Policy Administration Point**.

ISiK-Connect nutzt für die Kodierung und Durchsetzung von Autorisierungen drei Konzepte aus FHIR bzw. **SMART on FHIR**:

* Kontext
* **Compartment**
* **Scope**

**Scopes** und **Compartements** sind Teil eines Kontexts und können zueinander in Bezug stehen.

## Kontexte

Jeder Zugriff auf eine geschützte Ressource erfolgt im Kontext eines Patienten, eines Behandlungsfalls oder einer anderen Ressource. Der Kontext wird vom aufrufenden Client “mitgebracht” und stellt den Bezugspunkt für alle anderen Berechtigungsinformationen dar. Aus Sicht des Clients stellt dieser Kontext den “aktuellen Patienten”, den “aktuellen Fall”, etc. dar.

Beispiel: Der Nutzer hat in/aus der ISiK-Clientanwendung den Patienten “123” geöffnet und möchte nun Daten zu diesem Patienten verarbeiten, zu deren Abruf eine Autorisierung erforderlich ist. Der Zugriffskontext der Autorisierung ist der Patient “123”. Alle anwendbaren Zugriffsrechte (s.u.) beziehen sich auf den Patienten “123”. Das **Patient**-Compartment beschreibt, wie der ISiK-Ressourcen-Server validieren kann, dass eine Ressource (z. B. eine **Observation**) im Kontext des Patienten “123” steht.

ISiK-konforme Ressourcenserver MÜSSEN die beim Aufruf eines RESTful API in einem Zugriffstoken empfangene Kontext- und Autorisierungsinformationen auswerten und anwenden können ().

ISiK-Connect macht derzeitig keine Vorgabe, wie ein Client in einen bestimmten Kontext gestellt wird (**SMART on FHIR** sieht hierfür z. B. die auf der Seite skizzierten Mechanismen eines **EHR Launch** bzw. eines **Standalone Launch** vor, bei dem ein Kontext als **Launch Context** an eine andere Anwendung übergeben/vererbt wird und dabei weiter eingeschränkt werden kann).

## Compartments

Autorisierungen können in FHIR an eine ‘Fokus’-Ressource gebunden werden, z. B. eine ‘Patient’-Ressource (“Zugriff auf Daten zum Patienten 123”). Um die ‘Fokus’-Ressource herum gruppieren sich weitere Ressourcen, die mit dieser in einer Beziehung stehen, z. B. im Fall der ‘Patient’-Ressource die dem Patienten zugeordneten Beobachtungen, Diagosen/Probleme, Termine, Behandlungspläne, etc. In FHIR werden diese Gruppierungen über Ressourcen vom Ressourcentyp [**CompartmentDefinition**](https://hl7.org/fhir/R4/compartmentdefinition.html) festgelegt. Diese definiert die Elemente einer Ressource, die die Bindung zu der ‘Fokus’-Ressource herstellen.

Beispiel: Für den Ressourcentyp [**Condition**](https://hl7.org/fhir/R4/condition.html) legt die [**CompartmentDefinition**der**Patient**-Ressource](https://hl7.org/fhir/R4/compartmentdefinition-patient.html) die Elemente ‘Condition.patient’ und ‘Condition.participant-actor’ als verbindende Elemente fest. Eine Autorisierung für den Zugriff auf Patientendaten im Kontext des Patienten “123” umfasst damit grundsätzlich nur ‘Condition’-Ressourcen, deren ‘subject’- oder ‘participant-actor’-Element auf den Patienten “123” verweist.

ISiK-Ressourcen-Server MÜSSEN zumindest Autorisierungen mit Bezug zu der in FHIR definierten **Compartment**-Definition für ‘Patient’-Ressourcen verarbeiten können ().

## Zugriffsrechte auf Ressourcen

In dem von **SMART on FHIR** profilierten **OAuth2**-Standard legen sog. **Scopes** die spezifischen Aktionen und/oder Daten fest, auf die eine Client-Anwendung in Vertretung eines Benutzers zugreifen bzw. diese manipulieren kann. Z.B. kann ein **Scope** die Benutzerberechtigung zum Zugriff auf **Observation**-Ressourcen an eine Clientanwendung delegieren und diesem damit die Möglichkeit geben, ‘Observation’-Ressourcen zu einem Patienten von einem ISiK-Ressourcen-Server abzurufen.

**Scopes** werden vom API-Anbieter - im Fall von ISiK dem ISiK-Ressourcen-Server - definiert und von dem zugreifenden Client während des Autorisierungsprozesses über den Autorisierungsserver angefordert. Sofern die Auswertung der anwendbaren Berechtigungsregeln durch den Autorisierungsserver die angeforderten **Scopes** bestätigt, wird dem Client ein Zugriffstoken (**Access Token**) ausgestellt, das die anwendbaren **Scopes** enthält. Der Client kann anschließend das Zugriffstoken verwenden, um für den berechtigten Nutzer im Rahmen der durch die **Scopes** bestätigten Rechtedelegation auf die geschützten Ressourcen eines ISiK-Ressourcenservers zuzugreifen.

FHIR-Ressourcenservern MÜSSEN (ggf. im Zusammenspiel mit vorgelagerten **API Gateways** oder **Reverse Proxies**) die in SMART-on-FHIR definierte Syntax für die Bestätigung von **Scopes** verarbeiten und die mit den **Scopes** ausgedrücken Berechtigungsdelegationen zur Absicherung ihrer RESTful-Schnittstellen anwenden können ().

## Zusammenspiel von Kontexten, Compartments und Zugriffsrechten auf Ressourcen

**Compartments** grenzen ab, auf welche mit einer ‘Fokus’-Ressource gruppierten Ressourcen ein Client überhaupt zugreifen kann. Welche Ressource konkret den ‘Fokus’ darstellt, wird über den Kontext bestimmt. Über **Scopes** bestätigte Zugriffsrechte grenzen ein, auf welchen der mit der ‘Fokus’-Ressource gruppierten Ressourcen der Client welche Operationen ausführen darf.

Beispiel: Der aus Sicht des Clients aktuelle Patient ist der Patient “123”. Dieser ist hiermit auch der Kontext der Autorisierung. Die Kombination aus der **CompartmentDefinition** für die ‘Patient’-Ressource und dem Zugriffsrecht ‘patient/Observation.r’ legt fest, dass der Client nur lesend und nur auf ‘Observation’-Ressourcen zugreifen darf, die über ‘Observation.subject’ oder ‘Observation.performer’ dem Patienten “123” zugeordnet sind.

## Zugriffstoken: Beispiel

Zugriffstoken werden als Base64-kodierte **JSON Web Token (JWT)** ausgetauscht.

Beispiel:

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXRpZW50IjoiODdhMzM5ZDAtOGNhZS00MThlLTg5YzctODY1MWU2YWFiM2M2IiwidG9rZW5fdHlwZSI6ImJlYXJlciIsInNjb3BlIjoicGF0aWVudC9PYnNlcnZhdGlvbi5ycyBwYXRpZW50L1BhdGllbnQucnMiLCJjbGllbnRfaWQiOiJraHpnX3BvcnRhbCIsImlhdCI6MTY4MTQ1OTIwMCwiZXhwIjoxNjgxNDU5ODAwfQ.NyA2LO9u17mZRXz4yP6uUvibuhpjVo5uLslXo2U4DOA

```

Nach der Dekodierung werden die im Token gekapselten Autorisierungsinformationen erkennbar:

```
{
  "alg": "HS256",
  "typ": "JWT"
}
{
  "patient": "87a339d0-8cae-418e-89c7-8651e6aab3c6",
  "token_type": "bearer",
  "scope": "patient/Observation.rs patient/Patient.rs",
  "client_id": "khzg_portal",
  "iat": 1681459200,
  "exp": 1681459800
}

```

Das Zugriffstoken in dem Beispiel gewährt Lese- und Such-Zugriffe auf die ‘Patient’-Ressource und ‘Observation’-Ressourcen des Patienten mit der **id** ‘87a339d0-8cae-418e-89c7-8651e6aab3c6’. Das Token wurde am 14. April 2023 10:00 Uhr (Mitteleuropäische Sommerzeit) ausgestellt und ist ab diesem Zeitpunkt 10 Minuten lang gültig.

## Implementierungshinweise für ISiK-Ressourcenserver

Die oben genannten Anforderungen für einen ISiK-Ressourcenserver bedeuten nicht zwangsläufig, dass ein solcher Server stets einen eigenen Autorisierungsserver als Teil des Gesamtsystems besitzen muss. Es ist auch möglich, die Gültigkeit eines Tokens sowie die Informationen über die erlaubten Scopes und verwendeten Kontexte über [OAuth 2.0 Token Introspection, per RFC 7662](https://datatracker.ietf.org/doc/html/rfc7662) zu erlangen. Auf Basis der Antwort des Autorisierungsservers kann der ISiK-Ressourcenserver über die Herausgabe von FHIR-Ressourcen an einen Client entscheiden. Dies impliziert, dass es möglich ist, einen ISiK-Ressourcenserver an einen (im Krankenhaus) zentralen Autorisierungsserver anzubinden.

Für Implementierungsdetails siehe [SMART App Launch - Token Introspection](https://hl7.org/fhir/smart-app-launch/STU2.2/token-introspection.html). Um die Anforderungen `und` umzusetzen, können ISiK-Ressourcenserver für jeden abgesicherten FHIR REST API-Aufruf die Token-Informationen an den Token Introspection Endpunkt weiterleiten, um die Validität des Tokens zu überprüfen sowie gleichzeitig die relevanten dekodierten Informationen zur Durchsetzung der Autorisierungseinschränkungen zu erhalten. Es sei darauf hingewiesen, dass diese Variante die einzige ist, um Tokens sofort benutzerseitig invalidieren zu können.

Für den Fall, dass ein Autorisierungsserver ein JSON Web Token (JWT) ausstellt, kann ein Ressourcenserver die Gültigkeit des Tokens mittels der öffentlichen Schlüssel, welche durch den Autorisierungsserver in einem `.well-known/openid-configuration` Dokument via einer JWKS URI bereitgestellt werden, überprüfen. Siehe [RFC 8414 – Authorization Server Metadata](https://datatracker.ietf.org/doc/html/rfc8414#section-2).

