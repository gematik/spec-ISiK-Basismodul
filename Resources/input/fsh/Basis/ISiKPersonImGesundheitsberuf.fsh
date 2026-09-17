Profile: ISiKPersonImGesundheitsberuf
Parent: Practitioner
Id: ISiKPersonImGesundheitsberuf
Description: "Dieses Profil ermöglicht die Abbildung von Personen, die in Gesundheitsberufen tätig sind, in ISiK-Szenarien.
**Motivation**: Das Profil ISIKPersonImGesundheitsberuf bildet Personen ab, die als medizinische Leistungserbringer oder Fachexperten tätig sind. In den ISiK-FHIR-Profilen können PersonImGesundheitsberuf bspw. als Ausführende einer Prozedur auftreten, im Element `performer` der Procedure-Ressource, oder als Person, die eine Diagnose stellt, im Element `asserter` der Condition-Ressource.

In FHIR werden PersonImGesundheitsberuf mit der [`Practitioner`](https://hl7.org/fhir/R4/practitioner.html)-Ressource
 repräsentiert.
 Für das Profil ISIKPersonImGesundheitsberuf wird Kompatibilität mit den folgenden Profilen angestrebt. Es kann jedoch nicht sichergestellt werden, dass Instanzen, die gegen ISIKPersonImGesundheitsberuf valide sind, auch gegen diese Profile validieren:
* [Profil KBV_PR_Base_Practitioner der KBV-Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner).
* [Profil HiGHmed_IC_Practitioner, Medizininformatik-Initiative - HiGHmed Use Case Infection Control der  Medizininformatik-Initiative ](https://simplifier.net/medizininformatikinitiative-highmed-ic/highmed-ic-practitioner)

Gegen folgende Profile ist das Profil ISiKPersonImGesundheitsberuf unmittelbar kompatibel:

* [Profil TIPractitioner der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner)  

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* insert CommonElements
// * insert CompliesWith(http://hl7.eu/fhir/base/StructureDefinition/practitioner-eu)
// * insert CompliesWith(https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner)
// * insert CompliesWith(https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner)
* obeys prac-de-1
* . ^constraint[5].source = Canonical(ISiKPersonImGesundheitsberuf)
* identifier 1.. MS
  * ^comment = "Eindeutiger Identifier der Person"
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains
    Arztnummer 0..* MS and
    EFN 0..1 MS and
    TelematikId 0..1 MS and
    Mitarbeiterkennzeichen 0..1 MS
* identifier[Arztnummer] only IdentifierLanr
  * ^short = "Lebenslange Arztnummer"
  * ^comment = " Im Krankenhaus ist die lebenslange Arztnummer der Ärzte bekannt und MUSS zur eindeutigen Identifikation eines Arztes bereitgestellt werden.
**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/LebenslangeArztnummerLANR-Identifier.html)
Während die Deutschen Basisprofile hier die Abkürzung LANR verwenden, ist im KBV-Kontext das Akronym ANR gebräuchlich. Die Bezeichnung des Slices hat jedoch keinerlei Auswirkungen auf die Kompatibilität."
  * ^patternIdentifier.type = $v2-0203#LANR
  * type 1..
* identifier[EFN] only IdentifierEfn
  * ^short = "Einheitliche Fortbildungsnummer für Ärzte in Deutschland"
  * ^patternIdentifier.type = $v2-0203#DN
  * type 1..
  * ^comment = "In einzelnen KIS wird keine EFN geführt, da sie aus Compliance-Gründen ausschließlich in HR-Systemen vorgehalten wird. Eine fehlende EFN soll im Testsystem daher als warningOnly bewertet werden."
  // Dennoch soll das MS im Profil enthalten sein: das war laut gefyra eine KBV-Anforderung [Stand 9.12.2022].
* identifier[TelematikId] only IdentifierTelematikId
  * ^short = "Telematik-ID"
  * ^patternIdentifier.type = $v2-0203#PRN
  * ^comment = "**Begründung MS:** Zur Verknüpfung der Practitioner-Instanz mit Diensten der Telematikinfrastruktur SOLL die Telematik-ID des HBA angegeben werden."
  * type 1..
* identifier[Mitarbeiterkennzeichen] MS
  * ^short = "Mitarbeiterkennzeichen"
  * ^comment = "Für interne Kennzeichnung von Personen KANN ein institutionsbezogenes Mitarbeiterkennzeichen angegeben werden.
  
  Begründung MS: Nicht immer gibt es eine offizielle Kennzeichnung, von Personen. Damit eine interne Kennzeichnung möglich ist, bietet dieser Slice die Möglichkeit, ein internes Mitarbeiterkennzeichen anzugeben."
  * ^patternIdentifier.type = $v2-0203#EN
  * type 1.. MS
  * system MS
  * value MS
* name MS
  * ^comment = "Namen der Person"
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* name contains
    Name 1..1 MS and
    Geburtsname 0..1
* name[Name] only HumannameDeBasis
  * ^short = "Vollständiger Name"
  * ^comment = "Der Name der Person im Gesundheitsberuf MUSS in konkreten Anwendungen angezeigt werden können. Es MUSS möglich sein, nach diesem Namen zu suchen."
  * ^patternHumanName.use = #official
  * use 1.. MS
    * ^short = "Verwendungszweck"
    * ^comment = "Hier ist stets der Wert `official` anzugeben.
      **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium"  
  * use = #official (exactly)
  * family 1.. MS
    * ^short = "Nachname"
    * ^comment = "Vollständiger Nachname bzw. Familienname der Person, einschließlich Namensvorsätze und -zusätze.
      **Begründung Pflichtfeld:** Ein offizieller Name ist nur zulässig, wenn der Nachname und mindestens ein Vorname angegeben sind."   
  * given 1.. MS
    * ^short = "Vorname"
    * ^comment = "Kann mehrfach verwendet werden, um den Rufnamen sowie weitere Vornamen, Mittelnamen oder Mittel-Initialen abzubilden.
      **Begründung Pflichtfeld:** Ein offizieller Name ist nur zulässig, wenn der Nachname und mindestens ein Vorname angegeben sind."   
  * prefix MS
    * ^short = "Präfix"
    * ^comment = "Präfix, z. B. akademischer Titel oder militärischer Rang"
* name[Geburtsname] only HumannameDeBasis
  * ^short = "Geburtsname"
  * ^comment = "Ist der Geburtsname der Person im Gesundheitsberuf bekannt und weicht er vom aktuellen Namen ab, KANN er zusätzlich angegeben werden."
  * ^patternHumanName.use = #maiden
  * use 1.. MS
  * use = #maiden (exactly)
  * family 1..
  * given ..0
  * prefix ..0
* telecom.system 1..
* telecom.value 1..
* address MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "Zur Unterscheidung von Postfach- und Straßenadressen, zur getrennten Angabe von Straßenname und Hausnummer sowie zur Angabe von Stadtteilen können Implementierungen die im German Address Base Profile (http://fhir.de/StructureDefinition/address-de-basis) beschriebenen Erweiterungen unterstützen.\r\nDiese Differenzierungen sind im Rahmen dieser Spezifikation jedoch nicht verpflichtend."
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Postfach] only AddressDeBasis
  * ^short = "Postfachanschrift"
  * ^comment = "Ist eine Adresse bekannt, unter der die Person im Gesundheitsberuf erreichbar ist, MUSS sie bereitgestellt werden. Diese kann zur Unterscheidung von Personen herangezogen werden. Die Ausdifferenzierung der Adresse in die Adressbestandteile erfolgt in Hinblick auf eine einheitliche Verwendung von Adressen."
  * ^patternAddress.type = #postal
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..0
    * extension[Hausnummer] 0..0
    * extension[Adresszusatz] 0..0
    * extension[Postfach] 0..1 MS
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* address[Strassenanschrift] only AddressDeBasis
  * ^short = "Straßenanschrift"
  * ^comment = "Ist eine Adresse bekannt, unter der die Person im Gesundheitsberuf erreichbar ist, MUSS sie bereitgestellt werden. Diese kann zur Unterscheidung von Personen herangezogen werden. Die Ausdifferenzierung der Adresse in die Adressbestandteile erfolgt in Hinblick auf eine einheitliche Verwendung von Adressen."
  * extension[Stadtteil] MS
  * ^patternAddress.type = #both
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..1 MS
    * extension[Hausnummer] 0..1 MS
    * extension[Adresszusatz] 0..1 MS
    * extension[Postfach] 0..0
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* gender MS
  * ^short = "Administratives Geschlecht"
  * ^comment = "Ist das Geschlecht der Person im Gesundheitsberuf bekannt, MUSS es bereitgestellt werden. Für die Angabe 'divers' ist in Practitioner.gender der FHIR-Code `other` zu verwenden. Die administrative deutsche Differenzierung erfolgt ergänzend über die GenderOtherDE-Extension."
  * extension contains GenderOtherDE named Geschlecht-Administrativ 0..1 MS
  * extension[Geschlecht-Administrativ].value[x] MS
