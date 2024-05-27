Profile: ISiKCoding
Parent: Coding
Id: ISiKCoding
Title: "ISiKCoding"
Description: "Data Type profile for Codings in ISiK"
* system 1.. MS
* code 1.. MS
* display MS

Profile: ISiKSnomedCTCoding
Parent: ISiKCoding
Id: ISiKSnomedCTCoding
Title: "ISiKSnomedCTCoding"
Description: "Data Type profile for Snomed-CT Codings in ISiK"
* system = $sct
* version MS

Profile: ISiKLoincCoding
Parent: ISiKCoding
Id: ISiKLoincCoding
Title: "ISiKLoincCoding"
Description: "Data Type profile for LOINC Codings in ISiK"
* system = $loinc
* version MS

Profile: ISiKWG14Coding
Parent: ISiKCoding
Id: ISiKWG14Coding
Title: "ISiKWG14Coding"
Description: "Data Type profile for WG14 Codings in ISiK"
* system = $cs-wg14


// Profile die von den dt. Basisprofilen erben
//

Profile: ISiKICD10GMCoding
Parent: CodingICD10GM
Id: ISiKICD10GMCoding
Title: "ISiKICD10GMCoding"
Description: "Data Type profile for ICD10-GM Codings in ISiK"
* system 1.. MS
* code 1.. MS
* display MS
* version MS

Profile: ISiKASKCoding
Parent: CodingASK
Id: ISiKASKCoding
Title: "ISiKASKCoding"
Description: "Data Type profile for ASK Codings in ISiK"
* system 1.. MS
* code 1.. MS
* display MS

Profile: ISiKATCCoding
Parent: CodingATC
Id: ISiKATCCoding
Title: "ISiKATCCoding"
Description: "Data Type profile for ATC Codings in ISiK"
* system 1.. MS
* code 1.. MS
* display MS

Profile: ISiKPZNCoding
Parent: CodingPZN
Id: ISiKPZNCoding
Title: "ISiKPZNCoding"
Description: "Data Type profile for ATC Codings in ISiK"
* system 1.. MS
* code 1.. MS
* display MS