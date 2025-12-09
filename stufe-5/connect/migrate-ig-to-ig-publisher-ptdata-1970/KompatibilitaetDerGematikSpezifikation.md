# Festlegungen zur Kompatibilität der gematik-Spezifikation - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Festlegungen zur Kompatibilität der gematik-Spezifikation**

## Festlegungen zur Kompatibilität der gematik-Spezifikation

# Kompatibilität zu IHE-Profilen

Das [IHE Technical Framework Supplement “Internet User Authorization (IUA)”](https://profiles.ihe.net/ITI/IUA/index.html) bietet, ähnlich wie **SMART on FHIR**, Möglichkeiten zur Autorisierung von Transaktionen einer RESTful HTTP API. Nachfolgend werden Unterschiede zwischen **SMART on FHIR** und IHE IUA aufgelistet, um hervorzuheben, auf welche Details zu achten ist, sodass eine Implementierung konform zu beiden Standards ist.

* [IHE IUA - Abschnitt 34.1.1.3 Resource Server](https://profiles.ihe.net/ITI/IUA/index.html#34113-resource-server): Der Ressourcen-Server MUSS im **CapabilityStatement** im Element “CapabilityStatement.rest.security.service” angegeben werden, dass IHE IUA unterstüzt wird. ()
* [IHE IUA - Abschnitt 3.103.2.1 Resource Server](https://profiles.ihe.net/ITI/IUA/index.html#310342-authorization-server-metadata-response): Im well-known-Metadata-Dokument SOLL das Element “access_token_format” angegeben werden, sodass der Client und/oder Ressourcen-Server die Struktur des **Access Tokens** ermitteln kann. () Die vorliegende Spezifikation geht davon aus, dass **Access Token** als Base64-kodierte **JSON Web Token** als Teil des REST-Aufrufs an den Ressourcen-Server übermittelt werden.
* [IHE IUA - Abschnitt 3.71.4.1.2.2. Authorization Code grant type](https://profiles.ihe.net/ITI/IUA/index.html#3714122-authorization-code-grant-type): Anstelle der Verwendung des “aud”-Parameters im Schritt “App bittet um Autorisierung” - schlägt IHE IUA die Verwendung des Parameters “resource” vor. Siehe Diskussion in [SMART on FHIR - 2.0.9 - Obtain authorization code](https://www.hl7.org/fhir/smart-app-launch/app-launch.html#obtain-authorization-code). Der “resource”-Parameter SOLLTE durch den Autorisierungsserver unterstüzt werden ().
* [IHE IUA - Abschnitt 3.71.4.1.2.2. Authorization Code grant type](https://profiles.ihe.net/ITI/IUA/index.html#3714122-authorization-code-grant-type): Die Verwendung des “redirect_uri”-Parameters ist in IHE IUA optional, wenn der Client genau eine “redirect_uri” beim Autorisierungsserver hinterlegt hat. In **SMART on FHIR** MUSS diese URI stets angegeben werden. ()
* [IHE IUA - Abschnitt 3.71.4.1.2.2. Authorization Code grant type](https://profiles.ihe.net/ITI/IUA/index.html#3714122-authorization-code-grant-type): Die Verwendung des “scope”-Parameters ist in IHE IUA optional. In **SMART on FHIR** MUSS die gesamte Menge der gewünschten **Scopes** stets angegeben werden.

