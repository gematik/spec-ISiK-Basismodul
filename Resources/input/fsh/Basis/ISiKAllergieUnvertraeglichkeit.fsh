Profile: ISiKAllergieUnvertraeglichkeit
Parent: AllergyIntolerance
Id: ISiKAllergieUnvertraeglichkeit
Description: "
Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien.

**Motivation**

Die Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit.
Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://gemspec.gematik.de/ig/fhir/isik/amts/6.0.0-rc1/UseCases.html).

In FHIR werden Allergien und Unverträglichkeiten mit der [AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert.

**Kompatibilität**

Für das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen:
* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)
* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)
* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* insert CommonElements
// * insert CompliesWith(http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)
// * insert CompliesWith(https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)
// * insert CompliesWith(https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)

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
* extension contains
  http://hl7.org/fhir/StructureDefinition/allergyintolerance-abatement named abatement 0..1 MS
* extension[abatement] 
  * ^short = "Klinisch relevantes Enddatum"
  * ^comment = "Hier wird angegeben, bis wann der/die Patient:in die Allergie/Unverträglichkeit hatte. Bei einer fortbestehenden Diagnose/Erkrankung ist diese Angabe nicht zu übermitteln.
  
  **Begründung MS:** Das Enddatum der Allergie/Unverträglichkeit ist für die klinische Bewertung der aktuellen Relevanz und die Priorisierung von Warnhinweisen essenziell. Es ermöglicht die Unterscheidung zwischen aktiven und zurückliegenden Allergien, was insbesondere in Medikations- und Entscheidungsunterstützungsprozessen von großer Bedeutung ist."
  * value[x] ^slicing.discriminator.type = #type
  * value[x] ^slicing.discriminator.path = "$this"
  * value[x] ^slicing.rules = #open
  * valueDateTime 0..1 MS
  * valueDateTime only dateTime
    * ^sliceName = "valueDateTime"
    * ^short = "Datum, bis wann der/die Patient:in die Allergie/Unverträglichkeit hatte"
    * ^comment = "**Begründung MS:** Diese Variante erlaubt es, das klinisch relevante Enddatum als exakten Zeitstempel zu übertragen, wie er in Primärsystemen üblich dokumentiert wird. Ein präzises Datum ist die belastbarste Grundlage für die Bewertung, ob eine Allergie/Unverträglichkeit noch aktuell relevant ist."
  * valueAge 0..1 MS
  * valueAge only Age
    * ^sliceName = "valueAge"
    * ^short = "Alter, bis zu dem der/die Patient:in die Allergie/Unverträglichkeit hatte"
    * ^comment = "**Begründung MS:** Für lang zurückliegende oder anamnestisch erhobene Allergien/Unverträglichkeiten ist das Ende häufig nur als Lebensalter der/des Patient:in dokumentiert. Diese Variante verhindert Informationsverlust, wenn kein exaktes Enddatum vorliegt."
  * valueRange 0..1 MS
  * valueRange only Range
    * ^sliceName = "valueRange"
    * ^short = "Altersspanne, bis zu der der/die Patient:in die Allergie/Unverträglichkeit hatte"
    * ^comment = "**Begründung MS:** Ist das Ende zeitlich nicht exakt eingrenzbar, ermöglicht die Angabe einer Altersspanne dennoch eine medizinisch verwertbare zeitliche Einordnung der zurückliegenden Allergie/Unverträglichkeit."
    * extension contains http://fhir.de/StructureDefinition/lebensphase named lebensphase-bis 0..1 MS
    * extension[lebensphase-bis] ^short = "Lebensphase"
    * extension[lebensphase-bis] ^definition = "Lebensphase als kodierte Information angegeben, bis zu der der/die Patient:in die Allergie/Unverträglichkeit hatte."
    * extension[lebensphase-bis] ^comment = "**Begründung MS:** Ist auch eine Altersspanne nicht bezifferbar, erlaubt die kodierte Lebensphase (z. B. Kindheit, Erwachsenenalter) eine grobe, aber klinisch nachvollziehbare Einordnung des Endes der Allergie/Unverträglichkeit."
    * low MS
      * ^short = "Beginn der Altersspanne für die Schätzung des Alters"
      * ^comment = "**Begründung MS:** Die Untergrenze grenzt den frühesten Zeitpunkt ein, ab dem die Allergie/Unverträglichkeit nicht mehr bestand, und ist für die Interpretation der Altersspanne unverzichtbar."
    * high MS
      * ^short = "Ende der Altersspanne für die Schätzung des Alters"
      * ^comment = "**Begründung MS:** Die Obergrenze grenzt den spätesten Zeitpunkt ein, bis zu dem die Allergie/Unverträglichkeit noch relevant gewesen sein kann, und ist für die Interpretation der Altersspanne unverzichtbar."
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
  * ^comment = "**Begründung Pflichtfeld:** Nur mit einer codierten oder textuell benannten Auslösersubstanz lässt sich die Allergie klinisch interpretieren und für Interaktionsprüfungen nutzen.
  **Hinweis:** Die mio42 GmbH hat gemeinsam mit dem BfArM ein ValueSet für die `auslösende Substanz` im deutschen Gesundheitswesen erarbeitet. Dieses ValueSet steht zum Zeitpunkt der Veröffentlichung noch nicht bereit und wird daher zu einem späteren Zeitpunkt ergänzt. Weitere Informationen finden Sie hier: https://mio.kbv.de/spaces/ALDOK1X0X0/overview."
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
  * ^comment = "**Begründung Must-Support:** Ein Aufenthaltsbezug der Allergie MUSS zum Zwecke der Nachvollziehbarkeit und Datenintegrität exponiert und empfangen werden können."
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
    * ^comment = "**Hinweis:** Die mio42 GmbH hat gemeinsam mit dem BfArM ein ValueSet für `Allergiemanifestationen` im deutschen Gesundheitswesen erarbeitet. Dieses ValueSet steht zum Zeitpunkt der Veröffentlichung noch nicht bereit und wird daher zu einem späteren Zeitpunkt ergänzt. Weitere Informationen finden Sie hier: https://mio.kbv.de/spaces/ALDOK1X0X0/overview."
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
* code = $sct#256262001 "Silberbirkenpollen"
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
  * manifestation = $sct#76067001 "Niesen"
  * severity = #moderate
  * exposureRoute = $sct#14910006 "Inspiration"
