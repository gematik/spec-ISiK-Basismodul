Profile: ISiKAbrechnungsfallAmbulant
Parent: ISiKAbrechnungsfall
Id: ISiKAbrechnungsfallAmbulant
Description: "Dieses Profil spezifiziert die Anforderungen an die Abbildung von ambulanten Abrechnungsfällen im Krankenhauskontext. Es handelt sich dabei um eine Spezialisierung des ISiK Abrechnungsfall-Profils, das allgemeine Anforderungen an die Abbildung von Abrechnungsfällen definiert."
* insert Meta
* insert CommonElements
* extension[AbrechnungsDiagnoseProzedur]
  * ^comment = "Im ambulanten Kontext ist es üblich, abrechnungsrelevante Diagnosen und Prozeduren anzugeben, ohne sie in Haupt- und Nebendiagnosen aufzuteilen. Da dies in der praxis trotzdem teilweise passiert, ist die Nutzung dieser Extension hier nicht ausgeschlossen."
* extension contains ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant named AbrechnungsDiagnoseProzedurAmbulant 0..* MS
* extension[AbrechnungsDiagnoseProzedurAmbulant]
  * ^short = "Abrechnungsdiagnose /-prozedur"
  * ^comment = "Diese Extension ermöglicht es, Diagnosen und Prozeduren als abrechnungsrelevant im Abrechnungskontext vorzunehmen, 
  unabhängig von der *medizinischen* Relevanz, die in `Encounter.diagnosis` erfolgt."
* identifier contains Scheinnummer 0..1 MS
* identifier[Scheinnummer]
  * ^short = "Scheinnummer"
  * ^comment = "Die Scheinnummer ist eine Nummer, die in der ambulanten Versorgung in Deutschland verwendet wird. Da im Krankenhaus und in den zum Einsatz kommenden Primärsystemen auch ambulante Leistungen erbracht und dokumentieert werden, kann es also vorkommen, dass neben einer Fallnummer auch eine Scheinnummer vorliegt. Diese ist allerdings vom System selber vergeben und wie die Fall- bzw. Patientennummer nicht eindeutig über Systemgrenzen hinweg.
  
  Im Kontext eines ambulanten BG Falls gibt es keine Scheinnummer (Quelle: DGUV)"
  * ^patternIdentifier.type = ISiKIdentifierTypeErweiterung#ASN
  * type MS
    * coding
      * ^short = "Codierte Darstellung des Identifier-Typs"
      * system 1.. MS
        * ^short = "Codier-Schema" 
      * code 1.. MS
        * ^short = "Code"
        * ^comment = "Hier ist stets der Wert `ASN` anzugeben."
  * system MS
    * ^short = "Namensraum des Identifiers"
    * ^comment = "Hier ist stets der eindeutige Name (URL) des Namensraums anzugeben, 
    aus dem der Identifier stammt. 
    Hinweise zur Festlegung der URLs für lokale Namensräume sind in den 
    [Deutschen Basisprofilen](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Terminologie-Namensraeume?version=current) beschrieben.  
    **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher."
  * value MS
    * ^comment = "Enthält den eigentlichen Wert des Identifiers.  
    **Begründung Pflichtfeld:** Ist der Wert nicht bekannt, sollte der gesamte Slice weggelassen werden."
  
* servicePeriod MS
  * ^short = "Gültigkeitszeitraum des Abrechnungsfalls"
  * ^comment = "**Begründung MS:** Im Kontext der Abbildung von ambulanten Behandlungen im Krankenhaus ist die Angabe eines Gültigkeitszeitraum notwendig, da es sich hierbei um punktuelle Kontakte handelt und der Zeitraum der Gültigkeit nicht direkt aus den zugeordneten Encountern ableitbar ist."

* owner MS
  * ^short = "Managende Organisation"
  * ^comment = "**Begründung MS:** Bei einer ambulanten Behandlung im Krankenhaus ist es wichtig, die Ambulanz als verantwortliche Organisation zu dokumentieren. Aus diesem Grund wurde hier ein MS ergänzt."
  * reference MS
    * ^short = "Organisation-Link"
  * display MS
    * ^short = "Name der managenden Organisation (Ambulanz)"
    * ^comment = "Hier ist der Name der managenden Organisation anzugeben, beispielsweise die Ambulanz, die für die Behandlung verantwortlich ist."
  * identifier MS
    * ^short = "Identifier der managenden Organisation (Ambulanz)"
    * ^comment = "Hier sind verschiedene im ambulanten Kontext vorkommende Identifier denkbar. Zur Orientierung wird im ISiK Kontext auf die Identifier einer [KBV Base Organization](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization) verwiesen, da diese bereits die relevanten Identifier für die ambulante Versorgung enthält."

Extension: ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant
Id: ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant
Title: "Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren"
Description: "Diese Extension erlaubt es, angelehnt an die Basisprofil Extension [Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren](http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur), Diagnosen und Prozeduren als abrechnungsrelevant in einem Fallkontext anzugeben. Allerdings ohne die Verpflichtung, einen Use anzugeben. Dies ist im ambulanten Kontext nicht üblich."
* insert Meta
* value[x] only Reference(Condition or Procedure)

Instance: AbrechnungsfallAmbulantMvzImKrankenhaus
InstanceOf: ISiKAbrechnungsfallAmbulant
Usage: #example
* extension[AbrechnungsDiagnoseProzedurAmbulant].valueReference = Reference(Condition/DiagnoseSelteneErkrankung)
* identifier[Abrechnungsnummer]
  * system = "https://test.krankenhaus.de/fhir/sid/abrechnungsnummer"
  * value = "0123456789"
* identifier[Scheinnummer]
  * system = "https://test.krankenhaus.de/fhir/sid/scheinnummer"
  * value = "987654310"
* status = #active
* servicePeriod
  * start = "2024-01-01T08:00:00+01:00"
  * end = "2024-01-01T12:00:00+01:00"
* subject = Reference(PatientinMusterfrau)
* coverage
  * extension[Abrechnungsart]
    * valueCoding = $Abrechnungsart#HSA "Hochschulambulanz"
  * coverage = Reference(CoverageGesetzlich)
* owner
  * display = "Hochschulambulanz für irgendetwas Dr. Musterfrau"
