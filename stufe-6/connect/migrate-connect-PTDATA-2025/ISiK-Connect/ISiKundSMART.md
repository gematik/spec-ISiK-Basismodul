# ISiK Connect und Smart-on-FHIR - ISiK Connect Implementierungsleitfaden v6.0.0-rc

ISiK Connect Implementierungsleitfaden

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* **ISiK Connect und Smart-on-FHIR**

## ISiK Connect und Smart-on-FHIR

ISiK-Connect setzt auf dem HL7-Standard **SMART on FHIR** auf, der u. a. das Zusammenspiel der Standards FHIR und OAuth2 für die Weitergabe von Zugriffskontexten zum sicheren Zugriff auf FHIR-Ressourcen beschreibt. Wie in der beschrieben, umfassen die normativen Vorgaben von ISiK-Connect jedoch nur eine Untermenge des SMART-on-FHIR-API.

Ergänzend zu den normativen Abschnitten und wird in diesem und den untergeordneten Abschnittem skizziert, wie eine vollständige Umsetzung des SMART-on-FHIR-Standards im Kontext von ISiK aussehen kann. **Dieser Abschnitt ist informativ, d. h. in ISiK Stufe 5 nicht Gegenstand des Konformitätsfeststellungsverfahrens.**

#### SMART App Launch

Ziel des **Smart App Launch** (siehe ) ist es, ein Zugangstoken von einem OAuth2-kompatiblen Autorisierungsserver zu erhalten, mittels dessen eine FHIR RESTful API-Interaktion durchgeführt werden kann. Dies erfolgt unter Berücksichtigung der Zugriffsrechte der Benutzer in dem den **SMART App Launch** auslösenden System (KIS, Portal), das im Folgenden analog zur SMART-on-FHIR-Spezifikation als ‘EHR’ (**Electronic Health Record**) bezeichnet wird.

Um ein Zugangstoken für den Zugriff auf einen Ressourcen-Server zu erhalten, sind folgende sechs Schritte notwendig, die auf den Unterseiten zu dieser Seite jeweils im Detail beschrieben sind:

* Registrierung eines **SMART Clients** mit dem EHR
* Der **SMART Client** fragt den Autorisierungsserver des EHR um Autorisierung an
* Der EHR evaluiert die Autorisierungsanfrage und initiiert ggf, die Authentifizierung des (menschlichen) Nutzers
* Austausch des vom EHR an den Client ausgegebenen Autorisierungscodes gegen ein Zugangstoken.
* Ausführung einer durch das Zugangstoken abgesicherten FHIR Restful Interaktion am Ressourcen-Server
* Ausstellung eines “Refresh”-Zugangstoken.

