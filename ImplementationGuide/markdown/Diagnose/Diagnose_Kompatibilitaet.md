### Kompatibilität

Dieses Profil basiert auf dem [Profil "Diagnose" der Medizininformatik-Initative](https://simplifier.net/medizininformatikinitiative-moduldiagnosen/diagnose). 

Instanzen, die gegen ISiKDiagnose valide sind, sind auch valide gegen:

* [das Profil ProfileConditionDiagnose der Medizininformatik-Initative - v2.0.0](https://simplifier.net/medizininformatikinitiative-moduldiagnosen/diagnose)
  * wenn unter `Condition.code.coding` mindestens eine codierte Darstellung der Diagnose angegeben wurde

* [das Profil KBV_PR_Base_Diagnosis der KBV - v1.2.1](https://simplifier.net/base1x0/kbvprbasediagnosis)
  * wenn unter `Condition.code.coding` mindestens eine codierte Darstellung der Diagnose angegeben wurde

* [das Profil KBV_PR_EAU_Condition_ICD der KBV - v1.0.2](https://simplifier.net/eau/kbvpreauconditionicd)
  * wenn unter `Condition.code.coding` mindestens eine ICD-10-codierte Darstellung der Diagnose angegeben wurde
  * wenn unter `Condition.verificationStatus`  ein Wert angegeben wurde
  * wenn unter `Condition.asserter` eine Referenz auf einen Practitioner angegeben werden.

---