ValueSet: DiagnosesSCT
Id: DiagnosesSCT
Description: "Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes"
* ^date = "2020-05-01"
* ^experimental = true
* ^publisher = "gematik GmbH"
* ^status = #active
* ^version = "1.0"
* include codes from system SNOMED_CT
    where concept is-a #404684003 and
    concept is-a #272379006 and
    concept is-a #243796009

ValueSet: ProzedurenCodesSCT
Id: ProzedurenCodesSCT
Description: "Enthaelt alle SNOMED Procedure Codes"
* ^date = "2020-09-18"
* ^experimental = false
* ^publisher = "https://gematik.de"
* ^status = #active
* ^version = "1.0"
* include codes from system SNOMED_CT where concept descendent-of #71388002

ValueSet: ProzedurenKategorieSCT
Id: ProzedurenKategorieSCT
Description: "Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel"
* ^version = "1.0"
* ^date = "2020-09-18"
* ^experimental = false
* ^publisher = "https://gematik.de"
* ^status = #active
* SNOMED_CT#103693007 "Diagnostic procedure"
* SNOMED_CT#363679005 "Imaging"
* SNOMED_CT#387713003 "Surgical procedure"
* SNOMED_CT#18629005 "Administration of medicine"
* SNOMED_CT#277132007 "Therapeutic procedure"
* SNOMED_CT#394841004 "Other category"