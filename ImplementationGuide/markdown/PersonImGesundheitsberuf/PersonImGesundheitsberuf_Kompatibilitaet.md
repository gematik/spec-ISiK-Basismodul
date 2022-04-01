### Kompatibilität

Dieses Profil basiert auf dem [Profil KBV_PR_Base_Practitioner der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner). 

Instanzen, die dieses Profile valide sind, sind auch valide gegen
* [Profil KBV_PR_Base_Practitioner der KBV Basisprofile - v1.1.3](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner). 
* [Profil HiGHmed_IC_Practitioner, MI Initiative - HiGHmed Use Case Infection Control - v1.0.0](http://highmed.org/fhir/StructureDefinition/Practitioner), wenn
  * das Element `address` mindestens einmal vorhanden ist
  * das Element `birthDate` vorhanden ist und
  * das Element `qualification` vorhanden ist

---