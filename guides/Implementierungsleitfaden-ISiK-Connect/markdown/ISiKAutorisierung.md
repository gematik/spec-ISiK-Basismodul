# ISiK-Sicherheit: Autorisierung

ISiK-Sicherheit konkretisiert in der aktuellen Stufe 3 von ISiK die Anforderungen an eine Autorisierung zur Absicherung eines ISiK-konformen FHIR-Endpunkts. Die normativen Vorgaben beschränken sich zunächst auf Ressourcenserver, die ein ISiK-relevantes FHIR RESTful API bereitstellen ('ISiK-Ressourcenserver'), d. h. die auch bereits für andere Teile von ISiK bestätigungsrelevant sind. In zukünftigen Ausbaustufen werden weitere Bausteine zur Umsetzung eines vollständigen Autorisierungssystems sowie zu weiteren Sicherheitsthemen wie z. B. Protokollierung und Authentisierung spezifiziert. 

# Zugriffsrechte und Compartments

ISiK-Sicherheit schreibt Mechanismen für den Austausch und die Kodierung von Autorisierungen fest. Die Autorisierungen selbst instanziieren im Krankenhaus vergebene Berechtigungen für einen Zugriff einer Person auf eine geschützte Ressource (z.B. "Der zugreifende Nutzer darf Observation-Ressourcen des Patienten mit der ID 123 suchen und abrufen."). Autorisierungen werden in dem ISiK-Sicherheit zugrunde liegenden Bild einer IT-Sicherheitsinfrastruktur durch einen Autorisierungsserver im Ergebnis der Prüfung festgelegter Berechtigungen vergeben. Diese Berechtigungen wiederum leiten sich aus generellen Sicherheitsregeln des Krankenhauses, Rollendefinitionen, durch Patienten gegebene Einwilligungen und weiteren Vorgaben ab. Im ISiK zugrundeliegenden Bild erfolgt die Verwaltung von Berechtigungen über einen _Policy Administration Point_.  

ISiK-Sicherheit nutzt für die Kodierung und Durchsetzung von Autorisierungen drei Konzepte aus FHIR bzw. _SMART on FHIR_:
* Kontext
* _Compartment_ 
* _Scope_

 _Scopes_ und _Compartements_ sind Teil eines Kontexts und können zueinander in Bezug stehen.

## Kontexte

Jeder Zugriff auf eine geschützte Ressource erfolgt im Kontext eines Patienten, eines Behandlungsfalls oder einer anderen Ressource. Der Kontext wird vom aufrufenden Client "mitgebracht" und stellt den Bezugspunkt für alle anderen Berechtigungsinformationen dar. Aus Sicht des Clients stellt dieser Kontext den "aktuellen Patienten", den "aktuellen Fall", etc. dar.

Beispiel: Der Nutzer hat in/aus der ISiK-Clientanwendung den Patienten "123" geöffnet und möchte nun Daten zu diesem Patienten verarbeiten, zu deren Abruf eine Autorisierung erforderlich ist. Der Zugriffskontext der Autorisierung ist der Patient "123". Alle anwendbaren Zugriffsrechte (s.u.) beziehen sich auf den Patienten "123". Das _Patient_-Compartment beschreibt, wie der ISiK-Ressourcenserver validieren kann, dass eine Ressource (z. B. eine _Observation_) im Kontext des Patienten "123" steht.

ISiK-konforme Ressourcenservern MÜSSEN die beim Aufruf eines RESTful API in einem Zugriffstoken empfangene Kontext- und Autorisierungsinformationen auswerten und anwenden können.

ISiK-Sicherheit macht in der ISiK Stufe 3 keine Vorgabe, wie ein Client in einen bestimmten Kontext gestellt wird (_SMART on FHIR_ sieht hierfür z. B. die auf der Seite ["Übersicht"](Uebersicht.md) skizzierten Mechanismen eines _EHR Launch_ bzw. eines _Standalone Launch_ vor, bei dem ein Kontext als _Launch Context_ an eine andere Anwendung übergeben/vererbt wird und dabei weiter eingeschränkt werden kann). 

## _Compartments_

Autorisierungen können in FHIR an eine 'Fokus'-Ressource gebunden werden, z. B. eine 'Patient'-Ressource ("Zugriff auf Daten zum Patienten 123"). Um die 'Fokus'-Ressource herum gruppieren sich weitere Ressourcen, die mit dieser in einer Beziehung stehen, z. B. im Fall der 'Patient'-Ressource die dem Patienten zugeordneten Beobachtungen, Diagosen/Probleme, Termine, Behandlungspläne, etc. In FHIR werden diese Gruppierungen über Ressourcen vom Ressourcentyp [_CompartmentDefinition_]https://hl7.org/fhir/R4/compartmentdefinition.html) festgelegt. Diese definiert die Elemente einer Ressource, die die Bindung zu der 'Fokus'-Ressource herstellen. 

