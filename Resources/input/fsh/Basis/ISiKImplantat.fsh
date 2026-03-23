Profile: ISiKImplantat
Parent: Device
Id: ISiKImplantat
Description: "
Dieses Profil ermöglicht die strukturierte Abbildung von Implantaten eines Patienten in ISiK-Szenarien.
Implantate stellen dauerhaft oder langfristig im Körper befindliche Medizinprodukte dar und sind häufig von hoher klinischer Relevanz, da sie Diagnostik, Therapieentscheidungen sowie zukünftige Behandlungsmaßnahmen unmittelbar beeinflussen können.

### Motivation

Die standardisierte Bereitstellung von Implantatinformationen unterstützt insbesondere:

    die eindeutige Identifikation implantierter Medizinprodukte,

    die Berücksichtigung implantatspezifischer Besonderheiten bei weiteren diagnostischen oder therapeutischen Maßnahmen,

    die Nachverfolgbarkeit im Rahmen von Sicherheitsmeldungen und Rückrufaktionen sowie

    die Dokumentation wesentlicher Implantatmerkmale (z. B. Hersteller, Modell, Seriennummer).

Darüber hinaus ermöglicht das Profil eine interoperable und maschinenlesbare Darstellung implantatrelevanter Informationen und trägt zur Verbesserung der Patientensicherheit sowie zur Vermeidung von Risiken und Fehlentscheidungen im Behandlungsprozess bei.
Als Bestandteil interoperabler Patientendaten stellt es sicher, dass relevante Implantatvorinformationen systemübergreifend verfügbar sind.

Da Implantate auch im Kontext des EHDS berücksichtigt werden, erscheint eine Aufnahme in ISiK sinnvoll, um die Verfügbarkeit von Implantatinformationen in verschiedenen Anwendungsfällen zu gewährleisten, insbesondere in solchen, die über die Dokumentation in einem Entlassbrief hinausgehen.
"
* insert Meta
* insert CommonElements
//* insert CompliesWith(DeviceEuHdr)
* status 1.. MS
  * ^short = "Status des Implantats"
  * ^comment = "Begründung MS: Der Status gibt an, ob das Implantat aktuell im Körper des Patienten vorhanden ist oder nicht 
  und stellt somit eine überaus wichtige medizinische Information dar, die unmittelbar Einfluss auf Diagnostik, Therapieentscheidungen und zukünftige Behandlungsmaßnahmen haben kann. 
  Daher ist die Angabe des Status zwingend erforderlich."
* type 1.. MS
  * ^short = "Art des Implantats" 
  * ^comment = "Begründung MS: Die Angabe der Art des Implantats ermöglicht eine eindeutige Identifikation und Klassifizierung des implantierten Medizinprodukts, 
  was für die Berücksichtigung implantatspezifischer Besonderheiten bei weiteren diagnostischen oder therapeutischen Maßnahmen von entscheidender Bedeutung ist. 
  Daher ist die Angabe der Art des Implantats zwingend erforderlich."
* patient 1..1 MS
  * ^short = "Patient mit Implantat"
  * ^comment = "Begründung MS: Die Zuordnung zu einem Patient ist für den Datenaustausch im Rahmen von ISiK-Szenarien unerlässlich."

Instance: ISiKImplantatHerzschrittmacher
InstanceOf: ISiKImplantat
Usage: #example
* status = #active
* type = $sct#14106009 "Cardiac pacemaker, device (physical object)"
* deviceName
  * name = "Evoque DR"
  * type = #manufacturer-name
* modelNumber = "EV-DR-01"
* serialNumber = "SN-2024-00471"
* manufacturer = "Medtronic GmbH"
* manufactureDate = "2023-06-15"
* udiCarrier
  * deviceIdentifier = "00380740006918"
  * carrierHRF = "(01)00380740006918(11)230615(21)SN-2024-00471"
* patient = Reference(PatientinMusterfrau)

Instance: ISiKImplantatHueftprothese
InstanceOf: ISiKImplantat
Usage: #example
* status = #active
* type = $sct#10796001 "Hip joint prosthesis (physical object)"
* patient = Reference(PatientinMusterfrau)