Profile: ISiKAllergieUnvertraeglichkeit
Parent: AllergyIntolerance
Id: ISiKAllergieUnvertraeglichkeit
Description: "
Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien.

**Motivation**

Die Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit.
Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).

In FHIR werden Allergien und Unverträglichkeiten mit der [AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert.

**Kompatibilität**

Für das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen:
* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)
* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)
* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* insert CommonElements

/* 
hier sollte genauer spezifiziert werden, welche Statuswerte  für clincial- und verificationStatus implementiert werden müssen, z.B. durch Hinzufügen folgenden Kommentars:    
  **WICHTIGER Hinweis für Implementierer:**    
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch <t.b.d>.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben.

Alternativ: hier einen Sermon analog zu Condition.clincalStatus einfügen.
Bitte auch beachten, dass verificationStatus bei Condition derzeit KEIN MS-Flag hat!
*/
* clinicalStatus MS
  * ^short = "klinischer Status"
  * ^comment = "**Begründung MS:** Der klinische Status ist notwendig, um aktive gegenüber zurückliegenden Allergien unterscheiden und in Medikations- sowie Entscheidungsunterstützungsprozessen korrekt berücksichtigen zu können."
  * coding 1..1 MS
    * system 1..1 MS
    * code 1..1 MS
* verificationStatus MS
  * ^short = "Verifikationsstatus"
  * ^comment = "**Begründung MS:** Der Verifizierungsstatus macht transparent, ob eine Meldung bestätigt, widerlegt oder noch im Verdacht ist und ist Voraussetzung für belastbare AMTS-Prüfungen."
  * coding 1..1 MS
    * system 1..1 MS
    * code 1..1 MS
* type MS
  * ^short = "Type (Allergie oder Unverträglichkeit)"
  * ^comment = "**Begründung MS:** Gibt die Unterscheidung zwischen Allergie und Unverträglichkeit an."
* category MS
  * ^short = "Kategorie"
  * ^comment = "**Begründung MS:** Die Kategorie erlaubt das Filtern, z. B. nach Arzneimittel-, Lebensmittel- oder Umweltallergien, und unterstützt zielgerichtete Warn- und Recherchefunktionen."
* criticality MS
  * ^short = "Kritikalität"
  * ^comment = "**Begründung MS:** Die Kritikalität beschreibt das erwartete Risiko bei erneuter Exposition und dient der Priorisierung von Warnhinweisen."
* code 1.. MS
  * ^short = "Benennung der Allergie/Unverträglichkeit"
  * ^comment = "**Begründung Pflichtfeld:** Nur mit einer codierten oder textuell benannten Auslösersubstanz lässt sich die Allergie klinisch interpretieren und für Interaktionsprüfungen nutzen."
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains
      snomed-ct 1..1 MS and
      ask 0..1 MS and
      atc 0..1 MS
  * coding[snomed-ct] MS
  * coding[snomed-ct] only ISiKSnomedCTCoding
  * coding[ask] MS
  * coding[ask] only ISiKASKCoding
    * system MS
    * code MS
    * display MS
  * coding[atc] MS
  * coding[atc] only ISiKATCCoding
    * system MS
    * version MS
    * code MS
    * display MS
  * text MS
* patient MS
  * ^short = "Patientenbezug"
  * ^comment = "**Begründung Must-Support:** Ein Patientenbezug der AllergieUnverträglichkeit MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen."
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * insert Comment-Reference-Subject(Begründung MS)
* encounter MS
  * ^short = "Aufenthaltsbezug"
  * ^comment = "**Begründung Must-Support:** Ein Aufenthaltsbezug der AllergieUnverträglichkeit MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen."
  * reference 1.. MS
    * ^short = "Encounter-Link"
    * insert Comment-Reference-Encounter(Begründung MS)

* onset[x] MS
  * ^short = "Beginn-Zeitpunkt"
  * ^comment = "**Begründung MS:** Der dokumentierte Beginn unterstützt die medizinische Bewertung, ob eine Allergie aktuell relevant ist, und wird in CapabilityStatements als Suchparameter gefordert."
