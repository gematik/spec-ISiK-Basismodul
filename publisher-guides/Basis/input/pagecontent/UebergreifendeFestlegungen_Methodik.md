### Methodik

Anforderungen als Ausdruck normativer Festlegungen werden durch die dem [RFC2119](https://tools.ietf.org/html/rfc2119) entsprechenden, in Großbuchstaben geschriebenen deutschen Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN sowie ihrer Pluralformen gekennzeichnet.

### Auswirkung auf Zertifizierung und Testberichte

SHALL/MUSS drückt in ISiK entsprechend eine notwendig zu erfüllende Anforderung aus. Die Anforderung wird über einen oder mehrere Tests abgedeckt, sodass ein System für das betreffende Modul nicht zertifiziert werden kann, wenn ein System einen Test zur Anforderungsabdeckung nicht erfolgreich durchläuft.

Das Weglassen einer SOLL/SHOULD‑Anforderung ist nur zulässig, wenn der Hersteller im Rahmen des Zertifizierungsverfahrens eine klare, schriftliche und überprüfbare Begründung liefert, die nachweist, dass die entsprechende Anforderung oder das entsprechende Datenelement dauerhaft nicht implementierbar ist, das diese aufgrund der Zweckbestimmung des Systems niemals innerhalb des deklarierten Interoperabilitätsumfangs des Systems unterstützt werden können.
Fehlt eine akzeptable Begründung, gilt die Nichterfüllung einer SHOULD‑Anforderung als Nichtkonformität.

MAY/KANN drückt in ISiK eine freiwillig zu erfüllende Anforderung aus. Die Anforderung wird über einen Test abgedeckt, dessen Ergebnis ist jedoch nicht maßgeblich für die Zertifizierung eines Systems gegen das betreffende Modul.
Bei erfolgreichem Durchlaufen eines Tests zu einer freiwilligen Anforderung erscheint das Ergebnis im Testbericht.

### Verbindlichkeit in CapabilityStatements

Da die FHIR-Kernspezifikation nur englischsprachige Schlüsselwörter kennt, wird die Verbindlichkeit in CapabilityStatements über Extension-Codes ausgedrückt. Die folgende Tabelle stellt den Zusammenhang zu den oben eingeführten deutschen Schlüsselwörtern her:

| Deutsches Schlüsselwort | RFC2119    | Code in CapabilityStatements                |
|--------------------------|-----------|----------------------------------------------|
| MUSS                     | SHALL     | `SHALL`                                       |
| SOLL                     | SHOULD    | `SHOULD`                                      |
| KANN                     | MAY       | `MAY`                                         |
| SOLL NICHT               | SHOULD NOT| `SHOULD-NOT`                                  |
| DARF NICHT               | SHALL NOT | *(in CapabilityStatements nicht verwendet)*   |

Zwei Extensions transportieren diese Codes an unterschiedlichen Stellen:

- Die **CapabilityStatement-Imports-Expectation-Extension** kennzeichnet importierte *Rollen* innerhalb eines Akteur-CapabilityStatements. 
- Die **CapabilityStatement-Expectation-Extension** kennzeichnet einzelne Interaktionen/Profile *innerhalb* eines Rollen-CapabilityStatements.

In den tabellarischen Darstellungen der CapabilityStatements erscheint ausschließlich die englische Code-Fassung; die deutsche Entsprechung ist obiger Tabelle zu entnehmen.

