# Schritt 6: Refresh Token & Revocation

---
### Informativ
---

## Refresh Tokens

Die Gültigkeitsdauer eines Access-Tokens kann beliebig durch das bestätigungsrelevante System gewählt werden. Mit Hinblick auf [RFC6819 - OAuth 2.0 Threat Model and Security Considerations - Limited Access Token Lifetime](https://datatracker.ietf.org/doc/html/rfc6819#section-3.1.2) soll die Gültigkeitsdauer auf Minuten oder Stunden beschränkt werden. Das Gültigkeitsdatum wird im Access Token durch den Parameter "expires_in" angegeben. Alternativ kann die Gültigkeit des Tokens über den Introspection-Endpunkt abgefragt werden.

Um eine häufige Authentifizierung der Benutzer und/oder des Clients zu vermeiden, soll der Autorisierungsserver die Ausstellung von Refresh Tokens unterstützen.

Folgende Anforderungen aus [SMART App Launch - 2.0.12 - Refresh access token](https://hl7.org/fhir/smart-app-launch/STU2/app-launch.html#refresh-access-token) sind bei der Unterstützung eines Token Refresh zu beachten:

- Der "offline_access" Scope muss unterstützt werden, der "online_access" Scope soll unterstützt werden.
- Ein Refresh Token muss an die anfordernde Client Id gebunden werden, d.h. eine abweichende Client Id (übermittelt durch die Autorisierung des Clients) DARF NICHT verwendbar sein, um ein neues Access Token auszustellen.
- Der Autorisierungsserver muss bei der Ausstellung eines neuen Access Tokens sicherstellen, dass im Vergleich zum originalen Access Token nur ein Subset oder die gleiche Menge an Scopes erlaubt werden. Fordert der Client neue Scopes an, soll das System die Menge aller Scopes auf die zuvor erlaubten Scopes einschränken.
- Der Launch Context muss zurückgegeben werden, falls die entsprechenden Scopes durch den Client oder im originalen Access Token angefordert wurden.

Alle verpflichtenden Implementierungsdetails aus [SMART App Launch - 2.0.12 - Refresh access token](https://hl7.org/fhir/smart-app-launch/STU2/app-launch.html#refresh-access-token) müssen bei der Umsetzung eines Token Refresh durch den Autorisierungsserver unterstützt werden.

----

### Beispiel

## Token Revocation

Ein Access-Token MUSS zu einem beliebigen Zeitpunkt durch einen beliebigen Client per [RFC7009 - OAuth 2.0 Token Revocation](https://datatracker.ietf.org/doc/html/rfc7009) zurückgezogen werden können.
Es muss sichergestellt werden, dass kein zeitlicher Verzug zwischen der Bestätigung, der zuvorgenannten Anfrage und der Invalidierung des Tokens herrscht, d.h nach einer Revocation-Anfrage muss sichergestellt werden, dass Anfragen beim Ressourcen-Server mit einem entsprechenden Token zurückgewiesen werden. Hierzu wird die Verwendung eines Introspection-Endpunktes nach [RFC7662 - OAuth 2.0 Token Introspection](https://datatracker.ietf.org/doc/html/rfc7662) empfohlen.

----

### Beispiel`
```
GET /fhir/Patient
Content-Type: application/x-www-form-urlencoded
Host: server.example.com

grant_type=refresh_token&
refresh_token=<Refresh Token aus Schritt 4>&
scope=<Scopes aus Schritt 2>
```