---
topic: markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen-Methodik
---
### Methodik

Anforderungen als Ausdruck normativer Festlegungen werden durch die dem [RFC2119](https://tools.ietf.org/html/rfc2119) entsprechenden, in Großbuchstaben geschriebenen deutschen Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN sowie ihrer Pluralformen gekennzeichnet.

### Auswirkung auf Zertifizierung und Testberichte

SHALL/MUSS drückt in ISiK entsprechend eine notwendig zu erfüllende Anforderung aus. Die Anforderung wird über einen oder mehrere Tests abgedeckt, sodass ein System für das betreffende Modul nicht zertifiziert werden kann, wenn ein System einen Test zur Anforderungsabdeckung nicht erfolgreich durchläuft.

Das Weglassen einer SHOULD‑Anforderung ist nur zulässig, wenn der Hersteller im Rahmen des Zertifizierungsverfahrens eine klare, schriftliche und überprüfbare Begründung liefert, die nachweist, dass die entsprechende Anforderung oder das entsprechende Datenelement dauerhaft nicht implementierbar ist, das diese aufgrund der Zweckbestimmung des Systems niemals innerhalb des deklarierten Interoperabilitätsumfangs des Systems unterstützt werden können.
Fehlt eine akzeptable Begründung, gilt die Nichterfüllung einer SHOULD‑Anforderung als Nichtkonformität.

MAY/KANN drückt in ISiK eine freiwillig zu erfüllende Anforderung aus. Die Anforderung wird über einen Test abgedeckt, dessen Ergebnis ist jedoch nicht maßgeblich für die Zertifizierung eines Systems gegen das betreffende Modul.
Bei erfolgreichem Durchlaufen eines Tests zu einer freiwilligen Anforderung, erscheint das Ergebnis im Testbericht.

