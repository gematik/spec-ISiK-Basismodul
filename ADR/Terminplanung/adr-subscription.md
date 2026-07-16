ADR-002: Subscriptions zur Abbildung eines Terminupdates durch Termin-Repositories

Datum: 18.03.2026
Status: Vorgeschlagen
Ticket: PTDATA-2090

## Kontext

Im Termin-Repository (z. B. KIS) wird ein Termin abgesagt oder geaendert. Das Patientenportal muss darueber informiert werden, damit Patientinnen und Patienten die Aenderung zeitnah erhalten.

Das fachliche Vorgehen ist im IG bereits beschrieben (Use Cases, Schritte 6.2 und 7.2):
https://simplifier.net/guide/isik-terminplanung-stufe-5/Einfuehrung/UseCases/Interaktionen.page.md?version=current

Aktuell beschreibt die Spezifikation die technische Umsetzung nur rudimentaer:

"Fuer einen Push-Mechanismus wird auf FHIR Subscriptions verwiesen. Die vorliegende Spezifikation macht jedoch KEINE Vorgaben fuer die Verwendung einer solchen Methodik."

Damit besteht derzeit keine verpflichtende Anforderung an Termin-Repositories, ein interoperables Push-Verfahren fuer Terminabsagen oder Terminaenderungen anzubieten.

## Optionen

1. Status quo beibehalten
	- Subscriptions bleiben unverbindlich.
	- Technische Ausgestaltung bleibt den Implementierungen ueberlassen.
2. Empfehlungen praezisieren, aber nicht verpflichten
	- Topics und Ablauf werden dokumentiert, bleiben jedoch optional.
	- Interoperabilitaet verbessert sich nur teilweise.
3. Verbindliche Subscription-Umsetzung fuer Stufe 6
	- Definition standardisierter SubscriptionTopics fuer Terminabsage und Terminaenderung.
	- Verpflichtende Umsetzung durch Termin-Repositories ueber eine zusaetzliche Rolle.
	- Profilierung der Subscription inklusive minimalem ValueSet nur mit den definierten Topic-Codes.

## Entscheidung

Fuer Stufe 6 wird Option 3 vorgeschlagen.

Es werden zwei SubscriptionTopics definiert:

- `appointment-cancel` fuer Terminabsagen
- `appointment-update` fuer Terminaenderungen

Die Umsetzung dieser Topics wird fuer Termin-Repositories verpflichtend gemacht, indem eine eigene Rolle am Akteur TerminRepository ergaenzt wird.

Zusaetzlich wird ein abgeleitetes Subscription-Profil erstellt, das ein minimales ValueSet mit genau diesen beiden Topic-Codes verwendet.

Der technische Ablauf wird im IG konkret beschrieben. Insbesondere wird festgelegt, dass Patientenportale sich beim Termin-Repository registrieren muessen, um Push-Benachrichtigungen zu erhalten.


## Konsequenzen

- Termin-Repositories muessen eine interoperable Push-Mechanik ueber FHIR Subscriptions bereitstellen.
- Patientenportale erhalten eine klare technische Integrationsvorgabe zur Registrierung und zum Empfang von Ereignissen.
- Die Interoperabilitaet zwischen Repository und Portal steigt, da Ereignisse fuer Absage und Aenderung standardisiert sind.
- Der Implementierungsaufwand bei Repositories steigt durch neue Rolle, Profilumsetzung und Betriebsaspekte.


## Anhänge (optional)

- Ticket: PTDATA-2090
- IG Use Cases (Stufe 5), Schritte 6.2 und 7.2:
  https://simplifier.net/guide/isik-terminplanung-stufe-5/Einfuehrung/UseCases/Interaktionen.page.md?version=current

