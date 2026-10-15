# Laborbefund BL2026-081234 vom 2026-08-12

Quelle: [`Laborbefund_S01E03_OccamsRazor.bundle.json`](Laborbefund_S01E03_OccamsRazor.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | c57fe23c-1ed3-5689-b5a5-785ace1abdbf |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL2026-081234<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-12T16:20:00+02:00 |
| Ressourcen | 27 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 2, Specimen 3, ServiceRequest 1, Observation 13, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL2026-081234 vom 2026-08-12 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL2026-081234<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-12T16:20:00+02:00 |
| Patient | Brandon Merrell |
| Kontakt | Kontakt ambulatory 2026-08-12 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` HOUSE-S01E03-0001<br><sub>https://labor-testdaten.example/praxis/781234567/sid/auftragsnummer</sub><br>`FILL` L2026-081234<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. Gregory House |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Fieber, Exanthem, Hypotonie, Uebelkeit, Bauchschmerz (`ICD-10-GM#R50.9` (v2026))<br>Akutes Nierenversagen, V.a. Toxin-Ursache (`ICD-10-GM#N17.9` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL2026-081234<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag HOUSE-S01E03-0001, L2026-081234 |
| Befundzeitpunkt | 2026-08-12T16:20:00+02:00 |
| Freigegeben | 2026-08-12T16:20:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | ED01 (EDTA-Blut)<br>SE01 (Serum)<br>UR01 (Urin) |
| Ergebnisse | 13 Observation(s) |
| Beurteilung | Beurteilung: Panzytopenie mit fehlender Retikulozytose, akutes Nierenversagen, Hyperkaliaemie und Transaminasenanstieg. Die Konstellation ist durch EINE Ursache erklaerbar: Colchicin-Intoxikation. Cave: Medikamentenverwechslung in der Apotheke (Hustenpraeparat gegen Colchicin vertauscht). Ockham's Razor bestaetigt. |

## Patient

| Element | Inhalt |
|---|---|
| Name | Brandon Merrell (official) |
| Profil | ISiKPatient |
| Identifier | `MR` PPTH-0001<br><sub>https://labor-testdaten.example/praxis/781234567/sid/patienten-id</sub> |
| Geschlecht | male |
| Geburtsdatum | 2004-05-12 |
| Aktiv | ja |
| Adresse | Baker Street 3, 08540 Princeton, USA (both) |

## Beteiligte

| Ressource | Name | Rolle im Befund | Identifier | Kontakt | Adresse | Profil |
|---|---|---|---|---|---|---|
| Practitioner | Dr. Richard Mueller | Autor des Befunds<br>Befunderstellung (performer)<br>Befundfreigabe (resultsInterpreter) | `EN` MUELLE<br><sub>https://labor-testdaten.example/labor/270719100/sid/mitarbeiter</sub> |  |  | ISiKPersonImGesundheitsberuf |
| Practitioner | Dr. Gregory House | Einsender (anfordernde Person)<br>behandelnde Person | `LANR` 999999900<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR</sub> |  |  | ISiKPersonImGesundheitsberuf |
| Organization | Labor Mueller | Labor (Auftragsempfaenger)<br>Verwahrer des Befunds (custodian)<br>Autor des Befunds<br>Befunderstellung (performer) | `BSNR` 270719100<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR</sub> | phone: 02211456546 (work) | Ottostr. 2, 50859 Koeln, DE | ISiKOrganisation |
| Organization | Princeton-Plainsboro Teaching Hospital | Einsender (Betriebsstaette) | `BSNR` 781234567<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR</sub> | phone: 016093334444 (work) | Plainsboro Road 1, 08540 Princeton, DE | ISiKOrganisation |

## Kontakt (Encounter)

| Element | Inhalt |
|---|---|
| Status | finished |
| Klasse | ambulatory (`v3-ActCode#AMB`) |
| Patient | Brandon Merrell |
| Zeitraum | 2026-08-12 |
| Beteiligte | Dr. Gregory House |
| Einrichtung | Princeton-Plainsboro Teaching Hospital |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#R50.9` (v2026) | G |  | Fieber, Exanthem, Hypotonie, Uebelkeit, Bauchschmerz | active | confirmed | 2026-08-12 | ISiKDiagnose |
| 2 | `ICD-10-GM#N17.9` (v2026) | V |  | Akutes Nierenversagen, V.a. Toxin-Ursache | active | provisional | 2026-08-12 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| ED01 | EDTA-Blut (`SNOMED#445295009`) | 2026-08-12T08:15:00+02:00 |  |  |  | available |  |
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-12T08:15:00+02:00 |  |  |  | available |  |
| UR01 | Urin (`SNOMED#122575003`) | 2026-08-12T08:15:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Grosses Blutbild inkl. Differenzialblutbild | `LOINC#57021-8`, `lokal#GBB` | 1.9 /nl | /nl (`/nL`) | LL (kritisch erniedrigt) | (4.0 - 10.0) | ED01 (EDTA-Blut) | 2026-08-12T16:20:00+02:00 | final | Hematology studies (set) |
| 2 | Thrombozyten | `LOINC#777-3`, `lokal#THR` | 48 /nl | /nl (`/nL`) | LL (kritisch erniedrigt) | (150 - 400) | ED01 (EDTA-Blut) | 2026-08-12T16:20:00+02:00 | final | Hematology studies (set) |
| 3 | Haemoglobin | `LOINC#718-7`, `lokal#HB` | 10.8 g/dl | g/dl (`g/dL`) | L (erniedrigt) | (13.5 - 17.5) | ED01 (EDTA-Blut) | 2026-08-12T16:20:00+02:00 | final | Hematology studies (set) |
| 4 | Retikulozyten | `LOINC#17849-1`, `lokal#RETI` | 0.2 % | % | LL (kritisch erniedrigt) | (0.5 - 2.0) | ED01 (EDTA-Blut) | 2026-08-12T16:20:00+02:00 | final | Hematology studies (set) |
| 5 | Kreatinin (Serum) | `LOINC#2160-0`, `lokal#KREA` | 3.6 mg/dl | mg/dl (`mg/dL`) | HH (kritisch erhoeht) | (0.7 - 1.2) | SE01 (Serum) | 2026-08-12T16:20:00+02:00 | final | Chemistry studies (set) |
| 6 | Harnstoff (Serum) | `LOINC#3091-6`, `lokal#HST` | 98 mg/dl | mg/dl (`mg/dL`) | H (erhoeht) | (17 - 43) | SE01 (Serum) | 2026-08-12T16:20:00+02:00 | final | Chemistry studies (set) |
| 7 | eGFR (CKD-EPI) | `LOINC#62238-1`, `lokal#GFR` | 22 mL/min/{1.73_m2} | mL/min/{1.73_m2} | LL (kritisch erniedrigt) | (> 90) | SE01 (Serum) | 2026-08-12T16:20:00+02:00 | final | Chemistry studies (set) |
| 8 | Natrium | `LOINC#2951-2`, `lokal#NA` | 131 mmol/l | mmol/l (`mmol/L`) | L (erniedrigt) | (136 - 145) | SE01 (Serum) | 2026-08-12T16:20:00+02:00 | final | Chemistry studies (set) |
| 9 | Kalium | `LOINC#2823-3`, `lokal#K` | 5.6 mmol/l | mmol/l (`mmol/L`) | H (erhoeht) | (3.5 - 5.1) | SE01 (Serum) | 2026-08-12T16:20:00+02:00 | final | Chemistry studies (set) |
| 10 | GPT (ALT) | `LOINC#1742-6`, `lokal#GPT` | 96 U/l | U/l (`U/L`) | H (erhoeht) | (< 41) | SE01 (Serum) | 2026-08-12T16:20:00+02:00 | final | Chemistry studies (set) |
| 11 | Creatinkinase gesamt | `LOINC#2157-6`, `lokal#CK` | 850 U/l | U/l (`U/L`) | H (erhoeht) | (< 190) | SE01 (Serum) | 2026-08-12T16:20:00+02:00 | final | Chemistry studies (set) |
| 12 | Toxikologisches Screening (Serum/Urin) | `LOINC#20785-2`, `lokal#TOXS` | POSITIV: Colchicin |  | A (auffaellig) | (negativ) | UR01 (Urin) | 2026-08-12T16:20:00+02:00 | final | Toxicology studies (set) |
| 13 | Colchicin quantitativ (Serum) | `LOINC#12397-6`, `lokal#COLC` | 5.2 ng/ml | ng/ml (`ng/mL`) | HH (kritisch erhoeht) | (therap. < 3.0; toxisch > 3.0) | SE01 (Serum) | 2026-08-12T16:20:00+02:00 | final | Therapeutic drug monitoring studies (set) |

### Details zu einzelnen Ergebnissen

**1. Grosses Blutbild inkl. Differenzialblutbild**

- Identifier: `OBI` BL2026-081234-E0001
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Ausgepraegte Leukopenie

**2. Thrombozyten**

- Identifier: `OBI` BL2026-081234-E0002
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Schwere Thrombozytopenie

**3. Haemoglobin**

- Identifier: `OBI` BL2026-081234-E0003
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**4. Retikulozyten**

- Identifier: `OBI` BL2026-081234-E0004
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Fehlende Regeneration - Knochenmarksuppression

**5. Kreatinin (Serum)**

- Identifier: `OBI` BL2026-081234-E0005
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Akutes Nierenversagen

**6. Harnstoff (Serum)**

- Identifier: `OBI` BL2026-081234-E0006
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**7. eGFR (CKD-EPI)**

- Identifier: `OBI` BL2026-081234-E0007
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**8. Natrium**

- Identifier: `OBI` BL2026-081234-E0008
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**9. Kalium**

- Identifier: `OBI` BL2026-081234-E0009
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**10. GPT (ALT)**

- Identifier: `OBI` BL2026-081234-E0010
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**11. Creatinkinase gesamt**

- Identifier: `OBI` BL2026-081234-E0011
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Vereinbar mit beginnender toxischer Myopathie

**12. Toxikologisches Screening (Serum/Urin)**

- Identifier: `OBI` BL2026-081234-E0012
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**13. Colchicin quantitativ (Serum)**

- Identifier: `OBI` BL2026-081234-E0013
- Freigegeben: 2026-08-12T16:20:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Toxischer Colchicin-Spiegel

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL2026-081234 vom 2026-08-12**

Patient: Brandon Merrell; Einsender: Dr. Gregory House; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

14 verknuepfte Ressource(n)

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Grosses Blutbild inkl. Differenzialblutbild | 1.9 | /nl | LL | 4.0 - 10.0 |
| Thrombozyten | 48 | /nl | LL | 150 - 400 |
| Haemoglobin | 10.8 | g/dl | L | 13.5 - 17.5 |
| Retikulozyten | 0.2 | % | LL | 0.5 - 2.0 |
| Kreatinin (Serum) | 3.6 | mg/dl | HH | 0.7 - 1.2 |
| Harnstoff (Serum) | 98 | mg/dl | H | 17 - 43 |
| eGFR (CKD-EPI) | 22 | ml/min/1.73qm | LL | > 90 |
| Natrium | 131 | mmol/l | L | 136 - 145 |
| Kalium | 5.6 | mmol/l | H | 3.5 - 5.1 |
| GPT (ALT) | 96 | U/l | H | < 41 |
| Creatinkinase gesamt | 850 | U/l | H | < 190 |
| Toxikologisches Screening (Serum/Urin) | POSITIV: Colchicin |  | A | negativ |
| Colchicin quantitativ (Serum) | 5.2 | ng/ml | HH | therap. < 3.0; toxisch > 3.0 |

**Beurteilung:** Beurteilung: Panzytopenie mit fehlender Retikulozytose, akutes Nierenversagen, Hyperkaliaemie und Transaminasenanstieg. Die Konstellation ist durch EINE Ursache erklaerbar: Colchicin-Intoxikation. Cave: Medikamentenverwechslung in der Apotheke (Hustenpraeparat gegen Colchicin vertauscht). Ockham's Razor bestaetigt.

### Diagnosen / Veranlassungsgrund

2 verknuepfte Ressource(n): Fieber, Exanthem, Hypotonie, Uebelkeit, Bauchschmerz (`ICD-10-GM#R50.9` (v2026)), Akutes Nierenversagen, V.a. Toxin-Ursache (`ICD-10-GM#N17.9` (v2026))

- R50.9 Fieber, Exanthem, Hypotonie, Uebelkeit, Bauchschmerz
- N17.9 Akutes Nierenversagen, V.a. Toxin-Ursache

### Probenmaterial

4 verknuepfte Ressource(n): Auftrag HOUSE-S01E03-0001, L2026-081234, ED01 (EDTA-Blut), SE01 (Serum), UR01 (Urin)

- ED01: EDTA-Blut (2026-08-12T08:15:00+02:00)
- SE01: Serum (2026-08-12T08:15:00+02:00)
- UR01: Urin (2026-08-12T08:15:00+02:00)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