//Achtung, VZD weicht hier ab: https://simplifier.net/vzd-fhir-directory/practitionerqualificationvs
* qualification.code ^comment = "Zur Kodierung der Qualifikation ist das entsprechende [ValueSet der KBV](https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality) zu empfehlen."



Instance: PractitionerWalterArzt
InstanceOf: ISiKPersonImGesundheitsberuf
Usage: #example
* meta.source = "http://krankenhaus.de"
* identifier[0].type = $v2-0203#LANR
* identifier[=].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR"
* identifier[=].value = "123456789"
* identifier[+].type = $v2-0203#DN
* identifier[=].system = "http://fhir.de/sid/bundesaerztekammer/efn"
* identifier[=].value = "123456789123456"
* active = true
* name[Name]
  * text = "Walter Arzt"
  * family = "Arzt"
    * extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
    * extension.valueString = "Arzt"
  * given = "Walter"
* name[Geburtsname]
  * text = "Gross"
  * family = "Gross"
    * extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
    * extension.valueString = "Gross"
* address.type = #both
* address.line = "Schmiedegasse 16"
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
  * extension[=].valueString = "16"
  * extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
  * extension[=].valueString = "Schmiedegasse"
* address.city = "Potsdam"
* address.postalCode = "14469"
* address.country = "DE"
* gender = #male
* birthDate.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* birthDate.extension.valueCode = #masked
* qualification.code.coding.version = "http://snomed.info/sct/900000000000207008/version/20200131"
* qualification.code.coding = $sct#309343006 "Physician (occupation)"

Invariant: prac-de-1
Description: "Die amtliche Differenzierung der Geschlechtsangabe 'other' darf nur gefüllt sein, wenn das Geschlecht 'other' angegeben ist"
Severity: #error
Expression: "gender='other' or gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').empty()"