Beispiel: Für den Ressourcentyp [_Condition_]https://hl7.org/fhir/R4/condition.html) legt die [_CompartmentDefinition_ der _Patient_-Ressource]https://hl7.org/fhir/R4/compartmentdefinition-patient.html) die Elemente 'Condition.patient' und 'Condition.participant-actor' als verbindende Elemente fest. Eine Autorisierung für den Zugriff auf Patientendaten im Kontext des Patienten "123" umfasst damit grundsätzlich nur 'Condition'-Ressourcen, deren 'subject'- oder 'participant-actor'-Element auf den Patienten "123" verweist.  

ISiK-Ressourcenserver MÜSSEN zumindest Autorisierungen mit Bezug zu der in FHIR definierten _Compartment_-Definition für 'Patient'-Ressourcen verarbeiten können.

## Zugriffsrechte auf Ressourcen

In dem von _SMART on FHIR_ profilierten _OAuth2_-Standard legen sog. _Scopes_ die spezifischen Aktionen und/oder Daten fest, auf die eine Client-Anwendung in Vertretung eines Benutzers zugreifen bzw. diese manipulieren kann. Z.B. kann ein _Scope_ die Benutzerberechtigung zum Zugriff auf _Observation_-Ressourcen an eine Clientanwendung delegieren und diesem damit die Möglichkeit geben, 'Observation'-Ressourcen zu einem Patienten von einem ISiK-Ressourcenserver abzurufen.

_Scopes_ werden vom API-Anbieter - im Fall von ISiK dem ISiK-Ressourcenserver - definiert und von dem zugreifenden Client während des Autorisierungsprozesses über den Autorisierungsserver angefordert. Sofern die Auswertung der anwendbaren Berechtigungsregeln durch den Autorisierungsserver die angeforderten _Scopes_ bestätigt, wird dem Client ein Zugriffstoken (_Access Token_) ausgestellt, das die anwendbaren _Scopes_ enthält. Der Client kann anschließend das Zugriffstoken verwenden, um für den berechtigten Nutzer im Rahmen der durch die _Scopes_ bestätigten Rechtedelegation auf die geschützten Ressourcen eines ISiK-Ressourcenservers zuzugreifen. 

FHIR-Ressourcenservern MÜSSEN (ggf. im Zusammenspiel mit vorgelagerten _API Gateways_ oder _Reverse Proxies_) die in SMART-on-FHIR definierte Syntax für die Bestätigung von _Scopes_ verarbeiten und die mit den _Scopes_ ausgedrücken Berechtigungsdelegationen zur Absicherung ihrer RESTful-Schnittstellen anwenden können.

## Zusammenspiel von Kontexten, _Compartments_ und Zugriffsrechten auf Ressourcen

_Compartments_ grenzen ab, auf welche mit einer 'Fokus'-Ressource gruppierten Ressourcen ein Client überhaupt zugreifen kann. Welche Ressource konkret den 'Fokus' darstellt, wird über den Kontext bestimmt. Über _Scopes_ bestätigte Zugriffsrechte grenzen ein, auf welchen der mit der 'Fokus'-Ressource gruppierten Ressourcen der Client welche Operationen ausführen darf. 

Beispiel: Der aus Sicht des Clients aktuelle Patient ist der Patient "123". Dieser ist hiermit auch der Kontext der Autorisierung. Die Kombination aus der _CompartmentDefinition_ für die 'Patient'-Ressource und dem Zugriffsrecht 'patient/Observation.r' legt fest, dass der Client nur lesend und nur auf 'Observation'-Ressourcen zugreifen darf, die über 'Observation.subject' oder 'Observation.performer' dem Patienten "123" zugeordnet sind.


## Zugriffstoken: Beispiel

Zugriffstoken werden als Base64-kodierte _JSON Web Token (JWT)_ ausgetauscht. 

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

Das Zugriffstoken in dem Beispiel gewährt Lese- und Such-Zugriffe auf die 'Patient'-Ressource und 'Observation'-Ressourcen des Patienten mit der _id_ '87a339d0-8cae-418e-89c7-8651e6aab3c6'. Das Token wurde am 14. April 2023 10:00 Uhr (Mitteleuropäische Sommerzeit) ausgestellt und ist ab diesem Zeitpunkt 10 Minuten lang gültig.