Profile: ISiKMedikationsListe
Parent: List
Id: ISiKMedikationsListe
Title: "ISiK Medikationsliste"
Description: """Dieses Profil ermöglicht die Zusammenführung einzelner MedikationsInformationen eines Patienten in ISiK Szenarien.

Die MedicationList verweist auf MedicationStatement-Ressourcen und bildet Medikationen ab, die aktuell eingenommen, im Krankenhaus verabreicht oder aus externen Quellen dokumentiert wurden - etwa durch Patientenangaben, Medikationspläne oder Entlassbriefe.
Im Unterschied zum eMP der ePA ist die ISiK-MedikationsListe dynamisch generierbar und systemseitig aktualisierbar. Sie kann auch Informationen enthalten, die außerhalb des eigenen Hauses erfasst wurden – sofern diese dem System strukturiert vorliegen (z.B. durch eMP-Import).
Die Medikationsliste verweist auf MedicationStatement-Ressourcen und bildet Medikationen ab, die aktuell eingenommen, im Krankenhaus verabreicht oder aus externen Quellen dokumentiert wurden - etwa durch Patientenangaben, Medikationspläne oder Entlassbriefe.

Die Wahl von 'List.mode' richtet sich danach, ob die Liste als dokumentierter Zustand oder als Arbeitsgrundlage verwendet wird.
Pro Patient und fachlichem Kontext (z. B. Behandlungskontext) sollte in der Regel nur eine aktiv gepflegte Medikationsliste ('List.mode = working' und 'List.status = current') geführt werden.  Expand commentComment on line R10Resolved
Dies dient der Vermeidung konkurrierender Listen und stellt eine eindeutige fachliche Referenz sicher. Mehrere parallele Listen können in unterschiedlichen Kontexten oder für unterschiedliche Zwecke existieren, sollten jedoch klar voneinander abgegrenzt sein.

Im Unterschied zum eMP der ePA ist die ISiK-MedikationsListe dynamisch generierbar und systemseitig aktualisierbar. Sie kann auch Informationen enthalten, die außerhalb des eigenen Hauses erfasst wurden - sofern diese dem System strukturiert vorliegen (z.B. durch eMP-Import).
Ein Import aus dem eMP ist möglich, aber nicht verpflichtend.

### Fachliche Guidance zu `List.mode` in `ISiKMedikationsListe`Expand commentComment on line R1Resolved

Für die Ressource `ISiKMedikationsListe` wird `List.mode` zur fachlichen Einordnung des Charakters der Medikationsliste verwendet.Expand commentComment on line R3Resolved
Expand commentComment on lines R1 to R4Resolved
* `snapshot`: abgeschlossene, zu einem bestimmten Zeitpunkt gültige Momentaufnahme der MedikationExpand commentComment on line R5Resolved
* `working`: aktiv gepflegte oder fortlaufend weiterbearbeitete Medikationsliste

#### Typische Anwendungsszenarien

**Aufnahmemedikation**

Bei Aufnahme wird die Medikation aus verschiedenen Quellen (z. B. Patientenangaben, Vorbefunde, ePA) zusammengeführt und als Medikationsliste dargestellt.

Typischerweise:
- `working`, wenn die Liste im Behandlungsverlauf weitergeführt wird
- `snapshot`, wenn der Stand zum Aufnahmezeitpunkt dokumentiert wird

**Entlassmedikation**

Die Entlassmedikation beschreibt den Medikationsstand zum Zeitpunkt der Entlassung.

Typischerweise:
- `snapshot` (Dokumentation eines abgeschlossenen Zustands)

**Bericht des Patienten**

Vom Patienten berichtete Medikation wird als Medikationsliste zusammengeführt.

Typischerweise:
- `snapshot`, wenn die Angaben als dokumentierter Stand übernommen werden
- `working`, wenn die Angaben in eine fortgeführte Medikationsliste einfließen

**ePA / externe Quellen**

Medikationsinformationen aus externen Quellen werden in die Liste integriert.

Typischerweise:
- `snapshot`, bei unveränderter Übernahme eines dokumentierten Stands
- `working`, bei Integration in eine fortgeschriebene Liste

**Ableitung aus Verordnungen**

Verordnungen (`MedicationRequest`) können als Grundlage für die Ableitung von `MedicationStatement`-Ressourcen dienen. Diese `MedicationStatement`-Ressourcen bilden die Einträge der `ISiKMedikationsListe`.

Typischerweise:
- `working`, wenn die Liste fortlaufend aus aktuellen Informationen aktualisiert wird
- `snapshot`, wenn ein definierter Zustand der Medikation zu einem Zeitpunkt festgehalten wird
"""
* insert Meta
* insert CommonElements
* status MS
  * ^short = "(Aktualitäts-)Status der Liste"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard"
