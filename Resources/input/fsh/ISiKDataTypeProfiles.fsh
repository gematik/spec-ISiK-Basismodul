Profile: ISiKSCoding
Parent: Coding
Id: ISiKSCoding
Title: "ISiKSCoding"
Description: "Data Type profile for Codings in ISiK"
* system 1.. MS
* code 1.. MS
* display MS


Profile: ISiKSnomedCTCoding
Parent: ISiKSCoding
Id: ISiKSnomedCTCoding
Title: "ISiKSnomedCTCoding"
Description: "Data Type profile for Snomed-CT Codings in ISiK"
* system = $sct
* version MS

Profile: ISiKLoincCoding
Parent: ISiKSCoding
Id: ISiKLoincCoding
Title: "ISiKLoincCoding"
Description: "Data Type profile for LOINC Codings in ISiK"
* system = $loinc
* version MS

Profile: ISiKICD10GMCoding
Parent: CodingICD10GM
Id: ISiKICD10GMCoding
Title: "ISiKICD10GMCoding"
Description: "Data Type profile for ICD10-GM Codings in ISiK"
* system 1.. MS
* code 1.. MS
* display MS
* version MS