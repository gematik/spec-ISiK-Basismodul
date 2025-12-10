# Schritt 3 Abruf Access Token - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Backend Services**](BackendServices.md)
* **Schritt 3 Abruf Access Token**

## Schritt 3 Abruf Access Token

# Schritt 3: Abruf Access Token

SMART Backend Services gelten, wie in der Einleitung beschrieben, als Systeme, die Interaktionen ohne menschliche Anwender durchführen. Diese Interaktionen sind nicht an ein spezifisches Benutzerprofil gekoppelt und erfolgen ohne Authentifizierung über einen Login. Durch die Hinterlegung von Schlüsselinformationen aus Schritt 2 sichert der Ressourcen-Server ein Vertrauensverhältnis zwischen Backend Service und Ressourcen-Server zu. Dies bedeutet, dass ein Client ohne weiteren Zwischenschritt ein Access Token für den Ressourcen-Server am Autorisierungsserver anfragen kann. Dies erfolgt per [RFC6749 - Abschnitt 4.4 Client Credentials Grant](https://datatracker.ietf.org/doc/html/rfc6749#section-4.4).

-------

## JWT Client Assertions

Bei der Generierung einer Client Assertion entsprechend der Vorgaben aus [SMART App Launch - 4.1.5 - Authenticating to the Token endpoint](https://hl7.org/fhir/smart-app-launch/STU2.2/client-confidential-asymmetric.html#authenticating-to-the-token-endpoint) ist zu beachten, dass der “aud”-Parameter die URL des Autorisierungsservers enthält und nicht die des Ressourcenservers. Entsprechend der Vorgaben der Kernspezifikation DARF der “exp” NICHT länger als fünf Minuten gewählt werden (). Der Autorisierungsserver MUSS für die sichere Authentifizierung des Clients die JWT Client Assertion validieren, siehe [SMART App Launch - 4.1.5.2.1 - Authenticating to the Token endpoint](https://hl7.org/fhir/smart-app-launch/STU2.2/client-confidential-asymmetric.html#signature-verification) ().

Die Client Assertion ist nach der Signierung durch den Client als Teil eines `application/x-www-form-urlencoded`-Requests an den Token-Endpunkt des Autorisierungsserver zu übermitteln. Für weitere Hinweise siehe [SMART App Launch - 3.6.1 - Authenticating to the Token endpoint](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html#request-1).

-------

## Hinweise zu verwendeten Scopes

Als Teil der Registierung des Clients SOLLTE festgelegt werden, welche Scopes der Client anfragen und verwenden darf. Da wäre des Token-Requests kein Benutzerkontext hergestellt werden kann, SOLLTEN nur “system”-Level Scopes verwendet werden. “Patient”- und “User”-Level Scopes KÖNNEN verwendet werden (). Hier bedarf es jedoch einen proprietären Austausch des Kontexts zwischen dem Client und dem Autorisierungsserver. Falls Scopes durch den Client angefragt werden, die nicht durch die Registrierung des Clients abgedeckt sind, MUSS dies durch den Autorisierungsserver abgewiesen werden (). Die erteilten Scopes MÜSSEN in der Antwort auf die Token-Annfrage als “scope”-Parameter durch den Autorisierungsserver an den Client übergeben werden ().

-------

## Beispiel

Request:

POST /token HTTP/1.1 Content-Type: application/x-www-form-urlencoded Host: server.example.com

```
grant_type=client_credentials&
scope=system/*.rs
client_assertion_type=urn:ietf:params:oauth:client-assertion-type:jwt-bearer
client_assertion=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzM4NCJ9.eyJpc3MiOiJFeGFtcGxlIElzc3VlciIsImlhdCI6bnVsbCwiZXhwIjoxNjQzOTg2OTcwLCJhdWQiOiJodHRwczovL2V4YW1wbGUub3JnL2F1dGgvdG9rZW4iLCJzdWIiOiJUZXN0Q2xpZW50SWQiLCJqdGkiOiI3NmE1ZTA4Ni1lOWE3LTQ0ZmUtOTcyOC03MTIxNjE1YzYyOTEifQ.i_Hzfzuqquc7ouj0-CDxtddvsLxTr5RmcR-hlXYRFmAvxaAg6akf_EL6DAqRVLfW1u-FU9JJs015eTvtugYNNI0QPWdZVHJQ54TVIkVx8jsaf_RvbF3q4DpeiRdEXv1j34k_KrgNRTi6d1Rneem8qmTKIQRiWv1iYeNgENPHnL0SV69Pi7PoXr2s7JWFUO56HqWR0tmPweVm3aS24jeAaRGqISAbTPHuq-R8QVD7fMFqQBR_n6xSMCHUxZHBQDFg2c6leY8WlrwZUz9lJZnX5R76iHylfqZ-kAk38xHpnFtsmbF8YH4EUjYmSGT8SPn0y9RHKFI7LCm9p5DeVPPgYQ

```

Response:

```
{
  "token_type": "Bearer",
  "scope": "system/*.rs",
  "expires_in": 3600,
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuZWVkX3BhdGllbnRfYmFubmVyIjp0cnVlLCJzbWFydF9zdHlsZV91cmwiOiJodHRwczovL3NtYXJ0LmFyZ28ucnVuLy9zbWFydC1zdHlsZS5qc29uIiwicGF0aWVudCI6Ijg3YTMzOWQwLThjYWUtNDE4ZS04OWM3LTg2NTFlNmFhYjNjNiIsInRva2VuX3R5cGUiOiJiZWFyZXIiLCJzY29wZSI6ImxhdW5jaC9wYXRpZW50IHBhdGllbnQvT2JzZXJ2YXRpb24ucnMgcGF0aWVudC9QYXRpZW50LnJzIiwiY2xpZW50X2lkIjoiZGVtb19hcHBfd2hhdGV2ZXIiLCJleHBpcmVzX2luIjozNjAwLCJpYXQiOjE2MzM1MzIwMTQsImV4cCI6MTYzMzUzNTYxNH0.PzNw23IZGtBfgpBtbIczthV2hGwanG_eyvthVS8mrG4"
}

```

