ValueSet: DiagnosesSCT
Id: DiagnosesSCT
Description: "Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes"
* insert Meta
* include codes from system SNOMED_CT
    where concept is-a #404684003
* include codes from system SNOMED_CT
    where concept is-a #272379006
* include codes from system SNOMED_CT
    where concept is-a #243796009

ValueSet: EncounterReasonCodes
Id: EncounterReasonCodes
Description: "Enthaelt alle SNOMED Reason Codes"
* insert Meta
* include codes from system SNOMED_CT
    where concept is-a #404684003
* include codes from system SNOMED_CT
    where concept is-a #71388002
* include codes from system SNOMED_CT
    where concept is-a #243796009
* include codes from system SNOMED_CT
    where concept is-a #272379006

ValueSet: ConditionDiagnosisSeverity
Id: ConditionDiagnosisSeverity
Description: "Enthaelt alle SNOMED DiagnosisSeverity Codes"
* insert Meta
* include codes from system SNOMED_CT
    where concept is-a #24484000
* include codes from system SNOMED_CT
    where concept is-a #6736007
* include codes from system SNOMED_CT
    where concept is-a #255604002

ValueSet: ProzedurenCodesSCT
Id: ProzedurenCodesSCT
Description: "Enthaelt alle SNOMED Procedure Codes"
* insert Meta
* include codes from system SNOMED_CT where concept descendent-of #71388002

ValueSet: ProzedurenReanimationCodesSCT
Id: ProzedurenReanimationCodesSCT
Description: "Enthaelt alle SNOMED Procedure Codes für Reanimationsmaßnahmen"
* insert Meta
* include codes from system SNOMED_CT where concept descendent-of #439569004

ValueSet: ProzedurenReanimationCodesOPS
Id: ProzedurenReanimationCodesOPS
Description: "Enthaelt alle OPS Procedure Codes für Reanimationsmaßnahmen"
* insert Meta
* $ops#8-771 "Kardiale oder kardiopulmonale Reanimation"
* $ops#8-772 "Operative Reanimation"
* $ops#8-779 "Andere Reanimationsmaßnahmen"

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

ValueSet: ISiKAccountType
Id: ISiKAccountType
Title: "ISiKAccountType"
* insert Meta
* $v3-ActCode#AMB "ambulatory"
* $v3-ActCode#IMP "inpatient encounter"

ValueSet: SchwangerschaftsstatusVS
Id: SchwangerschaftsstatusVS
Description: "Dieses Valueset enthält die Codes zur Beschreibung des Schwangerschaftsstatus einer Patientin."
Title: "Schwangerschaftsstatus Valueset"
* insert Meta
* $loinc#LA15173-0 "Pregnant"
* $loinc#LA26683-5 "Not pregnant"
* $loinc#LA4489-6 "Unknown"

ValueSet: SchwangerschaftEtMethodeVS
Id: SchwangerschaftEtMethodeVS
Description: "Dieses Valueset enthält die Codes zur Beschreibung der Methode zur Bestimmung des erwarteten Entbindungstermins bei einer Schwangerschaft."
Title: "Schwangerschaft Erwarteter Entbindungstermin Methode"
* insert Meta
* $loinc#11778-8 "Delivery date Estimated"
* $loinc#53692-0 "Delivery date Estimated from conception date"
* $loinc#11780-4 "Delivery date Estimated from ovulation date"
* $loinc#57063-0 "Delivery date Estimated from quickening date"
* $loinc#11779-6 "Delivery date Estimated from last menstrual period"
* $loinc#11781-2 "Delivery date US composite estimate"
* $loinc#57064-8 "Delivery date Estimated from date fundal height reaches umb"
* $loinc#90368-2 "Delivery date Estimated from physical exam"

ValueSet: StillstatusVS
Id: StillstatusVS
Title: "Stillstatus LOINC Antwortoptionen"
Description: "Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC."
* insert Meta
* $loinc#LA4489-6 "Unknown"
* $loinc#LA29253-4 "Not currently breastfeeding"
* $loinc#LA29252-6 "Currently breastfeeding"

ValueSet: ISiKBesondereBehandlungsformRehaVS
Id: ISiKBesondereBehandlungsformReha
Description: "Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen."
* insert Meta
* include codes from system ISiKBesondereBehandlungsformRehaCS

ValueSet: ISiKBehandlungsergebnisRehaVS
Id: ISiKBehandlungsergebnisReha
Description: "Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis."
* insert Meta
* include codes from system ISiKBehandlungsergebnisRehaCS

ValueSet: ISiKEntlassformRehaVS
Id: ISiKEntlassformReha
Description: "ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform."
* insert Meta
* include codes from system ISiKEntlassformRehaCS

ValueSet: ISiKUnterbrechungRehaVS
Id: ISiKUnterbrechungReha
Description: "ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung."
* insert Meta
* include codes from system ISiKUnterbrechungRehaCS

Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

ValueSet: CurrentSmokingStatusUvIps
Id: current-smoking-status-uv-ips
Title: "Current Smoking Status - IPS"
Description: "HL7 LOINC value set for smoking status.  Based on the HL7 Vocab and Structured Doc WG (formerly TC) consensus - per US CDC submission 7/12/2012 for smoking status terms."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^identifier.use = #official
* ^identifier.system = "http://art-decor.org/ns/oids/vs"
* ^identifier.value = "2.16.840.1.113883.11.22.59"
* ^version = "1.1.0"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 International / Patient Care"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/patientcare"
* ^jurisdiction = $m49.htm#001
* ^immutable = false
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* $loinc#LA18976-3 "Current every day smoker"
* $loinc#LA18976-3 ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* $loinc#LA18976-3 ^extension[=].valueDecimal = 1
* $loinc#LA18977-1 "Current some day smoker"
* $loinc#LA18977-1 ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* $loinc#LA18977-1 ^extension[=].valueDecimal = 2
* $loinc#LA15920-4 "Former smoker"
* $loinc#LA15920-4 ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* $loinc#LA15920-4 ^extension[=].valueDecimal = 3
* $loinc#LA18978-9 "Never smoker"
* $loinc#LA18978-9 ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* $loinc#LA18978-9 ^extension[=].valueDecimal = 4
* $loinc#LA18979-7 "Smoker, current status unknown"
* $loinc#LA18979-7 ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* $loinc#LA18979-7 ^extension[=].valueDecimal = 5
* $loinc#LA18980-5 "Unknown if ever smoked"
* $loinc#LA18980-5 ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* $loinc#LA18980-5 ^extension[=].valueDecimal = 6
* $loinc#LA18981-3 "Heavy tobacco smoker"
* $loinc#LA18981-3 ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* $loinc#LA18981-3 ^extension[=].valueDecimal = 7
* $loinc#LA18982-1 "Light tobacco smoker"
* $loinc#LA18982-1 ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
* $loinc#LA18982-1 ^extension[=].valueDecimal = 8

ValueSet: ISiKEncounterTypeErweiterungVS
Id: ISiKEncounterTypeErweiterungVS
Title: "ISiKEncounterTypeErweiterungVS"
Description: "ISiK vereint hierbei das ValueSet [KontaktArtDe](http://fhir.de/CodeSystem/kontaktart-de) aus dem deutschen Basisprofil und die übergangsweise hinzugefügten Codes für den ambulanten Kontakt im Krankenhaus. Dieses ValueSet ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen."
* insert Meta
* include codes from system http://fhir.de/CodeSystem/kontaktart-de
* include codes from system ISiKEncounterTypeErweiterung