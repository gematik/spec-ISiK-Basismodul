---
topic: markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen-Methodik
---
### Methodik

Anforderungen als Ausdruck normativer Festlegungen werden durch die dem [RFC2119](https://tools.ietf.org/html/rfc2119) entsprechenden, in Großbuchstaben geschriebenen deutschen Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN sowie ihrer Pluralformen gekennzeichnet.

### Auswirkung auf Zertifizierung und Testberichte

SHALL/MUSS drückt in ISiK entsprechend eine notwendig zu erfüllende Anforderung aus. Die Anforderung wird über einen oder mehrere Tests abgedeckt, sodass ein System für das betreffende Modul nicht zertifiziert werden kann, wenn ein System einen Test zur Anforderungsabdeckung nicht erfolgreich durchläuft.

Eine Anforderung mit dem Ausdruck SHOULD/SOLL ist im Testkontext gleichbedeutend mit einer MAY/KANN Anforderung; jedoch wird dringend geraten die Anforderung zu implementieren.

MAY/KANN drückt in ISiK eine freiwillig zu erfüllende Anforderung aus. Die Anforderung wird über einen Test abgedeckt, dessen Ergebnis ist jedoch nicht maßgeblich für die Zertifizierung eines Systems gegen das betreffende Modul.
Bei erfolgreichem Durchlaufen eines Tests zu einer freiwilligen Anforderung, erscheint das Ergebnis im Testbericht.

