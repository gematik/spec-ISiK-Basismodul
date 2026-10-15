# Laborbefund BL26-100450 vom 2026-08-11

Quelle: [`Laborbefund_10_Z00.bundle.json`](Laborbefund_10_Z00.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | fd70cf51-9848-554c-a84a-f7ed2774f387 |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100450<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-11T17:00:00+02:00 |
| Ressourcen | 18 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 1, Specimen 2, ServiceRequest 1, Observation 6, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100450 vom 2026-08-11 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100450<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-11T17:00:00+02:00 |
| Patient | Sabine Lehmann |
| Kontakt | Kontakt ambulatory 2026-08-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0010<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100450<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Aerztliche Allgemeinuntersuchung (Check-up) (`ICD-10-GM#Z00.0` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100450<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0010, L26-100450 |
| Befundzeitpunkt | 2026-08-11T17:00:00+02:00 |
| Freigegeben | 2026-08-11T17:00:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | SE01 (Serum)<br>UR01 (Urin) |
| Ergebnisse | 6 Observation(s) |

## Patient

| Element | Inhalt |
|---|---|
| Name | Sabine Lehmann (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1010<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` L012345679<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | female |
| Geburtsdatum | 1980-05-05 |
| Aktiv | ja |
| Adresse | Wiesengrund 2, 14169 Berlin, DE (both) |

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
| Patient | Sabine Lehmann |
| Zeitraum | 2026-08-10 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#Z00.0` (v2026) | G |  | Aerztliche Allgemeinuntersuchung (Check-up) | active | confirmed | 2026-08-11 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-10T10:30:00+02:00 |  |  |  | available |  |
| UR01 | Urin (`SNOMED#122575003`) | 2026-08-10T10:30:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Harnstreifentest (Check-up) | `LOINC#24356-8`, `lokal#USTAT` | Eiweiss, Glukose, Erys, Leukos und Nitrit jeweils negativ |  |  |  | UR01 (Urin) | 2026-08-11T17:00:00+02:00 | final | Urinalysis studies (set) |
| 2 | Glukose nuechtern [Masse/Volumen] in Serum | `LOINC#1558-6` | 89 mg/dl | mg/dl (`mg/dL`) | N (normal) | 70 mg/dl – 100 mg/dl | SE01 (Serum) | 2026-08-11T17:00:00+02:00 | final | Chemistry studies (set) |
| 3 | Cholesterin gesamt | `LOINC#2093-3` | 198 mg/dl | mg/dl (`mg/dL`) | N (normal) | – 200 mg/dl | SE01 (Serum) | 2026-08-11T17:00:00+02:00 | final | Chemistry studies (set) |
| 4 | LDL-Cholesterin (berechnet) | `LOINC#13457-7` | 118 mg/dl | mg/dl (`mg/dL`) | H (erhoeht) | – 116 mg/dl | SE01 (Serum) | 2026-08-11T17:00:00+02:00 | final | Chemistry studies (set) |
| 5 | HDL-Cholesterin | `LOINC#2085-9` | 62 mg/dl | mg/dl (`mg/dL`) | N (normal) | 48 mg/dl – | SE01 (Serum) | 2026-08-11T17:00:00+02:00 | final | Chemistry studies (set) |
| 6 | Triglyceride | `LOINC#2571-8` | 104 mg/dl | mg/dl (`mg/dL`) | N (normal) | – 150 mg/dl | SE01 (Serum) | 2026-08-11T17:00:00+02:00 | final | Chemistry studies (set) |

### Details zu einzelnen Ergebnissen

**1. Harnstreifentest (Check-up)**

- Identifier: `OBI` BL26-100450-E0001
- Freigegeben: 2026-08-11T17:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**2. Glukose nuechtern [Masse/Volumen] in Serum**

- Identifier: `OBI` BL26-100450-E0002
- Freigegeben: 2026-08-11T17:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**3. Cholesterin gesamt**

- Identifier: `OBI` BL26-100450-E0003
- Freigegeben: 2026-08-11T17:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**4. LDL-Cholesterin (berechnet)**

- Identifier: `OBI` BL26-100450-E0004
- Freigegeben: 2026-08-11T17:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**5. HDL-Cholesterin**

- Identifier: `OBI` BL26-100450-E0005
- Freigegeben: 2026-08-11T17:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**6. Triglyceride**

- Identifier: `OBI` BL26-100450-E0006
- Freigegeben: 2026-08-11T17:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100450 vom 2026-08-11**

Patient: Sabine Lehmann; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

7 verknuepfte Ressource(n): DiagnosticReport/7edafd09, Harnstreifentest (Check-up), Glukose nuechtern [Masse/Volumen] in Serum, Cholesterin gesamt, LDL-Cholesterin (berechnet), HDL-Cholesterin, Triglyceride

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Harnstreifentest (Check-up) | Eiweiss, Glukose, Erys, Leukos und Nitrit jeweils negativ |  |  |  |
| Glukose nuechtern [Masse/Volumen] in Serum | 89 | mg/dl | N | 70 - 100 |
| Cholesterin gesamt | 198 | mg/dl | N | - 200 |
| LDL-Cholesterin (berechnet) | 118 | mg/dl | H | - 116 |
| HDL-Cholesterin | 62 | mg/dl | N | 48 - |
| Triglyceride | 104 | mg/dl | N | - 150 |

### Diagnosen / Veranlassungsgrund

1 verknuepfte Ressource(n): Aerztliche Allgemeinuntersuchung (Check-up) (`ICD-10-GM#Z00.0` (v2026))

- Z00.0 Aerztliche Allgemeinuntersuchung (Check-up)

### Probenmaterial

3 verknuepfte Ressource(n): Auftrag A2026-0010, L26-100450, SE01 (Serum), UR01 (Urin)

- SE01: Serum (2026-08-10T10:30:00+02:00)
- UR01: Urin (2026-08-10T10:30:00+02:00)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
