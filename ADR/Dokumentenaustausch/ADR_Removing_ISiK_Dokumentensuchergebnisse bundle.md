# ADR-2110: Entfernen des ISiK-Dokumentensuchergebnisse-Bundle-Profils

Datum: 2026-03-19

Status: Angenommen

Ticket: PTDATA-2110

## Kontext

Im Modul Dokumentenaustausch existierte ein eigenes Bundle-Profil fuer Dokumentensuchergebnisse.

Die inhaltliche Analyse hat ergeben, dass in diesem Profil nur sehr wenige zusaetzliche Einschraenkungen gegenueber dem FHIR-Core vorgenommen wurden. Die relevanten Anforderungen werden bereits durch die FHIR-Core-Spezifikation fuer `Bundle` mit `type = searchset` abgedeckt.

Zusaetzlich fordert auch IHE MHD kein separates, projektspezifisches Bundle-Profil fuer Suchergebnisse.

Vor diesem Hintergrund ist ein eigenes ISiK-Profil an dieser Stelle nicht erforderlich und fuehrt eher zu zusaetzlicher Komplexitaet in Spezifikation, Implementierung und Konformitaetspruefung.

## Optionen

- Beibehalten eines separaten ISiK-Dokumentensuchergebnisse-Bundle-Profils: verworfen, da kaum Mehrwert gegenueber FHIR Core und zusaetzlicher Wartungsaufwand.
- Reduzieren auf FHIR-Core-Searchset-Bundle ohne separates ISiK-Profil: ausgewaehlt, da fachlich ausreichend, interoperabel und konsistent mit IHE MHD.

## Entscheidung

Das gesonderte ISiK-Bundle-Profil fuer Dokumentensuchergebnisse wird entfernt.

Fuer Suchergebnisse wird kuenftig direkt auf das FHIR-Core-`searchset`-Bundle abgestellt. Es wird kein zusaetzliches, modulspezifisches Profil fuer diesen Anwendungsfall definiert.

## Konsequenzen

- Die Spezifikation wird schlanker und einfacher verstaendlich.
- Implementierende Systeme muessen kein zusaetzliches ISiK-Bundle-Profil fuer Suchergebnisse beruecksichtigen.
- Der Aufwand fuer Pflege, Review und Testartefakte sinkt.
- Das Interoperabilitaetsrisiko durch divergierende oder redundant restriktive Profilierung wird reduziert.
- Etwaige projektspezifische Hinweise zur Verwendung von Suchergebnis-Bundles muessen in narrativer Form (Leittext) statt in einem separaten Profil beschrieben werden.

## Anhänge (optional)

- FHIR Core: Bundle (`searchset`)
- IHE MHD (keine Forderung nach separatem projektspezifischem Suchergebnis-Bundle-Profil)