# Laborbefund BL26-100449 vom 2026-08-11

Quelle: [`Laborbefund_09_M10.bundle.json`](Laborbefund_09_M10.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | 73a34edc-c134-51f1-8b1c-2f4fffb1539e |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100449<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-11T16:45:00+02:00 |
| Ressourcen | 14 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 1, Specimen 1, ServiceRequest 1, Observation 3, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100449 vom 2026-08-11 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100449<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-11T16:45:00+02:00 |
| Patient | Murat Oezdemir |
| Kontakt | Kontakt ambulatory 2026-08-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0009<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100449<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Gicht, nicht naeher bezeichnet (`ICD-10-GM#M10.99` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100449<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0009, L26-100449 |
| Befundzeitpunkt | 2026-08-11T16:45:00+02:00 |
| Freigegeben | 2026-08-11T16:45:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | SE01 (Serum) |
| Ergebnisse | 3 Observation(s) |

## Patient

| Element | Inhalt |
|---|---|
| Name | Murat Oezdemir (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1009<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` O901234568<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | male |
| Geburtsdatum | 1962-12-01 |
| Aktiv | ja |
| Adresse | Bergstr. 31, 10115 Berlin, DE (both) |

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
| Patient | Murat Oezdemir |
| Zeitraum | 2026-08-10 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#M10.99` (v2026) | V |  | Gicht, nicht naeher bezeichnet | active | provisional | 2026-08-11 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-10T10:15:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Harnsaeure | `LOINC#3084-1`, `lokal#HRNS` | 9.4 mg/dl | mg/dl (`mg/dL`) | HH (kritisch erhoeht) | 3.4 mg/dl – 7 mg/dl | SE01 (Serum) | 2026-08-11T16:45:00+02:00 | final | Chemistry studies (set) |
| 2 | C-reaktives Protein | `LOINC#1988-5`, `lokal#CRP` | 28 mg/l | mg/l (`mg/L`) | HH (kritisch erhoeht) | – 5 mg/l | SE01 (Serum) | 2026-08-11T16:45:00+02:00 | final | Chemistry studies (set) |
| 3 | Kreatinin enzymatisch | `LOINC#2160-0`, `lokal#KREA` | 1.1 mg/dl | mg/dl (`mg/dL`) | N (normal) | 0.7 mg/dl – 1.2 mg/dl | SE01 (Serum) | 2026-08-11T16:45:00+02:00 | final | Chemistry studies (set) |

### Details zu einzelnen Ergebnissen

**1. Harnsaeure**

- Identifier: `OBI` BL26-100449-E0001
- Freigegeben: 2026-08-11T16:45:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Hyperurikaemie. Bei akuter Arthritis klinische Korrelation.

**2. C-reaktives Protein**

- Identifier: `OBI` BL26-100449-E0002
- Freigegeben: 2026-08-11T16:45:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**3. Kreatinin enzymatisch**

- Identifier: `OBI` BL26-100449-E0003
- Freigegeben: 2026-08-11T16:45:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100449 vom 2026-08-11**

Patient: Murat Oezdemir; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

4 verknuepfte Ressource(n): DiagnosticReport/469f4187, Harnsaeure, C-reaktives Protein, Kreatinin enzymatisch

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Harnsaeure | 9.4 | mg/dl | HH | 3.4 - 7.0 |
| C-reaktives Protein | 28 | mg/l | HH | - 5 |
| Kreatinin enzymatisch | 1.1 | mg/dl | N | 0.7 - 1.2 |

### Diagnosen / Veranlassungsgrund

1 verknuepfte Ressource(n): Gicht, nicht naeher bezeichnet (`ICD-10-GM#M10.99` (v2026))

- M10.99 Gicht, nicht naeher bezeichnet

### Probenmaterial

2 verknuepfte Ressource(n): Auftrag A2026-0009, L26-100449, SE01 (Serum)

- SE01: Serum (2026-08-10T10:15:00+02:00)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
