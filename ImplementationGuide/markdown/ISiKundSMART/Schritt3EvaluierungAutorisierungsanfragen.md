# Schritt 3: EHR evaluiert die Autorisierungsanfrage, Authentifizierung der Endnutzer

---
### Informativ
---

Um die Entscheidung zu treffen, ob eine Autorisierungsanfrage eines Clients zu akzeptieren oder abzulehnen ist, kann der Autorisierungsserver eine Authentifizierung der Benutzer verlangen.
Sowohl die Smart App Launch Spezifikation, als auch der vorliegende Implementierungsleitfaden, legen keine Vorgaben diesbezüglich fest. Es ist darauf zu achten, dass bei einer fehlgeschlagenen Authentifizierung dem Endnutzer ein eindeutiger Fehlerhinweis angezeigt wird. Ein Redirect zum Client mit einem entsprechenden Fehlercode ist optional. 

Im Falle einer erfolgreichen Authentifizierung, muss der Autorisierungsserver die Parameter, welche unter [SMART App Launch - 2.0.9 - Obtain authorization code](https://hl7.org/fhir/smart-app-launch/STU2/app-launch.html#step-4-authorization-code) dokumentiert sind, an den Client zurückliefern. Die Hinweise zur Gültigkeitsdauer des Autorisierungscodes müssen eingehalten werden.

Als Ergebnis dieses Schritts erhält der Client einen einmalig gültigen Autorisierungscode, welcher im weiteren Verlauf gegen ein Autorisierungstoken getauscht werden kann.

## Hinweise zu Sektoralen IDPs der Gematik

Perspektivisch sollen für die Authentisierung von Patienten in Krankenhäusern die [_Sektoralen IDPs_](https://fachportal.gematik.de/hersteller-anbieter/komponenten-dienste/identity-provider-idp) der Gematik unterstützt werden. Diese basieren wie das Modul ISiK-Sicherheit auf den Standards OAuth2 und OpenID  Connect. Wie in der Übersicht des Moduls ISiK-Sicherheit dargestellt, werden in dieser Spezifikation keine Vorgaben bezüglich der einzusetzenden Authentisierungsdienste getroffen. Eine Unterstützung der Sektoralen IDPs ist perspektivisch jedoch unerlässlich. Um dieses herstellen zu können, muss der Autorisierungsserver einen im https-Aufruf enthaltenen Parameter *ISS_IDP* unverändert an den Authentifizierungsdienst ('innerer Flow' im Sinne der genannten gematik-Spezifikation) weitergeben. In diesem Parameter wird definiert, welcher Authorisierungsdienst anzusprechen ist.

----

## Beispiel

Response:
```
Location: 
https://example.org/redirect_uri/fhir/client/exampleId?
code=123abc&
state=df01f5f8-5bf2-45ea-ab7a-706361da0515
```