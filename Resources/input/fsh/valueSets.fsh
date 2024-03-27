ValueSet: DiagnosesSCT
Id: DiagnosesSCT
Description: "Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes"
* insert Meta
* include codes from system SNOMED_CT
    where concept is-a #404684003 and
    concept is-a #272379006 and
    concept is-a #243796009

ValueSet: ProzedurenCodesSCT
Id: ProzedurenCodesSCT
Description: "Enthaelt alle SNOMED Procedure Codes"
* insert Meta
* include codes from system SNOMED_CT where concept descendent-of #71388002

ValueSet: ProzedurenKategorieSCT
Id: ProzedurenKategorieSCT
Description: "Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel"
* insert Meta
* SNOMED_CT#165197003 "Diagnostic assessment"
* SNOMED_CT#363679005 "Imaging"
* SNOMED_CT#387713003 "Surgical procedure"
* SNOMED_CT#18629005 "Administration of medicine"
* SNOMED_CT#277132007 "Therapeutic procedure"
* SNOMED_CT#394841004 "Other category"

ValueSet: ISiKLocationPhysicalType
Id: ISiKLocationPhysicalType
* insert Meta
* LocationType#bd "Bed"
* LocationType#ro "Room"
* LocationType#wa "Ward"


ValueSet: ISiKAccountType
Id: ISiKAccountType
Title: "ISiKAccountType"
* insert Meta
* $v3-ActCode#AMB "ambulatory"
* $v3-ActCode#IMP "inpatient encounter"

ValueSet: SchwangerschaftsstatusVS
Id: SchwangerschaftsstatusVS
Title: "Schwangerschaftsstatus Valueset"
* insert Meta
* $loinc#LA15173-0 "Pregnant"
* $loinc#LA26683-5 "Not pregnant"
* $loinc#LA4489-6 "Unknown"

ValueSet: SchwangerschaftEtMethodeVS
Id: SchwangerschaftEtMethodeVS
Title: "Schwangerschaft Erwarteter Entbindungstermin Methode"
* insert Meta
* $loinc#11778-8 "Delivery date Estimated"
* $loinc#11779-6 "Delivery date Estimated from last menstrual period"
* $loinc#11780-4 "Delivery date Estimated from ovulation date"