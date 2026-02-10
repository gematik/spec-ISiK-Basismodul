### Kompatibilität zu anderen nationalen FHIR-basierten Spezifikationen

Die Vitalparameter-Profile wurden gemeinsam mit [HL7 Deutschland e.V.](https://hl7.de/), 
der [Medizininformatik-Initative](https://www.medizininformatik-initiative.de/de/start) und 
der [KBV](https://kbv.de/html/) erstellt 
und sind von den [Deutschen Basisprofilen für Vitalparameter](https://simplifier.net/Basisprofil-DE-R4/~resources?category=Profile&corebasetype=Observation&fhirVersion=R4&sortBy=RankScore_desc) abgeleitet.


### Kompatibilität zu IHE-Profilen

Die Interaktionen auf den Observation-Ressourcen, die in diesem Modul festgelegt werden, entsprechen jenen der "Simple Observation Option" im IHE-Profil
[QEDm (Query for Existing Data for mobile)](https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_QEDm.pdf).

### Kompatibilität zu den internationalen Vitalparameter Profilen

Das ISiK Vitalparameter Modul orientiert sich durch die deutschen Basisprofile transitiv an den [internationalen VitalSign Profilen](https://www.hl7.org/fhir/R4/observation-vitalsigns.html). Die Profile in diesem Modul enthalten jedoch technische Korrekturen (verbessertes Slicing und korrigierte FHIRPath-Expressions) sowie Einschränkungen auf die in Deutschland üblicherweise verwendeten Maßeinheiten. Weitere Details zur Kompatibilität zu den internationalen VitalSign Profilen finden sich im [ImplementationGuide der deutschen Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-BeobachtungenMessungenObservation?version=current).