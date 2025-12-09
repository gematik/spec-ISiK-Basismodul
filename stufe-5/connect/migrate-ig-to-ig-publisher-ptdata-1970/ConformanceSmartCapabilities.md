# Conformance Smart Capabilities - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Conformance Smart Capabilities**

## Conformance Smart Capabilities

# Conformance: SMART Capabilities

-------

### Normativ

-------

Bestätigungsrelevante Systeme in der Rolle eines ISiK-Ressourcenservers MÜSSEN eine **SMART Capabilities** JSON-Datei als ‘.well-known’-Dokument (vgl. [RFC5785](https://datatracker.ietf.org/doc/html/rfc5785)) anbieten. Clients können auf diese Art und Weise u.a. abfragen, welche Kontexte und **Scopes** seitens des ISiK-Ressourcenservers unterstützt werden.

ISiK-Ressourcen-Server MÜSSEN dieses JSON-Dokument unter der URL bereitstellen, der durch Anhängen von `/.well-known/smart-configuration` an ihre Basis-URL gebildet wird. Die Kodierung der **SMART Capabilities** MUSS den Vorgaben aus [SMART App Launch - 6.1 - FHIR Authorization Endpoint and Capabilities Discovery using a Well-Known Uniform Resource Identifiers (URIs)](https://hl7.org/fhir/smart-app-launch/STU2.2/conformance.html#using-well-known) entsprechen.

## Vorgaben für Well-Known Capability Dokumente

Im Rahmen des Bestätigungsverfahrens für ISiK-Connect werden die folgenden Angaben in den **SMART Capabilities** eines ISiK-Ressourcenservers geprüft:

* `authorization_endpoint`: Es MUSS die URL des Autorisierungs-Endpunkts des **OAuth2**-Autorisierungsservers angegeben sein, über die ein ISiK-Client eine Autorisierungsanfrage stellen kann ().
* `grant_types_supported`: Die **OAuth2 Grant Types** `authorization_code` (Authorization Code Flow mit PKCE) UND `client_credentials` (Client Credentials) MÜSSEN unterstützt werden (). 
* Der **Grant Type** `refresh_token` SOLL unterstützt werden. Wenn dieser **Grant Type** angegeben ist, MUSS eine Erneuerung des **Access Token** über ein **Refresh Token** möglich sein.
 
* `token_endpoint`: Es MUSS die URL des Token-Endpunkts des **OAuth2**-Autorisierungsservers angegeben sein, über die ein Zugriffstoken zur Bestätigung einer Autorisierung zum Zugriff auf geschützte Ressourcen des ISiK-Ressourcenservers abgerufen werden kann ().
* `code_challenge_methods_supported`: Es MÜSSEN die vom Autorisierungsserver unterstützten PKCE-Code-Challenge-Methoden angegeben sein. Die Methode `S256` MUSS unterstützt werden. Die Methode `plain` DARF NICHT unterstützt werden ().
* `scopes_supported`: siehe . Der ISiK-Ressourcen-Server MUSS alle aufgeführten **Scopes** unterstützen. Er KANN weitere **Scopes** unterstützen ()s.
* `capabilities` 
* `permission-v2`: ISiK-Ressourcen-Server MÜSSEN die SMARTv2-Syntax für die Kodierung von **Scopes** unterstützen. Sie KÖNNEN zusätzlich auch die grobranulare Syntax von SMARTv1 unterstützen (`permission-v1`) ()
 

## Beispiel für eine Anfrage

```
GET /.well-known/smart-configuration HTTP/1.1
Host: fhir.cdr.example.com

```

## Beispiel für eine SMART Capabilities Datei

```
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

