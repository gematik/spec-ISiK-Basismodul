### Interaktionen

Für die Ressource Binary MUSS die REST-Interaktion "READ" implementiert werden. Es MÜSSEN die Regeln aus der FHIR-Kernspezifikation zur Abfrage einer Binary Ressource beachtet werden. Siehe ["Serving Binary Resources using the RESTful API"](https://www.hl7.org/fhir/R4/binary.html#rest).

Um die Handhabung der base64-kodierten Binaries clientseitig zu erleichtern, MÜSSEN bei READ-Interaktionen Accept-Header mit einem Wert außer den [FHIR-Mime-Types](https://www.hl7.org/fhir/R4/http.html#mime-type) unterstützt werden. Falls ein solcher Accept-Header durch einen Client verwendet wird, MUSS das Binary in seiner nativen Form (definiert durch Binary.contentType) zurückgegeben werden.
    
---
