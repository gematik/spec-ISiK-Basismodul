### Motivation

Die Binary-Ressource erlaubt den Umgang mit FHIR-fremden Formaten (z.B. PDFs, Bilder, CDA) innerhalb des FHIR-Frameworks.
Dazu werden die Daten base64-codiert in der Binary-Ressource (in XML oder JSON) transportiert oder 
über die REST-API am Binary-Endpunkt in ihrem nativen Format bereitgestellt. 
Binary-Ressourcen werden von Attachment-Elementen verlinkt und damit in den Kontext anderer FHIR-Ressourcen
(z.B. Patient und Encounter) gestellt.

---
