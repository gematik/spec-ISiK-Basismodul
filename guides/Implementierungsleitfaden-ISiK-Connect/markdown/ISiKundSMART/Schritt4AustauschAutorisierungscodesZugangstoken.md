# Schritt 4: Austausch des Autorisierungscodes für ein Zugangstoken

---
### Informativ
---

Sowohl für Public als auch Confidential Clients erfolgt durch den SMART App Launch ein Authorization Code Flow. Dieser Ablauf wird verwendet, um die in [Implicit Grant - OAuth 2.0 Security Best Current Practice](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics-09#section-2.1.2) dokumentierten Sicherheitsrisiken zu minimieren. Im folgenden Schritt wird somit mittels einer vom Client initiierten Anfrage der Authorization Code durch ein Access Token ausgetauscht.

----

## Authentifizierung der Clients

Confidential Clients müssen sich gegenüber dem "Token"-Endpunkt des Autorisierungsservers authentifizieren. Hierfür MÜSSEN folgende Möglichkeiten unterstützt werden:

### JSON Web Token (JWT) Profile for OAuth 2.0 Client Authentication and Authorization Grants (Empfehlung)

Die präferierte Variante für die Authentifizierung des Clients erfolgt per [RFC 7523 - JSON Web Token (JWT) Profile for OAuth 2.0 Client Authentication and Authorization Grants](https://datatracker.ietf.org/doc/html/rfc7523). Hierzu müs sen folgende Schritte untersützt werden:

1. Der Client generiert ein Private/Public Key Pair. Hierzu kann entweder [RSA (vgl. RFC8017 - PKCS #1: RSA Cryptography Specifications Version 2.2)](https://datatracker.ietf.org/doc/html/rfc8017) oder [ECDSA (vgl. RFC6979 - Deterministic Usage of the Digital Signature Algorithm (DSA) and Elliptic Curve Digital Signature Algorithm (ECDSA))](https://datatracker.ietf.org/doc/html/rfc6979) als Algorithmus verwendet werden. Der öffentliche Schlüsselteil wird dem Autorisierungsserver als [JSON Web Key](https://datatracker.ietf.org/doc/html/rfc7517) eingebettet in einem [JSON Web Key Set](https://datatracker.ietf.org/doc/html/rfc7517#section-5) übermittelt. Angaben zur Schlüssellänge sind den Abschnitten [RFC7518 - Abschnitt 3.3 - Digital Signature with RSASSA-PKCS1-v1_](https://datatracker.ietf.org/doc/html/rfc7518#section-3.3) und [RFC7518 - Abschnitt 3.4 - Digital Signature with ECDSA](https://datatracker.ietf.org/doc/html/rfc7518#section-3.4) zu entnehmen.

Folgende Anforderungen werden an den JSON Web Key gestellt:

- Als Signaturalgorithmus muss durch den Autorisierungsserver mindestens RS256, ES256, RS384, sowie ES384 akzeptiert werden, [siehe RFC7518 - "alg" (Algorithm) Header Parameter Values for JWS](https://datatracker.ietf.org/doc/html/rfc7518#section-3.1). Weitere Signaturalgorithmen können unterstützt werden.

- Der JSON Web Key muss mindestens folgende Parameter enthalten:
    - ["kty" (Key Type) Parameter](https://datatracker.ietf.org/doc/html/rfc7517#section-4.1)
    - ["kid" (Key ID) Parameter](https://datatracker.ietf.org/doc/html/rfc7517#section-4.5)
    - Für einen öffentlichen RSA Web Key: "n" (Modulus) Parameter, "e" (Exponent) Parameter (Siehe [RFC7518 - 6.3 Parameters for RSA Keys](https://datatracker.ietf.org/doc/html/rfc7518#section-6.3))
    - Für einen öffentlichen Elliptic Curve Web Key: "crv" (Curve) Parameter, "x" (X Coordinate) Parameter, "y" (Y Coordinate) Parameter (Siehe [RFC7518 - 6.2 Parameters for RSA Keys](https://datatracker.ietf.org/doc/html/rfc7518#section-6.2))

2. Ein Austausch des JSON Web Key muss durch eine der nachfolgenden Optionen implementiert werden. Option 1) wird aufgrund der in [SMART App Launch - 5 - Client Authentication: Asymmetric (public key)](https://hl7.org/fhir/smart-app-launch/STU2/client-confidential-asymmetric.html#client-authentication-asymmetric-public-key) aufgeführten Vorteile empfohlen.

(1) Austausch einer TLS-abgesicherten URL über die das oben genannte JSON Web Key Set abgerufen werden kann. Der Autorisierungsserver soll prüfen, dass diese URL mit dem ["jku" Parameter](https://datatracker.ietf.org/doc/html/rfc7515#section-4.1.2) der Signatur des für die Authentifizierung des Clients verwendeten JSON Web Token übereinstimmt.

(2) Das JSON Web Key Set kann dem Autorisierungsserver direkt mitgeteilt werden. In diesem Fall soll das JSON Web Key Set mindestens zwei Schlüssel enthalten, sodass eine unterbrechungsfreie Schlüsselrotation durchgeführt werden kann. Nachteile dieser Option sind in [SMART App Launch - 5.0.4 - Registering a SMART Backend Service (communicating public keys)](https://hl7.org/fhir/smart-app-launch/STU2/client-confidential-asymmetric.html#registering-a-client-communicting-public-keys) zusammengefasst.

Die verwendeten JSON Web Keys sollen regelmäßig gewechselt werden, um einem Schlüsselmissbrauch vorzubeugen.

3. Der Client erzeugt ein JSON Web Token entsprechend der in [SMART App Launch - 5.0.5 - Authenticating to the Token endpoint](https://hl7.org/fhir/smart-app-launch/STU2/client-confidential-asymmetric.html#authenticating-to-the-token-endpoint) definierten Vorgaben und verwendet dies als "client_assertion".

### HTTP Basic Authentication:

Der Client tauscht während der Registrierung (siehe {{pagelink:ImplementationGuide/markdown/Schritt1RegistierungClient.md, text:Schritt 1 - Registrierung einer SMART App mit dem bestätigungsrelevanten System}}) ein Client Secret mit dem EHR aus. Eine Authentifizierung des Clients erfolgt per [RFC7617 - The 'Basic' HTTP Authentication Scheme](https://datatracker.ietf.org/doc/html/rfc7617). Als "username" muss die Client Id verwendet werden. Als Passwort muss das vorher ausgetauschte Client Secret verwendet werden.

----

## Austausch des Autorisierungscodes für ein Zugangstoken

In Abschnitt [SMART App Launch - 2.0.10 - Obtain access token](https://hl7.org/fhir/smart-app-launch/STU2/app-launch.html#obtain-access-token) werden alle notwendigen Parameter definiert, durch die der Client mittels einer HTTP POST Anfrage (application/x-www-form-urlencoded kodiert) am token-Endpunkt des Autorisierungsservers ein Zugangstoken erhalten kann. Zu beachten ist, dass neben den in der Kernspezifikation gekennzeichneten Pflichtparametern, die Parameter "id_token" und "refresh_token" unterstützt werden MÜSSEN. Ein id_token muss ausgestellt werden, wenn der Client einen "openid fhirUser" Scope anfragt. Durch den Client angefragte Launch Context Claims müssen zurückgegeben werden. Eine Ausnahme ergibt sich durch den Fall, dass der Kontext im EHR nicht vorliegt (z.B. es besteht kein Fall/Patientenkontext). 

Alle verpflichtenden Implementierungsdetails aus [SMART App Launch - 2.0.10 - Obtain access token](https://hl7.org/fhir/smart-app-launch/STU2/app-launch.html#obtain-access-token) müssen durch den Autorisierungsserver unterstützt werden.

Es sei explizit darauf hingewiesen, dass sowohl die SMART App Launch Spezifikation, als auch der vorliegende Implementierungsleitfaden keine Vorgaben bezüglich der Struktur oder des Inhalts des Zugangstokens enthalten. Die Verwendung eines Referenztokens wird empfohlen, um einen Token Revocation Mechanismus effizient implementieren zu können. Siehe {{pagelink:ImplementationGuide/markdown/Schritt6RefreshToken.md, text:Schritt 6: Refresh Token & Revocation}}.

----

## Beispiel

1. Generierung Public/Private Key:

```json
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

2. JSON Web Key Set mit öffenlichem Schlüsselteil erzeugen:

```json
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

3. Bereitstellung des JSON Web Key Sets unter einer ohne weitere Authtentifizierung erreichbare URL (https abgesichert) ODER Übermittelung des JSON Web Key Sets an den Autorisierungsserver (keine weiteren Vorgaben).

4. Erzeugung eines JSON Web Tokens signiert mit dem oben genannten Private/Public Key Pair:

```json
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzM4NCJ9.eyJpc3MiOiJFeGFtcGxlIElzc3VlciIsImlhdCI6bnVsbCwiZXhwIjoxNjQzOTg2OTcwLCJhdWQiOiJodHRwczovL2V4YW1wbGUub3JnL2F1dGgvdG9rZW4iLCJzdWIiOiJUZXN0Q2xpZW50SWQiLCJqdGkiOiI3NmE1ZTA4Ni1lOWE3LTQ0ZmUtOTcyOC03MTIxNjE1YzYyOTEifQ.i_Hzfzuqquc7ouj0-CDxtddvsLxTr5RmcR-hlXYRFmAvxaAg6akf_EL6DAqRVLfW1u-FU9JJs015eTvtugYNNI0QPWdZVHJQ54TVIkVx8jsaf_RvbF3q4DpeiRdEXv1j34k_KrgNRTi6d1Rneem8qmTKIQRiWv1iYeNgENPHnL0SV69Pi7PoXr2s7JWFUO56HqWR0tmPweVm3aS24jeAaRGqISAbTPHuq-R8QVD7fMFqQBR_n6xSMCHUxZHBQDFg2c6leY8WlrwZUz9lJZnX5R76iHylfqZ-kAk38xHpnFtsmbF8YH4EUjYmSGT8SPn0y9RHKFI7LCm9p5DeVPPgYQ
```

Dekodierte Form:

Header:
```json
{
  "typ": "JWT",
  "alg": "RS384"
}
```
Body:
```json
{
  "iss": "Example Issuer",
  "iat": null,
  "exp": 1643986970,
  "aud": "https://example.org/auth/token",
  "sub": "TestClientId",
  "jti": "76a5e086-e9a7-44fe-9728-7121615c6291"
}
```

5. Access Token abrufen
```
POST /token HTTP/1.1
Host: server.example.com
Content-Type: application/x-www-form-urlencoded

grant_type=authorization_code&
code=<Autorisierungscode aus Schritt 3>&
redirect_uri=https://example.org/redirect_uri/fhir/client/exampleId&
code_verifier=2bb80d537b1da3e38bd30361aa855686bde0eacd7162fef6a25fe97bf527a25b&
client_id=TestClientId&
client_assertion_type=urn:ietf:params:oauth:client-assertion-type:jwt-bearer&
client_assertion=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzM4NCJ9.eyJpc3MiOiJFeGFtcGxlIElzc3VlciIsImlhdCI6bnVsbCwiZXhwIjoxNjQzOTg2OTcwLCJhdWQiOiJodHRwczovL2V4YW1wbGUub3JnL2F1dGgvdG9rZW4iLCJzdWIiOiJUZXN0Q2xpZW50SWQiLCJqdGkiOiI3NmE1ZTA4Ni1lOWE3LTQ0ZmUtOTcyOC03MTIxNjE1YzYyOTEifQ.i_Hzfzuqquc7ouj0-CDxtddvsLxTr5RmcR-hlXYRFmAvxaAg6akf_EL6DAqRVLfW1u-FU9JJs015eTvtugYNNI0QPWdZVHJQ54TVIkVx8jsaf_RvbF3q4DpeiRdEXv1j34k_KrgNRTi6d1Rneem8qmTKIQRiWv1iYeNgENPHnL0SV69Pi7PoXr2s7JWFUO56HqWR0tmPweVm3aS24jeAaRGqISAbTPHuq-R8QVD7fMFqQBR_n6xSMCHUxZHBQDFg2c6leY8WlrwZUz9lJZnX5R76iHylfqZ-kAk38xHpnFtsmbF8YH4EUjYmSGT8SPn0y9RHKFI7LCm9p5DeVPPgYQ

```