* onsetDateTime MS
  * ^short = "Beginn der Allergie/Unvertraeglichkeit"
  * ^comment = "**Begründung MS:** Diese Variante erlaubt es, den Beginn als exakten Zeitstempel zu übertragen, wie er in Primärsystemen üblich ist."
* onsetAge MS
  * ^short = "Alter beim Beginn der Allergie/Unvertraeglichkeit"
  * ^comment = "**Begründung MS:** Für lang zurückliegende Ereignisse wird der Beginn häufig nur als Alter dokumentiert"
* onsetString MS
  * ^short = "Freitextinformation zum Beginn der Allergie/Unvertraeglichkeit"
  * ^comment = "**Begründung MS:** Steht keine strukturierte Angabe zur Verfügung, verhindert eine Freitextbeschreibung des Beginns Informationsverlust."
* recordedDate MS
  * ^short = "Datum an dem die Allergie/Unverträglichkeit aufgezeichnet wurde"
  * ^comment = "**Begründung MS:** Der Dokumentationszeitpunkt ist wichtig für Verlauf, Audits und Suchfunktionen nach frisch erfassten Allergien."
* recorder MS
  * ^short = "Person/Rolle, die die Information dokumentiert"
  * ^comment = "**Begründung MS:** Die dokumentierende Person ermöglicht fachliche Rückfragen und unterstützt nachvollziehbare Verantwortungsketten."
  * reference MS
  * display MS
* asserter MS
  * ^short = "Person/Rolle, die die Allergie/Unverträglichkeit festgestellt hat"
  * ^comment = "**Begründung MS:** Die feststellende Person oder Rolle macht die klinische Verantwortlichkeit transparent."
  * reference MS
  * display MS
* note MS
  * ^short = "Anmerkung"
  * ^comment = "**Begründung MS:** Anmerkungen transportieren kontextuelle Details (z. B. individuelle Auslöser oder Maßnahmen), die in Codes nicht erfasst werden können."
  * author[x] MS
  * author[x] only Reference
  * authorReference MS
    * reference MS
    * display MS
  * time MS
  * text MS
* reaction MS
  * ^short = "Unerwünschte Reaktion"
  * ^comment = "**Begründung MS:** Die beobachtete Reaktion ist für die klinische Bewertung der Gefährdung essenziell und Grundlage für Entscheidungshilfen."
  * manifestation MS
    * ^short = "Manifestation der Reaktion"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "system"
      * ^slicing.rules = #open
    * coding contains
        snomed-ct 0..1 MS
    * coding[snomed-ct] MS
    * coding[snomed-ct] only ISiKSnomedCTCoding
    * text MS
  * severity MS
    * ^short = "Schweregrad der Reaktion"
  * exposureRoute MS
    * ^short = "Expositionsweg"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "system"
      * ^slicing.rules = #open
    * coding contains
        snomed-ct 0..1 MS
    * coding[snomed-ct] MS
    * coding[snomed-ct] only ISiKSnomedCTCoding
    * text MS

Instance: ISiKAllergieUnvertraeglichkeitBeispiel1
InstanceOf: ISiKAllergieUnvertraeglichkeit
Usage: #example
* clinicalStatus = $vsAllergyIntoleranceClinicalStatus#active
* verificationStatus = $vsAllergyIntoleranceVerificationStatus#confirmed
* type = #allergy
* category = #environment
* criticality = #low
* code = $sct#256262001 "Betula pendula pollen"
* patient = Reference(PatientinMusterfrau)
* onsetDateTime = "1987"
* recordedDate = 2011-05-12
* recorder.display = "Dr. Martin Mustermann"
* asserter.display = "Dr. Berta Beispiel"
* note
  * authorReference = Reference(PractitionerWalterArzt)
  * time = 2024-02-20T14:34:12+01:00
  * text = "Patientin berichtet von einer leichten Verschlimmerung in den letzten 3 Jahren."
* reaction
  * manifestation = $sct#76067001 "Sneezing (finding)"
  * severity = #moderate
  * exposureRoute = $sct#14910006 "Inspiration"