Eine Übersicht des zusammenhängenden **SMART App Launch** ist dem Abschnitt [SMART App Launch - 2.1.3 - SMART authorization & FHIR access: overview](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#smart-authorization--fhir-access-overview) der SMART-on-FHIR-Spezifikation zu entnehmen.

### Schritt 1: Registrierung eines SMART Clients mit dem EHR

Bevor ein Client eine EHR Launch Sequence oder Standalone Launch Sequence ausführen kann, muss der Client beim Autorisierungsserver des EHR registriert werden. Per Abschnitt [SMART App Launch - 2.1.5 - Register App with EHR](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#step-1-register) ist ihm freigestellt, wie diese Registrierung durchgeführt wird.

Der Autorisierungsserver muss die [Anforderungen an die Registrierung von Launch Urls und Redirect Uris - SMART App Launch - 2.0.5.1 - Request](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#request) unterstützen. Es wird besonders auf die Anforderungen aus RFC8252 - Abschnitt [7. Receiving the Authorization Response in a Native App](https://datatracker.ietf.org/doc/html/rfc8252#section-7) hingewiesen. Für Redirect URIs sind folgende Schemata zu unterstützen:

* Private-Use URI Scheme Redirection
* Claimed “https” Scheme URI Redirection
* Loopback Interface Redirection

Durch die zuvor genannten Ausnahmen ergibt sich das Erfordernis, dass bei der Validierung der Redirect URLs (während Schritt 3 - “Bestätigungsrelevantes System evaluiert die Autorisierungsanfrage, Authentifizierung der Endnutzer”) nicht davon ausgegangen werden kann, dass diese einen statischen Wert besitzen.

Der Autorisierungsserver vergibt auf Basis der Registrierung eine Client-Id, welche zur eineindeutigen Identifizierung des Clients dient. Diese Client-Id MUSS während der Authentifizierung des Clients bei einer Access-Token-Anfrage (siehe Schritt 4 - Austausch des Autorisierungscodes für ein Zugangstoken) verwendet werden. ()

Die Verwendung von [RFC7591 - OAuth 2.0 Dynamic Client Registration Protocol](https://datatracker.ietf.org/doc/html/rfc7591) wird ausdrücklich empfohlen. Es wird hier die Verwendung des [Protected Dynamic Client Registration Prozesses](https://datatracker.ietf.org/doc/html/rfc7591#appendix-A.1.2) empfohlen, um ein unkontrolliertes Registrieren von Clients zu verhindern. Es ist zu beachten, dass derzeitig keine standardisierte Metadata Extension für die Registrierung der Launch Urls existiert. Diese kann beliebig gewählt werden.

-------

#### Beispiel

Folgender Request stellt beispielhaft dar, welche Parameter bei einer Anfrage an einen Dynamic-Client-Registration-Endpunkt vorhanden sein können:

POST /register HTTP/1.1
 Content-Type: application/json
 Accept: application/json
 Host: server.example.com

```
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

HTTP/1.1 201 Created
 Content-Type: application/json
 Cache-Control: no-store
 Pragma: no-cache

```
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

### Schritt 2: App bittet um Autorisierung

Im nachfolgenden Schritt wird durch den Client an dem “authorize”-Endpunkt des Autorisierungsservers ein Autorisierungscode angefragt, welcher innerhalb eines Authorization Code Flows (vgl. [RFC6749](https://datatracker.ietf.org/doc/html/rfc6749#section-4.1)) durch ein OAuth 2.0 Access Token ersetzt werden kann.

Abhängig davon, ob der Client durch einen **EHR Launch** oder **Standalone Launch** (siehe ) gestartet wird, existieren unterschiedliche Schritte für die Anfrage eines Autorisierungscodes.

-------

#### EHR Launch

Der EHR (KIS, Portal, etc.) MUSS in der Lage sein, den Client durch einen externen Kontextaufruf zu starten (). Im Kontext des derzeitig eingeloggten Benutzers wird der Client gestartet, vgl. . Der Aufruf des Clients MUSS alle in [SMART App Launch - 2.0.7 - Launch App: EHR Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#step-2-launch-ehr) dokumentierten Parameter enthalten.

Es sei darauf hingewiesen, dass jeder EHR Launch mit einem eindeutigen Launch Parameter zu assoziieren ist. Mit diesem beliebig gewählten Parameter (z.B. eine UUID) kann der Client das Access Token mit dem Kontext verknüpfen, aus dem der Client gestartet worden ist. Der Kontext kann beispielsweise Informationen zum Patienten oder Kontakt/Fall enthalten, welcher dem Anwender zuvor präsentiert wurde. Dieser Kontext wird dem Client durch sogenannte [Launch Context Claims](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#scopes-for-requesting-context-data) vermittelt. Diese Claims enthalten IDs der FHIR-Ressourcen, welche die zuvor genannten Datenobjekte repräsentieren. Es ist notwendig innerhalb der SMART authorization sequence die angeforderten [Launch Context Claims](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#scopes-for-requesting-context-data) an den Client zurückzugeben, vgl. Abschnitt . Der Client kann spezifische Kontextparameter anfragen. Sollten diese jedoch nicht verfügbar sein (z.B. der Client wurde ohne Patientenkontext aufgerufen), können die zurückgegebenen Launch Context Claims von den gewünschten Scopes abweichen.

-------

#### Standalone Launch Sequence

Aufgrund des fehlenden Kontexts zwischen Client und dem System, kann der Client durch Angabe von gewünschten Smart Launch Scopes bestimmen, welche Details durch den Autorisierungsserver in der Access Token Response bereitgestellt werden MÜSSEN (). Beispielsweise kann, äquivalent zum EHR Launch, der Patienten- und/oder Kontakt/Fall-Kontext angefordert werden. Die Kodierung der Scopes ist im normativen Teil von ISiK-Connect auf der Seite beschrieben.

-------

#### Parameter Autorisierungsanfrage

Der Aufruf des Clients MUSS alle in [SMART App Launch - 2.0.9 - Obtain authorization code](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#step-4-authorization-code) dokumentierten Parameter enthalten (). Insbesondere gilt dies für die Unterstützung von HTTP POST-basierten Autorisierungsanfragen und der Unterstützung von [Proof Key for Code Exchange by OAuth Public Clients](https://datatracker.ietf.org/doc/html/rfc7636).

Zu beachten ist, dass durch den SMART App Launch der “state”-Parameter abweichend von RFC6749 verpflichtend ist.

-------

#### TLS

Alle Autorisierungsendpunkte MÜSSEN per HTTPS (TLS-Verschlüsselung) erreichbar sein. Im Echtbetrieb muss die Kommunikation ausschließlich per HTTPS erfolgen. Vorgaben zur einzusetzenden TLS Version, siehe [Sicherheitsaspekte](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_Rest) ().

-------

#### Abruf SMART Configuration

Als Einstiegspunkt für einen Standalone Launch MUSS dem Client die Url des FHIR Endpunktes bekannt gegeben werden (). Anschließend erfolgt eine Abfrage des “.well-known/smart-configuration” Dokumentes, welche durch den FHIR Endpunkt bereitgestellt werden MUSS (). Vorgaben zum Format sind dem Abschnitt zu entnehmen. Hierdurch erhält der Client dynamisch die Adresse des Autorisierungsservers inkl. “authorize” und “token” Endpunkt. Falls durch das bestätigungsrelevante System OAuth 2.0 Endpunkte optional über das CapabilityStatement des FHIR-Endpunktes zur Verfügung gestellt werden, MÜSSEN diese Inhalte identisch zu den Inhalten des “.well-known/smart-configuration” Dokumentes sein ().

-------

#### Hinweise zu Identity Scopes

Um Informationen über die authentifizierten Endbenutzer:in zu erhalten, kann ein Client per OpenID Connect ein Identitätstoken zusammen mit einem Zugangstoken anfragen. Hierzu sind in Kombination die Scopes “openid” und “fhirUser” zu verwenden. EHR MÜSSEN die Vorgaben nach [2.2.4 - Scopes for requesting identity data](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#scopes-for-requesting-identity-data) umsetzen (). Anstatt dem Claim “fhirUser” kann - aus Gründen der Rückwärtskompatibilität - auch der Claim “profile” verwendet werden.

-------

#### Hinweise zu Access Scopes

Innerhalb des Scope Parameters, welcher als Teil der Autorisierungsanfrage versendet wird, kann der Client dem Server mitteilen, welche Scopes zur korrekten Ausführung notwendig sind, d.h. welche FHIR-Restful Interaktionen vom Client benötigt werden. Diese Scopes repräsentieren die Menge aller Scopes, welche durch den Client gewünscht werden, jedoch nicht notwendigerweise durch den Server unterstüzt und/oder erlaubt werden. Es steht dem Autorisierungsserver frei diese Scopes einzuschränken, falls der Client für die Anforderung der Scopes nicht berechtigt ist. Weitere Details zur Syntax der Access Scopes siehe .

Hieraus folgt, dass die angeforderten Scopes nur die Kategorien an Rechten repräsentieren, die an den anfragenden Client delegiert werden dürfen. Somit können generell bestimmte Rechte ausgeschlossen werden. Eine Anfrage an den FHIR-REST-API-Endpunkt kann jedoch trotz validem Token mit den spezifizierten Scopes abgelehnt werden, falls während der Evaluierung der Anfrage seitens des Servers festgestellt wird, dass der Benutzer die gewünschten Ressourcen nicht verarbeiten darf.

Der Autorisierungsserver MUSS eine Konfiguration der erlaubten Scopes pro Client unterstützen. ()

-------

#### Beispiel

POST /authorize HTTP/1.1
 Content-Type: application/x-www-form-urlencoded
 Host: server.example.com

```
response_type=code&
client_id=TestClientId&
redirect_uri=https://example.org/redirect_uri/fhir/client/exampleId&iss_idp
scope=user/*.rs openid fhirUser&
state=df01f5f8-5bf2-45ea-ab7a-706361da0515&
aud=http://example.org/fhir/&
code_challenge=2bb80d537b1da3e38bd30361aa855686bde0eacd7162fef6a25fe97bf527a25b&
code_challenge_method=S256

```

### Schritt 3: EHR evaluiert die Autorisierungsanfrage, Authentifizierung der Endnutzer

Um die Entscheidung zu treffen, ob eine Autorisierungsanfrage eines Clients zu akzeptieren oder abzulehnen ist, kann der Autorisierungsserver eine Authentifizierung der Benutzer verlangen. Sowohl die Smart App Launch Spezifikation, als auch der vorliegende Implementierungsleitfaden, legen keine Vorgaben diesbezüglich fest. Es ist darauf zu achten, dass bei einer fehlgeschlagenen Authentifizierung dem Endnutzer ein eindeutiger Fehlerhinweis angezeigt wird. Ein Redirect zum Client mit einem entsprechenden Fehlercode ist optional.

Im Falle einer erfolgreichen Authentifizierung, muss der Autorisierungsserver die Parameter, welche unter [SMART App Launch - 2.1.9 - Obtain authorization code](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#step-4-authorization-code) dokumentiert sind, an den Client zurückliefern. Die Hinweise zur Gültigkeitsdauer des Autorisierungscodes müssen eingehalten werden.

Als Ergebnis dieses Schritts erhält der Client einen einmalig gültigen Autorisierungscode, welcher im weiteren Verlauf gegen ein Autorisierungstoken getauscht werden kann.

#### Hinweise zu Sektoralen IDPs der Gematik

Perspektivisch sollen für die Authentisierung von Patienten in Krankenhäusern die [**Sektoralen IDPs**](https://fachportal.gematik.de/hersteller-anbieter/komponenten-dienste/identity-provider-idp) der Gematik unterstützt werden. Diese basieren wie das Modul ISiK Connect auf den Standards OAuth2 und OpenID Connect. Wie in der Übersicht des Moduls ISiK-Sicherheit dargestellt, werden in dieser Spezifikation keine Vorgaben bezüglich der einzusetzenden Authentisierungsdienste getroffen. Eine Unterstützung der Sektoralen IDPs ist perspektivisch jedoch unerlässlich. Um dieses herstellen zu können, MUSS der Autorisierungsserver einen im https-Aufruf enthaltenen Parameter **ISS_IDP** unverändert an den Authentifizierungsdienst (‘innerer Flow’ im Sinne der genannten gematik-Spezifikation) weitergeben. In diesem Parameter wird definiert, welcher Authorisierungsdienst anzusprechen ist.

-------

#### Beispiel

Response:

```
Location: 
https://example.org/redirect_uri/fhir/client/exampleId?
code=123abc&
state=df01f5f8-5bf2-45ea-ab7a-706361da0515

```

### Schritt 4: Austausch des Autorisierungscodes für ein Zugangstoken

Sowohl für Public als auch Confidential Clients erfolgt durch den SMART App Launch ein Authorization Code Flow. Dieser Ablauf wird verwendet, um die in [Implicit Grant - OAuth 2.0 Security Best Current Practice](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics-09#section-2.1.2) dokumentierten Sicherheitsrisiken zu minimieren. Im folgenden Schritt wird somit mittels einer vom Client initiierten Anfrage der Authorization Code durch ein Access Token ausgetauscht.

-------

#### Authentifizierung der Clients

Confidential Clients MÜSSEN sich gegenüber dem “Token”-Endpunkt des Autorisierungsservers authentifizieren. Hierfür MÜSSEN folgende Möglichkeiten unterstützt werden ():

##### JSON Web Token (JWT) Profile for OAuth 2.0 Client Authentication and Authorization Grants (Empfehlung)

Die präferierte Variante für die Authentifizierung des Clients erfolgt per [RFC 7523 - JSON Web Token (JWT) Profile for OAuth 2.0 Client Authentication and Authorization Grants](https://datatracker.ietf.org/doc/html/rfc7523). Hierzu MÜSSEN folgende Schritte unterstützt werden:

1. Der Client generiert ein Private/Public Key Pair. Hierzu kann entweder[RSA (vgl. RFC8017 - PKCS #1: RSA Cryptography Specifications Version 2.2)](https://datatracker.ietf.org/doc/html/rfc8017)oder[ECDSA (vgl. RFC6979 - Deterministic Usage of the Digital Signature Algorithm (DSA) and Elliptic Curve Digital Signature Algorithm (ECDSA))](https://datatracker.ietf.org/doc/html/rfc6979)als Algorithmus verwendet werden. Der öffentliche Schlüsselteil wird dem Autorisierungsserver als[JSON Web Key](https://datatracker.ietf.org/doc/html/rfc7517)eingebettet in einem[JSON Web Key Set](https://datatracker.ietf.org/doc/html/rfc7517#section-5)übermittelt. Angaben zur Schlüssellänge sind den Abschnitten[RFC7518 - Abschnitt 3.3 - Digital Signature with RSASSA-PKCS1-v1_](https://datatracker.ietf.org/doc/html/rfc7518#section-3.3)und[RFC7518 - Abschnitt 3.4 - Digital Signature with ECDSA](https://datatracker.ietf.org/doc/html/rfc7518#section-3.4)zu entnehmen.

Folgende Anforderungen werden an den JSON Web Key gestellt:

* Als Signaturalgorithmus muss durch den Autorisierungsserver mindestens RS256, ES256, RS384, sowie ES384 akzeptiert werden, [siehe RFC7518 - “alg” (Algorithm) Header Parameter Values for JWS](https://datatracker.ietf.org/doc/html/rfc7518#section-3.1). Weitere Signaturalgorithmen können unterstützt werden.
* Der JSON Web Key muss mindestens folgende Parameter enthalten:

1. Ein Austausch des JSON Web Key muss durch eine der nachfolgenden Optionen implementiert werden. Option 1) wird aufgrund der in[SMART App Launch - 4.1 - Client Authentication: Asymmetric (public key)](https://hl7.org/fhir/smart-app-launch/STU2.2/client-confidential-asymmetric.html#client-authentication-asymmetric-public-key)aufgeführten Vorteile empfohlen.

(1) Austausch einer TLS-abgesicherten URL über die das oben genannte JSON Web Key Set abgerufen werden kann. Der Autorisierungsserver soll prüfen, dass diese URL mit dem [“jku” Parameter](https://datatracker.ietf.org/doc/html/rfc7515#section-4.1.2) der Signatur des für die Authentifizierung des Clients verwendeten JSON Web Token übereinstimmt.

(2) Das JSON Web Key Set kann dem Autorisierungsserver direkt mitgeteilt werden. In diesem Fall soll das JSON Web Key Set mindestens zwei Schlüssel enthalten, sodass eine unterbrechungsfreie Schlüsselrotation durchgeführt werden kann. Nachteile dieser Option sind in [SMART App Launch - 5.0.4 - Registering a SMART Backend Service (communicating public keys)](https://hl7.org/fhir/smart-app-launch/STU2/client-confidential-asymmetric.html#registering-a-client-communicting-public-keys) zusammengefasst.

Die verwendeten JSON Web Keys sollen regelmäßig gewechselt werden, um einem Schlüsselmissbrauch vorzubeugen.

1. Der Client erzeugt ein JSON Web Token entsprechend der in[SMART App Launch - 4.1.5 - Authenticating to the Token endpoint](https://hl7.org/fhir/smart-app-launch/STU2.2/client-confidential-asymmetric.html#authenticating-to-the-token-endpoint)definierten Vorgaben und verwendet dies als “client_assertion”.

##### HTTP Basic Authentication:

Der Client tauscht während der Registrierung (siehe ) ein Client Secret mit dem EHR aus. Eine Authentifizierung des Clients erfolgt per [RFC7617 - The ‘Basic’ HTTP Authentication Scheme](https://datatracker.ietf.org/doc/html/rfc7617). Als “username” muss die Client Id verwendet werden. Als Passwort muss das vorher ausgetauschte Client Secret verwendet werden.

-------

#### Austausch des Autorisierungscodes für ein Zugangstoken

In Abschnitt [SMART App Launch - 2.1.10 - Obtain access token](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#obtain-access-token) werden alle notwendigen Parameter definiert, durch die der Client mittels einer HTTP POST Anfrage (application/x-www-form-urlencoded kodiert) am token-Endpunkt des Autorisierungsservers ein Zugangstoken erhalten kann. Zu beachten ist, dass neben den in der Kernspezifikation gekennzeichneten Pflichtparametern, die Parameter “id_token” und “refresh_token” unterstützt werden MÜSSEN (). Ein id_token muss ausgestellt werden, wenn der Client einen “openid fhirUser” Scope anfragt. Durch den Client angefragte Launch Context Claims MÜSSEN zurückgegeben werden. Eine Ausnahme ergibt sich durch den Fall, dass der Kontext im EHR nicht vorliegt (z.B. es besteht kein Fall/Patientenkontext).

Alle verpflichtenden Implementierungsdetails aus [SMART App Launch - 2.1.10 - Obtain access token](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#obtain-access-token) MÜSSEN durch den Autorisierungsserver unterstützt werden ().

Es sei explizit darauf hingewiesen, dass sowohl die SMART App Launch Spezifikation, als auch der vorliegende Implementierungsleitfaden keine Vorgaben bezüglich der Struktur oder des Inhalts des Zugangstokens enthalten. Die Verwendung eines Referenztokens wird empfohlen, um einen Token Revocation Mechanismus effizient implementieren zu können. Siehe .

-------

#### Beispiel

1. Generierung Public/Private Key:

```
{
    "p": "xmB9u3-YZG9wQudAA0lrSxfPMrzdyRg9_ucaXVVXmBfEkP4B0TJf4Qy3PElekRpRwQQzkTGru06uJZr3C-FnnjbVyzGjSJovWP5S4vBm7zWVGMMhdLDCRtGqx2qC0MGLV7aAGg7XN590US_8XRqtMiMv4RHwj5mzMK-S-4-G_dc",
    "kty": "RSA",
    "q": "vrKETfeUnSZY7eMy0E1UfY8wwE0tFC5r63hpXMqvBKKORXd4XOdqVPUoGeWg-tk4g7aQWW5SJIYk72EGaRuZ-S1giFo724fbJ0lxMxM-HOqMrxhCEDFNOzsjS-tZzbq8krXOp8yAPMENx3bvMFyk2N84qFVaD4gkibIPR6QM_fM",
    "d": "iuoCvT6rbu0ME2V61cw9OSxafD6Fbk2rL4IwkS2AfiMnoEeHpII36oHjU-OYRCRtOGoj8Hes0NkBTffXocYbyXKAxpdzogh1WqPyCraIDJSNR_Wv2ebHdtmie_3ZOdPntYN6MN8y7rinlZBWNgXH8d7GCo48UnT4zu66gyqN7gWVN90it4B0Xcy_3RdHpIO3e1ES-zDWDkP8APL8NPxMAqX7NL5sYtWxKCdFXfMi456iZ_THMu4dJC9QtqTkzphwtsbSrGTTMZXHuqw92fH7NRRhc17vyanNzMXbPJ6Wiy8DoI_1Gopz9HFOWzK7RiQeJtes136vTRXKa3vcnZFB4Q",
    "e": "AQAB",
    "use": "sig",
    "kid": "t0xPKRRKap5FF6TItqt-ANoiSysWce7vAGL8vCXRBXQ",
    "qi": "cl61xViRvryTB6ZpIlxd_4Iqj7P27TUVg5foJ3OfzoqwMdCHzxqdmUkc5_hvZB18eUTxu6hj1f4tw63r61D84SdOxJ8YC7b7Cu1sc2sh4YvlrpeGjKFZfHQCCxQigXJID4XBElxxqoiTWnCrUQPq6cMo3An9h-_w0AjtJAA2i2Y",
    "dp": "dNWDd5hQYmaXkW-s7cKh5Fojd9hwLu2OJcBqcKnAqxzkchiHbXPjsCHTETiM75y2pZ0Z2duNLwXJ3vADrAWXB0F4bPHRHwNf-2Pd4TaBCUVfiHP0EkvAQAFgOY5reRNkQ8aCb9ZpvqK02NQQJ618b9j1a_Mq4Qg-1t-xC2Oet4U",
    "alg": "RS384",
    "dq": "i-nGkL3Z2ANOtBtCKPrTxtvMVQtKy8fTfox2IZLEHo51_BnPwbo4leTZa0bDecjuYhUMi9EZi5qwdsGlRnDt45ibfu9Vg5iF_qkv2N2BcQ3V8pHFxsOlepPFLeqblQoxWSLzYMH2RJ0QUwy8KauPd18v3rHgxgyJYk22UEXZEmk",
    "n": "k8Xy7sDGlI_8R1hAVnWw1skyzANUyctiJzcVQYNIBKtJ-otzokwcPhI1Nj9HEjyBw-2ikPw7eQ9VbcVzOZmJY57XcuMFl0UkR8acGdTt5VNQMxKdbzk3RbbFv9fuadT9nMjZfXZ1Z1UX9dxYt51T-Ay7Qpo0_cczxlKMBmdScZOiQCCyfUW4rVwDQZ5-Vnjk8AkmhChjidrsnu_aVj8P4A_g6Ik-XIyhGwFmXHFWyqAANgZdV-kypdaXwGjgrNBjw0AbDC90AghYhjY1nslWFgZIeI-DDqUyS6X8NX3CIPQsTs2iSXBQTeoOmSmLHAjC4rgiajtCM7cMdlY0SBRuFQ"
}

```

1. JSON Web Key Set mit öffenlichem Schlüsselteil erzeugen:

```
{
    "keys": [
        {
            "kty": "RSA",
            "e": "AQAB",
            "use": "sig",
            "kid": "t0xPKRRKap5FF6TItqt-ANoiSysWce7vAGL8vCXRBXQ",
            "alg": "RS384",
            "n": "k8Xy7sDGlI_8R1hAVnWw1skyzANUyctiJzcVQYNIBKtJ-otzokwcPhI1Nj9HEjyBw-2ikPw7eQ9VbcVzOZmJY57XcuMFl0UkR8acGdTt5VNQMxKdbzk3RbbFv9fuadT9nMjZfXZ1Z1UX9dxYt51T-Ay7Qpo0_cczxlKMBmdScZOiQCCyfUW4rVwDQZ5-Vnjk8AkmhChjidrsnu_aVj8P4A_g6Ik-XIyhGwFmXHFWyqAANgZdV-kypdaXwGjgrNBjw0AbDC90AghYhjY1nslWFgZIeI-DDqUyS6X8NX3CIPQsTs2iSXBQTeoOmSmLHAjC4rgiajtCM7cMdlY0SBRuFQ"
        }
    ]
}

```

1. Bereitstellung des JSON Web Key Sets unter einer ohne weitere Authtentifizierung erreichbare URL (https abgesichert) ODER Übermittelung des JSON Web Key Sets an den Autorisierungsserver (keine weiteren Vorgaben).
1. Erzeugung eines JSON Web Tokens signiert mit dem oben genannten Private/Public Key Pair:

```
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzM4NCJ9.eyJpc3MiOiJFeGFtcGxlIElzc3VlciIsImlhdCI6bnVsbCwiZXhwIjoxNjQzOTg2OTcwLCJhdWQiOiJodHRwczovL2V4YW1wbGUub3JnL2F1dGgvdG9rZW4iLCJzdWIiOiJUZXN0Q2xpZW50SWQiLCJqdGkiOiI3NmE1ZTA4Ni1lOWE3LTQ0ZmUtOTcyOC03MTIxNjE1YzYyOTEifQ.i_Hzfzuqquc7ouj0-CDxtddvsLxTr5RmcR-hlXYRFmAvxaAg6akf_EL6DAqRVLfW1u-FU9JJs015eTvtugYNNI0QPWdZVHJQ54TVIkVx8jsaf_RvbF3q4DpeiRdEXv1j34k_KrgNRTi6d1Rneem8qmTKIQRiWv1iYeNgENPHnL0SV69Pi7PoXr2s7JWFUO56HqWR0tmPweVm3aS24jeAaRGqISAbTPHuq-R8QVD7fMFqQBR_n6xSMCHUxZHBQDFg2c6leY8WlrwZUz9lJZnX5R76iHylfqZ-kAk38xHpnFtsmbF8YH4EUjYmSGT8SPn0y9RHKFI7LCm9p5DeVPPgYQ

```

Dekodierte Form:

Header:

```
{
  "typ": "JWT",
  "alg": "RS384"
}

```

Body:

```
{
  "iss": "Example Issuer",
  "iat": null,
  "exp": 1643986970,
  "aud": "https://example.org/auth/token",
  "sub": "TestClientId",
  "jti": "76a5e086-e9a7-44fe-9728-7121615c6291"
}

```

1. Access Token abrufen ``` POST /token HTTP/1.1 Host: server.example.com Content-Type: application/x-www-form-urlencoded

grant_type=authorization_code& code=<Autorisierungscode aus Schritt 3>& redirect_uri=https://example.org/redirect_uri/fhir/client/exampleId& code_verifier=2bb80d537b1da3e38bd30361aa855686bde0eacd7162fef6a25fe97bf527a25b& client_id=TestClientId& client_assertion_type=urn:ietf:params:oauth:client-assertion-type:jwt-bearer& client_assertion=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzM4NCJ9.eyJpc3MiOiJFeGFtcGxlIElzc3VlciIsImlhdCI6bnVsbCwiZXhwIjoxNjQzOTg2OTcwLCJhdWQiOiJodHRwczovL2V4YW1wbGUub3JnL2F1dGgvdG9rZW4iLCJzdWIiOiJUZXN0Q2xpZW50SWQiLCJqdGkiOiI3NmE1ZTA4Ni1lOWE3LTQ0ZmUtOTcyOC03MTIxNjE1YzYyOTEifQ.i_Hzfzuqquc7ouj0-CDxtddvsLxTr5RmcR-hlXYRFmAvxaAg6akf_EL6DAqRVLfW1u-FU9JJs015eTvtugYNNI0QPWdZVHJQ54TVIkVx8jsaf_RvbF3q4DpeiRdEXv1j34k_KrgNRTi6d1Rneem8qmTKIQRiWv1iYeNgENPHnL0SV69Pi7PoXr2s7JWFUO56HqWR0tmPweVm3aS24jeAaRGqISAbTPHuq-R8QVD7fMFqQBR_n6xSMCHUxZHBQDFg2c6leY8WlrwZUz9lJZnX5R76iHylfqZ-kAk38xHpnFtsmbF8YH4EUjYmSGT8SPn0y9RHKFI7LCm9p5DeVPPgYQ

```
### Schritt 5: FHIR Restful Interaktion

Das erhaltene Access Token kann durch den Client am FHIR-Endpunkt des EHR oder eines Ressourcenservers eingelöst werden. Hierzu ist bei jeder RESTful Interaktion ein Authorization-Header mitzusenden. Das Token ist per [RFC6750 -  The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://datatracker.ietf.org/doc/html/rfc6750) zu kodieren.

Bei der Verarbeitung des Access Token sind die Anforderungen nach [SMART App Launch - 2.0.11 - Access FHIR API](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#access-fhir-api) zu berücksichtigen. Unter anderem MÜSSEN folgende Validierungsschritte durchgeführt werden: ()

- Validierung, ob das Token abgelaufen ist oder zurückgezogen wurde.
- Validierung, ob der "aud"-Parameter des Tokens mit dem angefragten Endpunkt übereinstimmt.
- Validierung, ob alle angefragten RESTful-Interaktionen durch die Scopes innerhalb des Tokens abgedeckt sind.

----

#### Beispiel


```

GET /fhir/Patient Accept: application/fhir+json;fhirVersion=4.0 Host: server.example.com Bearer: <Token aus Antwort von Schritt 4>

```
### Schritt 6: Refresh Token & Revocation

#### Refresh Tokens

Die Gültigkeitsdauer eines Access-Tokens kann beliebig durch das bestätigungsrelevante System gewählt werden. Mit Hinblick auf [RFC6819 - OAuth 2.0 Threat Model and Security Considerations - Limited Access Token Lifetime](https://datatracker.ietf.org/doc/html/rfc6819#section-3.1.2) SOLL die Gültigkeitsdauer auf Minuten oder Stunden beschränkt werden. () Das Gültigkeitsdatum wird im Access Token durch den Parameter "expires_in" angegeben. Alternativ kann die Gültigkeit des Tokens über den Introspection-Endpunkt abgefragt werden.

Um eine häufige Authentifizierung der Benutzer und/oder des Clients zu vermeiden, SOLL der Autorisierungsserver die Ausstellung von Refresh Tokens unterstützen. ()

Folgende Anforderungen aus [SMART App Launch - 2.1.12 - Refresh access token](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#refresh-access-token) sind bei der Unterstützung eines Token Refresh zu beachten:

- Der "offline_access" Scope muss unterstützt werden, der "online_access" Scope soll unterstützt werden.
- Ein Refresh Token muss an die anfordernde Client Id gebunden werden, d.h. eine abweichende Client Id (übermittelt durch die Autorisierung des Clients) DARF NICHT verwendbar sein, um ein neues Access Token auszustellen.
- Der Autorisierungsserver muss bei der Ausstellung eines neuen Access Tokens sicherstellen, dass im Vergleich zum originalen Access Token nur ein Subset oder die gleiche Menge an Scopes erlaubt werden. Fordert der Client neue Scopes an, soll das System die Menge aller Scopes auf die zuvor erlaubten Scopes einschränken.
- Der Launch Context muss zurückgegeben werden, falls die entsprechenden Scopes durch den Client oder im originalen Access Token angefordert wurden.

Alle verpflichtenden Implementierungsdetails aus [SMART App Launch - 2.1.12 - Refresh access token](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#refresh-access-token) MÜSSEN bei der Umsetzung eines Token Refresh durch den Autorisierungsserver unterstützt werden. ()

----

##### Beispiel

#### Token Revocation

Ein Access-Token MUSS zu einem beliebigen Zeitpunkt durch einen beliebigen Client per [RFC7009 - OAuth 2.0 Token Revocation](https://datatracker.ietf.org/doc/html/rfc7009) zurückgezogen werden können. ()
Es MUSS sichergestellt werden, dass kein zeitlicher Verzug zwischen der Bestätigung, der zuvorgenannten Anfrage und der Invalidierung des Tokens herrscht, d.h nach einer Revocation-Anfrage muss sichergestellt werden, dass Anfragen beim Ressourcen-Server mit einem entsprechenden Token zurückgewiesen werden. Hierzu wird die Verwendung eines Introspection-Endpunktes nach [RFC7662 - OAuth 2.0 Token Introspection](https://datatracker.ietf.org/doc/html/rfc7662) empfohlen. ()

----

##### Beispiel`

```

GET /fhir/Patient Content-Type: application/x-www-form-urlencoded Host: server.example.com

grant_type=refresh_token& refresh_token=<Refresh Token aus Schritt 4>& scope=<Scopes aus Schritt 2> ```

