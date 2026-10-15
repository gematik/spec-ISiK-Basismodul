# Laborbefund BL26-100447 vom 2026-08-11

Quelle: [`Laborbefund_07_N18.bundle.json`](Laborbefund_07_N18.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | 04bad194-817a-57f6-ba44-5a458449ddc7 |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100447<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-11T16:15:00+02:00 |
| Ressourcen | 18 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 1, Specimen 2, ServiceRequest 1, Observation 6, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100447 vom 2026-08-11 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100447<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-11T16:15:00+02:00 |
| Patient | Heinz Wagner |
| Kontakt | Kontakt ambulatory 2026-08-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0007<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100447<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Chronische Nierenkrankheit, Stadium 3 (`ICD-10-GM#N18.3` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100447<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0007, L26-100447 |
| Befundzeitpunkt | 2026-08-11T16:15:00+02:00 |
| Freigegeben | 2026-08-11T16:15:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | SE01 (Serum)<br>UR01 (Spontanurin) |
| Ergebnisse | 6 Observation(s) |

## Patient

| Element | Inhalt |
|---|---|
| Name | Heinz Wagner (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1007<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` W789012346<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | male |
| Geburtsdatum | 1949-01-27 |
| Aktiv | ja |
| Adresse | Dorfaue 12, 12555 Berlin, DE (both) |

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
| Patient | Heinz Wagner |
| Zeitraum | 2026-08-10 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#N18.3` (v2026) | G |  | Chronische Nierenkrankheit, Stadium 3 | active | confirmed | 2026-08-11 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-10T09:45:00+02:00 |  |  |  | available |  |
| UR01 | Spontanurin (`SNOMED#122575003`) | 2026-08-10T09:45:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Kreatinin enzymatisch | `LOINC#2160-0`, `lokal#KREA` | 1.9 mg/dl | mg/dl (`mg/dL`) | HH (kritisch erhoeht) | 0.7 mg/dl – 1.2 mg/dl | SE01 (Serum) | 2026-08-11T16:15:00+02:00 | final | Chemistry studies (set) |
| 2 | eGFR nach CKD-EPI | `LOINC#62238-1`, `lokal#EGFR` | 38 mL/min/{1.73_m2} | mL/min/{1.73_m2} | LL (kritisch erniedrigt) | 90 mL/min/{1.73_m2} – (Alter und Geschlecht) | SE01 (Serum) | 2026-08-11T16:15:00+02:00 | final | Chemistry studies (set) |
| 3 | Harnstoff | `LOINC#3091-6`, `lokal#HST` | 68 mg/dl | mg/dl (`mg/dL`) | H (erhoeht) | 17 mg/dl – 48 mg/dl | SE01 (Serum) | 2026-08-11T16:15:00+02:00 | final | Chemistry studies (set) |
| 4 | Kalium | `LOINC#2823-3`, `lokal#K` | 5.4 mmol/l | mmol/l (`mmol/L`) | H (erhoeht) | 3.5 mmol/l – 5.1 mmol/l | SE01 (Serum) | 2026-08-11T16:15:00+02:00 | final | Chemistry studies (set) |
| 5 | Phosphat anorganisch | `LOINC#2777-1`, `lokal#PHOS` | 4.9 mg/dl | mg/dl (`mg/dL`) | H (erhoeht) | 2.5 mg/dl – 4.5 mg/dl | SE01 (Serum) | 2026-08-11T16:15:00+02:00 | final | Chemistry studies (set) |
| 6 | Albumin/Kreatinin-Ratio im Urin | `LOINC#9318-7`, `lokal#ACR` | 320 mg/g | mg/g | HH (kritisch erhoeht) | – 30 mg/g | UR01 (Spontanurin) | 2026-08-11T16:15:00+02:00 | final | Urinalysis studies (set) |

### Details zu einzelnen Ergebnissen

**1. Kreatinin enzymatisch**

- Identifier: `OBI` BL26-100447-E0001
- Freigegeben: 2026-08-11T16:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**2. eGFR nach CKD-EPI**

- Identifier: `OBI` BL26-100447-E0002
- Freigegeben: 2026-08-11T16:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: CKD-Stadium G3b. Nephrologische Mitbetreuung erwaegen.

**3. Harnstoff**

- Identifier: `OBI` BL26-100447-E0003
- Freigegeben: 2026-08-11T16:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**4. Kalium**

- Identifier: `OBI` BL26-100447-E0004
- Freigegeben: 2026-08-11T16:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**5. Phosphat anorganisch**

- Identifier: `OBI` BL26-100447-E0005
- Freigegeben: 2026-08-11T16:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**6. Albumin/Kreatinin-Ratio im Urin**

- Identifier: `OBI` BL26-100447-E0006
- Freigegeben: 2026-08-11T16:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100447 vom 2026-08-11**

Patient: Heinz Wagner; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

7 verknuepfte Ressource(n): DiagnosticReport/0d961e26, Kreatinin enzymatisch, eGFR nach CKD-EPI, Harnstoff, Kalium, Phosphat anorganisch, Albumin/Kreatinin-Ratio im Urin

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Kreatinin enzymatisch | 1.9 | mg/dl | HH | 0.7 - 1.2 |
| eGFR nach CKD-EPI | 38 | ml/min/1.73qm | LL | 90 - |
| Harnstoff | 68 | mg/dl | H | 17 - 48 |
| Kalium | 5.4 | mmol/l | H | 3.5 - 5.1 |
| Phosphat anorganisch | 4.9 | mg/dl | H | 2.5 - 4.5 |
| Albumin/Kreatinin-Ratio im Urin | 320 | mg/g | HH | - 30 |

### Diagnosen / Veranlassungsgrund

1 verknuepfte Ressource(n): Chronische Nierenkrankheit, Stadium 3 (`ICD-10-GM#N18.3` (v2026))

- N18.3 Chronische Nierenkrankheit, Stadium 3

### Probenmaterial

3 verknuepfte Ressource(n): Auftrag A2026-0007, L26-100447, SE01 (Serum), UR01 (Spontanurin)

- SE01: Serum (2026-08-10T09:45:00+02:00)
- UR01: Spontanurin (2026-08-10T09:45:00+02:00)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
