RuleSet: LaboratorySnomedSliceRuleSet
* code.coding contains snomed 0..1
* code.coding[snomed]
  * ^short = "Primärer SNOMED CT-Code ohne Methodenbezug"
  * ^comment = "Motivation 0..1 Kardinalität: Abstrakter SNOMED CT-Code ohne Methodenbezug. Weitere (SCT) Codings mit Methodenbezug sind durch das offene Slicing möglich."