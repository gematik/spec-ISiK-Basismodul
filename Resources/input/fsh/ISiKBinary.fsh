Profile: ISiKBinary
Parent: Binary
Id: ISiKBinary
Title: "ISiKBinary"
Description: "Die Binary-Ressource erlaubt den Umgang mit FHIR-fremden Formaten (z.B. PDFs, Bilder, CDA) innerhalb des FHIR-Frameworks.
Dazu werden die Daten base64-codiert in der Binary-Ressource (in XML oder JSON) transportiert oder 
über die REST-API am Binary-Endpunkt in ihrem nativen Format bereitgestellt. 
Binary-Ressourcen werden von Attachment-Elementen in DocumentReference-Ressourcen verlinkt und damit in den Kontext anderer FHIR-Ressourcen
(z.B. Patient und Encounter) gestellt."
* contentType 1..1 MS
  * ^short = "MimeType der Binärdaten"
  * ^comment = "z.B. &quot;application/pdf&quot; oder &quot;image/jpeg&quot; "
* data 1..1 MS
  * ^short = "Base64-codierte Binärdaten"
  
