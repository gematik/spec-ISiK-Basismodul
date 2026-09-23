# Laborbefund BL26-100442 vom 2026-08-11

Quelle: [`Laborbefund_02_E11.bundle.json`](Laborbefund_02_E11.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | edf77708-e646-5600-b8b4-f8e19cb8e18f |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100442<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-11T15:00:00+02:00 |
| Ressourcen | 18 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 1, Specimen 3, ServiceRequest 1, Observation 5, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100442 vom 2026-08-11 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100442<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-11T15:00:00+02:00 |
| Patient | Fatma Yilmaz |
| Kontakt | Kontakt ambulatory 2026-08-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0002<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100442<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Diabetes mellitus Typ 2 (`ICD-10-GM#E11.90` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100442<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0002, L26-100442 |
| Befundzeitpunkt | 2026-08-11T15:00:00+02:00 |
| Freigegeben | 2026-08-11T15:00:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | ED01 (EDTA-Blut)<br>SE01 (Serum)<br>UR01 (Urin) |
| Ergebnisse | 5 Observation(s) |

## Patient

| Element | Inhalt |
|---|---|
| Name | Fatma Yilmaz (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1002<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` Y234567891<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | female |
| Geburtsdatum | 1965-09-03 |
| Aktiv | ja |
| Adresse | Lindenstr. 17, 10245 Berlin, DE (both) |

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
| Patient | Fatma Yilmaz |
| Zeitraum | 2026-08-10 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#E11.90` (v2026) | G |  | Diabetes mellitus Typ 2 | active | confirmed | 2026-08-11 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| ED01 | EDTA-Blut (`SNOMED#445295009`) | 2026-08-10T08:30:00+02:00 |  |  |  | available |  |
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-10T08:30:00+02:00 |  |  |  | available |  |
| UR01 | Urin (`SNOMED#122575003`) | 2026-08-10T08:30:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Haemoglobin A1c (IFCC/NGSP) | `LOINC#4548-4`, `lokal#HBA1C` | 7.8 % | % | H (erhoeht) | 4 % – 6 % | ED01 (EDTA-Blut) | 2026-08-11T15:00:00+02:00 | final | Chemistry studies (set) |
| 2 | Glukose nuechtern | `LOINC#1558-6`, `lokal#GLU` | 148 mg/dl | mg/dl (`mg/dL`) | H (erhoeht) | 70 mg/dl – 100 mg/dl | SE01 (Serum) | 2026-08-11T15:00:00+02:00 | final | Chemistry studies (set) |
| 3 | Kreatinin enzymatisch | `LOINC#2160-0`, `lokal#KREA` | 0.9 mg/dl | mg/dl (`mg/dL`) | N (normal) | 0.5 mg/dl – 0.9 mg/dl | SE01 (Serum) | 2026-08-11T15:00:00+02:00 | final | Chemistry studies (set) |
| 4 | Albumin/Kreatinin-Ratio im Urin | `LOINC#9318-7`, `lokal#MALB` | 45 mg/g | mg/g | H (erhoeht) | – 30 mg/g | UR01 (Urin) | 2026-08-11T15:00:00+02:00 | final | Urinalysis studies (set) |
| 5 | LDL-Cholesterin direkt | `LOINC#18262-6`, `lokal#LDL` | 128 mg/dl | mg/dl (`mg/dL`) | H (erhoeht) | – 100 mg/dl | SE01 (Serum) | 2026-08-11T15:00:00+02:00 | final | Chemistry studies (set) |

### Details zu einzelnen Ergebnissen

**1. Haemoglobin A1c (IFCC/NGSP)**

- Identifier: `OBI` BL26-100442-E0001
- Freigegeben: 2026-08-11T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: HbA1c oberhalb des individuellen Zielkorridors.

**2. Glukose nuechtern**

- Identifier: `OBI` BL26-100442-E0002
- Freigegeben: 2026-08-11T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**3. Kreatinin enzymatisch**

- Identifier: `OBI` BL26-100442-E0003
- Freigegeben: 2026-08-11T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**4. Albumin/Kreatinin-Ratio im Urin**

- Identifier: `OBI` BL26-100442-E0004
- Freigegeben: 2026-08-11T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Mikroalbuminurie, Verlaufskontrolle empfohlen.

**5. LDL-Cholesterin direkt**

- Identifier: `OBI` BL26-100442-E0005
- Freigegeben: 2026-08-11T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100442 vom 2026-08-11**

Patient: Fatma Yilmaz; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

6 verknuepfte Ressource(n): DiagnosticReport/ab732ba4, Haemoglobin A1c (IFCC/NGSP), Glukose nuechtern, Kreatinin enzymatisch, Albumin/Kreatinin-Ratio im Urin, LDL-Cholesterin direkt

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Haemoglobin A1c (IFCC/NGSP) | 7.8 | % | H | 4.0 - 6.0 |
| Glukose nuechtern | 148 | mg/dl | H | 70 - 100 |
| Kreatinin enzymatisch | 0.9 | mg/dl | N | 0.5 - 0.9 |
| Albumin/Kreatinin-Ratio im Urin | 45 | mg/g | H | - 30 |
| LDL-Cholesterin direkt | 128 | mg/dl | H | - 100 |

### Diagnosen / Veranlassungsgrund

1 verknuepfte Ressource(n): Diabetes mellitus Typ 2 (`ICD-10-GM#E11.90` (v2026))

- E11.90 Diabetes mellitus Typ 2

### Probenmaterial

4 verknuepfte Ressource(n): Auftrag A2026-0002, L26-100442, ED01 (EDTA-Blut), SE01 (Serum), UR01 (Urin)

- ED01: EDTA-Blut (2026-08-10T08:30:00+02:00)
- SE01: Serum (2026-08-10T08:30:00+02:00)
- UR01: Urin (2026-08-10T08:30:00+02:00)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
