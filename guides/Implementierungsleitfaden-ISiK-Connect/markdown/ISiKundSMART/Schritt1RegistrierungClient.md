# Schritt 1: Registrierung eines SMART Clients mit dem EHR

---
### Informativ
---

Bevor ein Client eine EHR Launch Sequence oder Standalone Launch Sequence ausführen kann, muss der Client beim Autorisierungsserver des EHR registriert werden. Per Abschnitt [SMART App Launch - 2.0.5 - Register App with EHR](https://hl7.org/fhir/smart-app-launch/STU2/app-launch.html#step-1-register) ist ihm freigestellt, wie diese Registrierung durchgeführt wird.

Der Autorisierungsserver muss die [Anforderungen an die Registrierung von Launch Urls und Redirect Uris - SMART App Launch - 2.0.5.1 - Request](https://hl7.org/fhir/smart-app-launch/STU2/app-launch.html#request) unterstützen. Es wird besonders auf die Anforderungen aus RFC8252 - Abschnitt [7.  Receiving the Authorization Response in a Native App](https://datatracker.ietf.org/doc/html/rfc8252#section-7) hingewiesen. Für Redirect Uris sind folgende Schemata zu unterstützen:

- Private-Use URI Scheme Redirection
- Claimed "https" Scheme URI Redirection
- Loopback Interface Redirection

Durch die zuvor genannten Ausnahmen ergibt sich das Erfordernis, dass bei der Validierung der Redirect Urls (während Schritt 3 - "Bestätigungsrelevantes System evaluiert die Autorisierungsanfrage, Authentifizierung der Endnutzer") nicht davon ausgegangen werden kann, dass diese einen statischen Wert besitzen.

Der Autorisierungsserver vergibt auf Basis der Registrierung eine Client-Id, welche zur eineindeutigen Identifizierung des Clients dient. Diese Client-Id MUSS während der Authentifizierung des Clients bei einer Access-Token-Anfrage (siehe Schritt 4 - Austausch des Autorisierungscodes für ein Zugangstoken) verwendet werden.

Die Verwendung von [RFC7591 - OAuth 2.0 Dynamic Client Registration Protocol](https://datatracker.ietf.org/doc/html/rfc7591) wird ausdrücklich empfohlen. Es wird hier die Verwendung des [Protected Dynamic Client Registration Prozesses](https://datatracker.ietf.org/doc/html/rfc7591#appendix-A.1.2) empfohlen, um ein unkontrolliertes Registrieren von Clients zu verhindern. Es ist zu beachten, dass derzeitig keine standardisierte Metadata Extension für die Registrierung der Launch Urls existiert. Diese kann beliebig gewählt werden.

----

## Beispiel

Folgender Request stellt beispielhaft dar, welche Parameter bei einer Anfrage an einen Dynamic-Client-Registration-Endpunkt vorhanden sein können:

POST /register HTTP/1.1<br>
Content-Type: application/json<br>
Accept: application/json<br>
Host: server.example.com<br>

```json
{
    "redirect_uris": ["https://example.org/redirect_uri/fhir/client/exampleId/"],
    "token_endpoint_auth_method": ["client_secret_basic", "client_secret_post", "private_key_jwt"],
    "grant_types": ["authorization_code", "refresh_token"],
    "response_types": ["code"],
    "client_name": "MyFhirClientName",
    "jwks_uri": "https://example.org/jwks/fhir/client/exampleId/jwks.json"
}
```

Response:

HTTP/1.1 201 Created<br>
Content-Type: application/json<br>
Cache-Control: no-store<br>
Pragma: no-cache<br>

```json
{
    "client_id": "TestClientId",
    "redirect_uris": ["https://example.org/redirect_uri/fhir/client/exampleId"],
    "token_endpoint_auth_method": ["client_secret_basic", "client_secret_post", "private_key_jwt"],
    "grant_types": ["authorization_code", "refresh_token"],
    "response_types": ["code"],
    "client_name": "MyFhirClientName",
    "jwks_uri": "https://example.org/jwks/fhir/client/exampleId/jwks.json"
}
```