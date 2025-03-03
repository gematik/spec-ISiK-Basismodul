# Schritt 5: FHIR Restful Interaktion

---
### Informativ
---

Das erhaltene Access Token kann durch den Client am FHIR-Endpunkt des EHR oder eines Ressourcenservers eingelöst werden. Hierzu ist bei jeder RESTful Interaktion ein Authorization-Header mitzusenden. Das Token ist per [RFC6750 -  The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://datatracker.ietf.org/doc/html/rfc6750) zu kodieren.

Bei der Verarbeitung des Access Token sind die Anforderungen nach [SMART App Launch - 2.0.11 - Access FHIR API](https://hl7.org/fhir/smart-app-launch/STU2/app-launch.html#access-fhir-api) zu berücksichtigen. Unter anderem MÜSSEN folgende Validierungsschritte durchgeführt werden:

- Validierung, ob das Token abgelaufen ist oder zurückgezogen wurde.
- Validierung, ob der "aud"-Parameter des Tokens mit dem angefragten Endpunkt übereinstimmt.
- Validierung, ob alle angefragten RESTful-Interaktionen durch die Scopes innerhalb des Tokens abgedeckt sind.

----

## Beispiel

```
GET /fhir/Patient
Accept: application/fhir+json;fhirVersion=4.0
Host: server.example.com
Bearer: <Token aus Antwort von Schritt 4>
```