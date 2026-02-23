Instance: ISiKCapabilityStatementDokumentenverwaltungRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementDokumentenverwaltungRolle"
* name = "ISiKCapabilityStatementDokumentenverwaltungRolle"
* title = "ISiK CapabilityStatement Dokumentenverwaltung Rolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Dokumentenaustausch"
* purpose = "
CapabilityStatement für die Rolle &quot;ISiKCapabilityStatementDokumentenverwaltungRolle&quot;.
Diese Rolle beschreibt verpflichtende Interaktionen zur Erstellung, dem Abruf und der Aktualisierung von Dokumenten.
"

* rest.mode = #server
* rest.resource[+]
  * insert Expectation (#SHALL)
  * type = #DocumentReference
  * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenMetadaten"
    * insert Expectation (#SHALL)
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #create
    * documentation = "siehe {{pagelink:Dokumentenbereitstellung}}"
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #read
    * documentation = "siehe {{pagelink:Dokumentenabfrage}}"
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #search-type
  * insert CommonSearchParameters


  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "status"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-status"
    * type = #token
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?status=final`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).
        Dieser Suchparameter ist für die Umsetzung des IHE MHD Profils für Clients und Server verpflichend."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "identifier"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
    * type = #token
    * documentation = "**Beispiel:**
    `GET [base]/DocumenReference?identifier=urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340`  
    **Anwendungshinweis:
    Durchsucht die Elemente `DocumentReference.identifier` und `DocumentReference.masterIdentifier` nach übereinstimmenden Dokumenten."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?patient=Patient/123`
        `GET [base]/DocumentReference?patient.identifier=http://mein-krankenhaus.example/fhir/sid/patienten|1032702`
        `GET [base]/DocumentReference?patient.identifier=1032702`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).
        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der FHIR-Kernspezifikation - Abschnitt [Chained Parameters](https://hl7.org/fhir/R4/search.html#chaining).
        Dieser Suchparameter ist für die Umsetzung des IHE MHD Profils für Clients und Server verpflichend."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "type"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
    * type = #token
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?type=http://dvmd.de/fhir/CodeSystem/kdl|AD010101`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).
        Dieser Suchparameter ist für die Umsetzung des IHE MHD Profils für Server verpflichtend."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "category"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-category"
    * type = #token
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?category=http://ihe-d.de/CodeSystem/IHEXDSclassCode|BEF`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).
        Dieser Suchparameter ist für die Umsetzung des IHE MHD Profils für Server verpflichtend."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "creation"
    * definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
    * type = #date
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?creation=2021-11-05`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).
        Dieser Suchparameter ist Teil der IHE-MHD-Spezifikation und für die Umsetzung des IHE MHD Profils für Server verpflichtend."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "encounter"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
    * type = #reference
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?encounter=Encounter/123`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
  * searchInclude[+] = "DocumentReference:patient"
    * insert Expectation(#SHALL)
  * searchInclude[+] = "DocumentReference:encounter"
    * insert Expectation(#SHALL)

* rest.resource[+]
  * insert Expectation (#SHALL)
  * type = #Binary
  * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKBinary"
    * insert Expectation (#SHALL)
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #read
    * documentation = "Für die Ressource Binary MUSS die REST-Interaktion `read` implementiert werden.
    Es MÜSSEN die Regeln aus der FHIR-Kernspezifikation zur Abfrage einer Binary Ressource beachtet werden.
    Siehe [Serving Binary Resources using the RESTful API](https://www.hl7.org/fhir/R4/binary.html#rest).

    Um die Handhabung der base64-kodierten Binary-Ressourcen clientseitig zu erleichtern,
    MUSS ein bestätigungsrelevantes System (Server) bei READ-Interaktionen Accept-Header
    mit einem Wert außer den [FHIR-Mime-Types](https://www.hl7.org/fhir/R4/http.html#mime-type) unterstützen.
    Falls ein solcher Accept-Header durch einen Client verwendet wird, MUSS  bestätigungsrelevante System (Server)
    das Binary in seiner nativen Form (definiert durch Binary.contentType) zurückgeben."

* rest.resource[+]
  * insert Expectation (#SHALL)
  * type = #Bundle
  * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenSuchergebnisse"
    * insert Expectation (#SHALL)