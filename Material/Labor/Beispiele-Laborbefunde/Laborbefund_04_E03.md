# Laborbefund BL26-100444 vom 2026-08-11

Quelle: [`Laborbefund_04_E03.bundle.json`](Laborbefund_04_E03.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | af9b3e46-7ae5-5fd3-82ee-5d0f58d77d9b |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100444<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-11T15:30:00+02:00 |
| Ressourcen | 16 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 2, Specimen 1, ServiceRequest 1, Observation 4, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100444 vom 2026-08-11 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100444<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-11T15:30:00+02:00 |
| Patient | Anna Schneider |
| Kontakt | Kontakt ambulatory 2026-08-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0004<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100444<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Hypothyreose, nicht naeher bezeichnet (`ICD-10-GM#E03.9` (v2026))<br>Struma nodosa (`ICD-10-GM#E04.9` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100444<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0004, L26-100444 |
| Befundzeitpunkt | 2026-08-11T15:30:00+02:00 |
| Freigegeben | 2026-08-11T15:30:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | SE01 (Serum) |
| Ergebnisse | 4 Observation(s) |

## Patient

| Element | Inhalt |
|---|---|
| Name | Anna Schneider (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1004<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` S456789013<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | female |
| Geburtsdatum | 1982-02-18 |
| Aktiv | ja |
| Adresse | Birkenallee 22, 13086 Berlin, DE (both) |

## Beteiligte

| Ressource | Name | Rolle im Befund | Identifier | Kontakt | Adresse | Profil |
|---|---|---|---|---|---|---|
| Practitioner | Dr. Richard Mueller | Autor des Befunds<br>Befunderstellung (performer)<br>Befundfreigabe (resultsInterpreter) | `EN` MUELLE<br><sub>https://labor-testdaten.example/labor/270719100/sid/mitarbeiter</sub> |  |  | ISiKPersonImGesundheitsberuf |
| Practitioner | Dr. med. Heribert Topp-Gluecklich | Einsender (anfordernde Person)<br>behandelnde Person | `LANR` 776299002<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR</sub> |  |  | ISiKPersonImGesundheitsberuf |
| Organization | Labor Mueller | Labor (Auftragsempfaenger)<br>Verwahrer des Befunds (custodian)<br>Autor des Befunds<br>Befunderstellung (performer) | `BSNR` 270719100<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR</sub> | phone: 02211456546 (work) | Ottostr. 2, 50859 Koeln, DE | ISiKOrganisation |
| Organization | Praxis Dr. med. Heribert Topp-Gluecklich | Einsender (Betriebsstaette) | `BSNR` 398212400<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR</sub> | phone: 061511111111 (work) | Musterstr. 1, 64297 Darmstadt, DE | ISiKOrganisation |

## Kontakt (Encounter)

| Element | Inhalt |
|---|---|
| Status | finished |
| Klasse | ambulatory (`v3-ActCode#AMB`) |
| Patient | Anna Schneider |
| Zeitraum | 2026-08-10 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#E03.9` (v2026) | V |  | Hypothyreose, nicht naeher bezeichnet | active | provisional | 2026-08-11 | ISiKDiagnose |
| 2 | `ICD-10-GM#E04.9` (v2026) | G |  | Struma nodosa | active | confirmed | 2026-08-11 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-10T09:00:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Thyreoidea-stimulierendes Hormon basal | `LOINC#3016-3`, `lokal#TSH` | 8.6 mU/l | mU/l (`mU/L`) | H (erhoeht) | 0.27 mU/l – 4.2 mU/l | SE01 (Serum) | 2026-08-11T15:30:00+02:00 | final | Chemistry studies (set) |
| 2 | freies Thyroxin | `LOINC#3024-7`, `lokal#FT4` | 0.8 ng/dl | ng/dl (`ng/dL`) | L (erniedrigt) | 0.93 ng/dl – 1.7 ng/dl | SE01 (Serum) | 2026-08-11T15:30:00+02:00 | final | Chemistry studies (set) |
| 3 | freies Trijodthyronin | `LOINC#3051-0`, `lokal#FT3` | 2.7 pg/ml | pg/ml (`pg/mL`) | N (normal) | 2 pg/ml – 4.4 pg/ml | SE01 (Serum) | 2026-08-11T15:30:00+02:00 | final | Chemistry studies (set) |
| 4 | Thyreoperoxidase-Antikoerper | `LOINC#8099-4`, `lokal#TPOAK` | 245 U/ml | U/ml (`U/mL`) | HH (kritisch erhoeht) | – 34 U/ml | SE01 (Serum) | 2026-08-11T15:30:00+02:00 | final | Serology studies (set) |

### Details zu einzelnen Ergebnissen

**1. Thyreoidea-stimulierendes Hormon basal**

- Identifier: `OBI` BL26-100444-E0001
- Freigegeben: 2026-08-11T15:30:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: TSH erhoeht - fT4 und TPO-AK nachgemessen.

**2. freies Thyroxin**

- Identifier: `OBI` BL26-100444-E0002
- Freigegeben: 2026-08-11T15:30:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**3. freies Trijodthyronin**

- Identifier: `OBI` BL26-100444-E0003
- Freigegeben: 2026-08-11T15:30:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**4. Thyreoperoxidase-Antikoerper**

- Identifier: `OBI` BL26-100444-E0004
- Freigegeben: 2026-08-11T15:30:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Befund vereinbar mit Autoimmunthyreoiditis.

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100444 vom 2026-08-11**

Patient: Anna Schneider; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

5 verknuepfte Ressource(n): DiagnosticReport/74d657f6, Thyreoidea-stimulierendes Hormon basal, freies Thyroxin, freies Trijodthyronin, Thyreoperoxidase-Antikoerper

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Thyreoidea-stimulierendes Hormon basal | 8.6 | mU/l | H | 0.27 - 4.2 |
| freies Thyroxin | 0.8 | ng/dl | L | 0.93 - 1.7 |
| freies Trijodthyronin | 2.7 | pg/ml | N | 2.0 - 4.4 |
| Thyreoperoxidase-Antikoerper | 245 | U/ml | HH | - 34 |

### Diagnosen / Veranlassungsgrund

2 verknuepfte Ressource(n): Hypothyreose, nicht naeher bezeichnet (`ICD-10-GM#E03.9` (v2026)), Struma nodosa (`ICD-10-GM#E04.9` (v2026))

- E03.9 Hypothyreose, nicht naeher bezeichnet
- E04.9 Struma nodosa

### Probenmaterial

2 verknuepfte Ressource(n): Auftrag A2026-0004, L26-100444, SE01 (Serum)

- SE01: Serum (2026-08-10T09:00:00+02:00)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
