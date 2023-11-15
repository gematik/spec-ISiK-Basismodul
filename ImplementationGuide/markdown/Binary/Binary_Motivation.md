### Motivation

Die Binary-Ressource erlaubt den Umgang mit FHIR-fremden Formaten (z.B. PDFs, Bilder, CDA) innerhalb des FHIR-Frameworks.
Dazu werden die Daten base64-codiert in der Binary-Ressource (in XML oder JSON) transportiert oder 
über die REST-API am Binary-Endpunkt in ihrem nativen Format bereitgestellt. 
Binary-Ressourcen werden von Attachment-Elementen verlinkt und damit in den Kontext anderer FHIR-Ressourcen
(z.B. Patient und Encounter) gestellt.

Im Rahmen des ISIK Basismoduls ist eine Implementierung des ISIKBinary-Profils nicht zwingend notwendig.
Das Profil ist Teil des ISIK Basismoduls, da es als übergreifend genutzte Ressource sowohl im [Modul Terminplanung](https://simplifier.net/guide/Implementierungsleitfaden-ISiK-Modul-Terminplanung-Stufe-3/ImplementationGuide-markdown-Datenobjekte?version=current) als auch im [Modul Dokumentenaustausch](https://simplifier.net/guide/Implementierungsleitfaden-ISiK-Modul-Dokumentenaustausch-Stufe-3/ImplementationGuide-markdown-Datenobjekte?version=current) implementiert werden muss.  

---
