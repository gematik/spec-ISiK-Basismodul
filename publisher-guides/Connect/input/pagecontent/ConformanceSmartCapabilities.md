

**Normativ**


Bestätigungsrelevante Systeme in der Rolle eines ISiK-Ressourcenservers MÜSSEN eine _SMART Capabilities_ JSON-Datei als '.well-known'-Dokument (vgl. [RFC5785](https://datatracker.ietf.org/doc/html/rfc5785)) anbieten. Clients können auf diese Art und Weise u.a. abfragen, welche Kontexte und _Scopes_ seitens des ISiK-Ressourcenservers unterstützt werden.

ISiK-Ressourcen-Server MÜSSEN dieses JSON-Dokument unter der URL bereitstellen, der durch Anhängen von ```/.well-known/smart-configuration``` an ihre Basis-URL gebildet wird. Die Kodierung der _SMART Capabilities_ MUSS den Vorgaben aus [SMART App Launch - 6.1 - FHIR Authorization Endpoint and Capabilities Discovery using a Well-Known Uniform Resource Identifiers (URIs)](https://hl7.org/fhir/smart-app-launch/STU2.2/conformance.html#using-well-known) entsprechen. 

### Vorgaben für Well-Known Capability Dokumente

Im Rahmen des Bestätigungsverfahrens für ISiK-Connect werden die folgenden Angaben in den _SMART Capabilities_ eines ISiK-Ressourcenservers geprüft:

* ```authorization_endpoint```: Es MUSS die URL des Autorisierungs-Endpunkts des _OAuth2_-Autorisierungsservers angegeben sein, über die ein ISiK-Client eine Autorisierungsanfrage stellen kann ([ANF-CON-46](Anforderungsuebersicht.html)).
* ```grant_types_supported```: Die _OAuth2 Grant Types_ ```authorization_code``` (Authorization Code Flow mit PKCE) UND ```client_credentials``` (Client Credentials) MÜSSEN unterstützt werden ([ANF-CON-47](Anforderungsuebersicht.html)).  
  * Der _Grant Type_ ```refresh_token``` SOLL unterstützt werden. Wenn dieser _Grant Type_ angegeben ist, MUSS eine Erneuerung des _Access Token_ über ein _Refresh Token_ möglich sein.
* ```token_endpoint```: Es MUSS die URL des Token-Endpunkts des _OAuth2_-Autorisierungsservers angegeben sein, über die ein Zugriffstoken zur Bestätigung einer Autorisierung zum Zugriff auf geschützte Ressourcen des ISiK-Ressourcenservers abgerufen werden kann ([ANF-CON-48](Anforderungsuebersicht.html)).
* ```code_challenge_methods_supported```: Es MÜSSEN die vom Autorisierungsserver unterstützten PKCE-Code-Challenge-Methoden angegeben sein. Die Methode ```S256``` MUSS unterstützt werden. Die Methode ```plain``` DARF NICHT unterstützt werden ([ANF-CON-49](Anforderungsuebersicht.html)).
* ```scopes_supported```: siehe [Scopes und Kontexte](ConformanceScopesKontexte.html). Der ISiK-Ressourcen-Server MUSS alle aufgeführten _Scopes_ unterstützen. Er KANN weitere _Scopes_ unterstützen ([ANF-CON-50](Anforderungsuebersicht.html))s. 
* ```capabilities```
  * ```permission-v2```: ISiK-Ressourcen-Server MÜSSEN die SMARTv2-Syntax für die Kodierung von _Scopes_ unterstützen. Sie KÖNNEN zusätzlich auch die grobranulare Syntax von SMARTv1 unterstützen (```permission-v1```) ([ANF-CON-51](Anforderungsuebersicht.html))

### Beispiel für eine Anfrage

``` 
GET /.well-known/smart-configuration HTTP/1.1
Host: fhir.cdr.example.com
```

### Beispiel für eine SMART Capabilities Datei

``` JSON
{
  "authorization_endpoint": "https://auth0.example.com/auth/authorize",
  "token_endpoint": "https://auth0.example.com/auth/token",
  "grant_types_supported": [    "authorization_code", "client_credentials"  ],
  "scopes_supported": [ "patient/Patient.rs", "patient/Observation.rs", "patient/Condition.rs" ],
  "response_types_supported": ["code"],
  "introspection_endpoint": "https://auth0.example.com/user/introspect",
  "revocation_endpoint": "https://auth0.example.com/user/revoke",
  "code_challenge_methods_supported": ["S256"],
  "capabilities": [ "permission-v2" ]
}
```
