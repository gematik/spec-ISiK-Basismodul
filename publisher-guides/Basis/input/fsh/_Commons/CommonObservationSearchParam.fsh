RuleSet: CommonObservationSearchParameters
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "category"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
  * type = #token
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?category=vital-signs`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "status"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-status"
  * type = #token
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?status=final`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "date"
  * definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
  * type = #date
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?date=ge2020-01-14&date=le2020-12-31`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).
    Bei der Formulierung der Suche sollten die Vorgaben aus der Definition der
    [Such-Prefixe](https://hl7.org/fhir/R4/search.html#prefix)
    - und hier insbesondere die Unterschiede zwischen `lt` und `eb` bzw. `gt` und `sa` - beachtet werden."
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "code"
  * definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
  * type = #token
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?code=http://loinc.org|85354-9`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "patient"
  * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * type = #reference
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?patient=Patient/123`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
* searchParam[+]
  * insert CapabilityStatementExpectationExt(MAY)
  * name = "subject"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-subject"
  * type = #reference
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?subject=Patient/123`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).
    Für die Suche nach Patienten SOLL der Parameter `patient` bevorzugt werden."
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "encounter"
  * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
  * type = #reference
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?encounter=Encounter/456`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "code-value-quantity"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-code-value-quantity"
  * type = #composite
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?code-value-quantity=http://loinc.org|29463-7$gt50`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#composite).
    Kombinierter Suchparameter für Code und Messwert einer einfachen Observation."
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "combo-code"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-combo-code"
  * type = #token
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?combo-code=http://loinc.org|85354-9`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).
    Durchsucht sowohl `Observation.code` als auch `Observation.component.code`."
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "combo-code-value-quantity"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-combo-code-value-quantity"
  * type = #composite
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?combo-code-value-quantity=http://loinc.org|8480-6$gt100`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#composite).
    Kombinierter Suchparameter für Code und Messwert, der sowohl Haupt-Observation als auch Komponenten einschließt."
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "component-code"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-component-code"
  * type = #token
  * documentation =
    "**Beispiel:**
    `GET [base]/Observation?component-code=http://loinc.org|8480-6`
    **Anwendungshinweis:**
    Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).
    Durchsucht ausschließlich `Observation.component.code`."
