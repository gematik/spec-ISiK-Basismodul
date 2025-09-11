# Multiple ISiK-Versionen im parallelen Produktiveinsatz

Da mit dem 1.7.2024 zwei Stufen von ISiK im Echtbetrieb sein könnten, ist zu klären welche kritischen Szenarien hier zu beachten sind und welche Lösungen dafür notwendig sind.

Es finden zwar eine jährliche Abkündigung einer veralteten ISiK Stufe statt - Abkündigung einer Version bedeutet, dass die Version nicht mehr vom PT Data der gematik als Spezifikation gewartet wird - , aber KEIN Verbot der Nutzung dieser Version.

Die Konsequenz ist: kurzfristig muss ein Parallelbetrieb möglich sein; d.h. wir können die Ablösung einer Stufe im Produktivbetrieb einer Einrichtung nicht empfehlen (insbesondere auf die mögliche Kostenfalle bei Upgrades, s.u.).

## Szenarien
In der Folge werden unteschiedliche Szenarrien dargestellt, die im Zusammenhang mit dem Produktiveinsatz unterschiedlicher ISiK Stufen stehen.

### Happy Case
**Beschreibung:** Es gibt keinen Parallelbetrieb von ISIK innerhalb einer Einrichtung  
**Risiken und Probleme:** -  
**Erforderliche Maßnahmen:** -

### Parallelbetrieb mit Stufen-Differenz
**Beschreibung:** Es gibt einen Parallelbetrieb von unterschiedlichen Stufen, z. B. KIS in Stufe 2 und PDMS in Stufe 3 laufen im gleichen Krankenhaus

**Risiken und Probleme:**
- Instanzen sind nicht kompatibel, d. h. ein Client erhält sowohl Daten von Stufe 2 und Stufe 3, diese weichen jedoch strukturell oder semantisch ab (z. B. sieht der ISiKAbrechnugsfall - Account - ein .identifiert.type.coding.code mit "VN" vor, war in Stufe 3 verbessert wurde mit "AN").

**Erforderliche Maßnahmen:**
- N-Endpoint Architektur sorgt dafür, dass zum Zeitpunkt der Abfrage der Client bereits den korrekten Endpoint (entsprechend seiner Version) wählt und damit keine qua Stufen-Update inkompatiblen Instanzen vom Server empfängt.
- Die Version einer Profil-Instanz ist abgebildet über die Canonical in Kombination mit Pipe-notation (z.B. 'canonicalURL|4.0.1') – siehe [FHIR References](https://www.hl7.org/fhir/references.html#canonical) und [Best Practice](https://ig.fhir.de/best-practice/1.0.0/%C3%9Cbersicht-Spezifikation-Benennung-und-Versionierung-von-Artefakten.html)
- Offene Fragen: 
    - soll hier die Pipe-Notation Client-seitig persistiert werden❓
    - Instanzen sollten ggf. über Versions-ID der Stufe differenzierbar sein (aus Client-Perspektive)❓

### Parallelbetrieb mit TC-Differenz
**Beschreibung:** Es gibt einen Parallelbetrieb mit unterschiedlichen Versionen der gleichen Stufe

**Risiken und Probleme:**
- Instanzen sind nicht kompatibel – präziser: ältere sind defekt, z. B. bei ValueSets (akutes Beispiel: Broken SNOMED CT ValueSet in der Basis Stufe 3, das hier behoben wurde: [GitHub PR #398](https://github.com/gematik/spec-ISiK-Basismodul/pull/398))


**Erforderliche Maßnahmen:**
- TC in alle Stufen konsequent durchführen
- Problem hier: im Produktivbetrieb ist es womöglich zu spät (z. B. bei Stufe 1)
- Instanzen sollten ggf. über Versions-ID der Version (bis auf dritter Stelle) differenzierbar sein

### Abkündigung im Produktivbetrieb (Kostenfalle)
**Beschreibung:** Ein System in einer Stufe wird abgekündigt durch den Hersteller.

**Risiken und Probleme:**
- Insbesondere bei Abkündigung ist im Produktivbetrieb die Ablösung kritisch, wenn hier ein laufendes System abgelöst wird und durch Software-Hersteller neue Kosten für den Roll-Out einer neuen Stufe (ggf. auch nur Update einer TC-Version) abgerufen werden.

**Erforderliche/mitigierende Maßnahmen:**
- Vereinbarung eines Garantie Support für 5‑Jahre (❓) mit einem End-of-Life‑Datum
- Laufendes System soll nur durch ein **KOSTENLOSES** Upgrade abgelöst werden

## N-Endpoints für ISIK Stufen - Architektur Empfehlung

Grundsätzlich sollte ein Parallelbetrieb unteschiedlicher ISiK Stufen durch ein einzelnes System (und eine IT-Landschaft) möglich sein.
Um dies zu ermöglichen, gilt folgende **Empfehlung** zur Konfiguration eines Servers: pro ISIK Stufe SOLL ein Endpunkt bereitgestellt werden. D.h. es können N Endpunkte (N = Anzahl der ISiK Stufen) von einem einzelnen Server bereitgestellt werden.

Dies entspricht dem Vorgehen bei FHIR-Infrastructure (Quelle siehe - wobei hier auch weitere Optionen aufgeführt: https://www.devdays.com/wp-content/uploads/2021/12/Grahame-Grieve-Managing-Multiple-Versions-DevDays-2019-Redmond.pdf ).

Unter dieser Annahmen SOLL auch ein Client entsprechend konfiguriert sein, dass der Client den Server-Endpunkte abfragt, der der eignen Stufe entspricht. Ggf. können unterschiedliche Server-Endpunkte Abgefragt werden; wobei sich dann die Frage eröffnet, ob ein Versions-Persistieren durch einen Client notwendig wird.

## Fazit
Wir empfehlen, die neueste, gültige ISiK Version zu implementieren. Jedoch sollten alle Stufen von ISIK, die im Betrieb bereits ausgerollt sind, durch einen Endpunkt weiter unterstützt werden.

## FAQs
- Sollen die Hersteller den Endpunkt weiterhin pflegen / anbieten?
    - Ja: grundsätzlich SOLL ein Endpunkt anbieterseitig (KIS bzw. Basis-Server-Hersteller) NICHT einseitig gekündigt werden. Zudem SOLLEN die Unterstützungsfristen für die Stufe 1 von den Anbietern mit den Nutzern abgestimmt und Migrationsprojekte zum letzten bestätigten ISIK Stand (Stufe 2 bzw. Stufe 3) eingeplant werden.
- Sollen die Nutzer bestehende Projekte basierend auf dem Endpunkt für Stufe 1 migrieren?
    - Ja: es wird empfohlen NICHT den Status quo der Stufe 1 für Integrationsprojekte beizubehalten, sondern eine Migration auf den letzten bestätigten ISIK Stand (Stufe 2 bzw. Stufe 3) SOLL angestrebt werden.
- Soll der Stufe 1-Endpunkt noch für neue Integrationsprojekte verwendet werden?
    - Nein: es wird empfohlen NICHT den Status quo der Stufe 1 für Integrationsprojekte neu umzusetzen, sondern die Integration SOLL auf den letzten bestätigten ISIK Stand (Stufe 2 bzw. Stufe 3) für Clients angeboten werden.