* mode MS
* mode from MedikationsListeListModeVS
  * ^short = "Listenmodus zur fachlichen Einordnung des Charakters der Medikationsliste."
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard
  Die `ISiKMedikationsListe` stellt eine fachliche Zusammenführung von Medikationsinformationen dar. Die Wahl von `List.mode` hängt davon ab, ob ein definierter Zustand dokumentiert oder eine fortschreibbare Liste geführt wird.
  Beispiel: eingelesene Medikationspläne werden als snapshot repräsentiert. Kontinuierlich fortgeschriebene Listen, z.B. im Rahmen der hausinternen Behandlung, sind als 'working' codiert."
* code 1.. MS
  * ^short = "Art der Liste."
  * ^comment = "Begründung des Must-Support: Dient der Differenzierung zu anderen Listen.

  Hinweis: Es ist mindestens ein Coding mit dem Code 'medications' anzugeben. Weitere Codes, z.B. im Kontext anderer Spezifikationen oder Hauscodierungen sind zulässig."
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      medications 1.. MS
  * coding[medications]
    * ^patternCoding.system = "http://terminology.hl7.org/CodeSystem/list-example-use-codes"
    * ^patternCoding.code = #medications
    * system 1.. MS
    * code 1.. MS
    * display MS
* subject 1.. MS
  * ^short = "Referenz auf den Patienten"
  * ^comment = "Begründung des Must-Support: Basisinformation"
* subject only Reference(Patient)
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * insert Comment-Reference-Subject(Begründung MS)
* encounter MS
  * ^short = "Referenz auf den Abteilungskontakt"
  * ^comment = "Begründung des Must-Support: Basisinformation im Krankenhaus-Kontext"
  * reference 1.. MS
    * insert Comment-Reference-Encounter(Begründung MS)
* date MS
  * ^short = "Erstellungsdatum der Liste"
  * ^comment = "Begründung des Must-Support: Basisinformation"
* entry MS
  * ^short = "Listeneintrag"
  * ^comment = "Begründung des Must-Support: Abbildung einzelner MedikationsInformationen in der Liste"
  * date MS
    * ^short = "Datum des Listeneintrags"
    * ^comment = "Begründung des Must-Support: Nachvollziehbarkeit

    Hinweis: nur zulässig im Listenmodus 'working'"
  * item MS
    * ^short = "Referenz auf die MedikationsInformation"
    * ^comment = "Begründung des Must-Support: Basisinformation (eigentlicher Zweck der Liste ist das Verbinden mehrerer MedikationsInformationen)"
  * item only Reference(MedicationStatement)
    * reference 1.. MS

Instance: ExampleISiKMedikationsListe
InstanceOf: ISiKMedikationsListe
Usage: #example
* status = #current
* mode = #working
* subject = Reference(PatientinMusterfrau)
* encounter.reference = "Encounter/Fachabteilungskontakt"
* date = 2021-07-04
* entry[+]
  * date = 2021-07-01
  * item = Reference(ExampleISiKMedikationsInformation1)
* entry[+]
  * date = 2021-07-04
  * item = Reference(ExampleISiKMedikationsInformation2)

Instance: ExampleISiKMedikationsListeParkinson
InstanceOf: ISiKMedikationsListe
Usage: #example
* status = #current
* mode = #working
* subject = Reference(PatientinMusterfrau)
* encounter.reference = "Encounter/Fachabteilungskontakt"
* date = 2024-02-20
* entry[+]
  * date = 2024-02-20
  * item = Reference(ExampleISiKMedikationsInformationParkinson1)
* entry[+]
  * date = 2024-02-20
  * item = Reference(ExampleISiKMedikationsInformationParkinson2)
* entry[+]
  * date = 2024-02-20
  * item = Reference(ExampleISiKMedikationsInformationParkinson3)
* entry[+]
  * date = 2024-02-20
  * item = Reference(ExampleISiKMedikationsInformationParkinson4)
* entry[+]
  * date = 2024-02-20
  * item = Reference(ExampleISiKMedikationsInformationParkinson5)