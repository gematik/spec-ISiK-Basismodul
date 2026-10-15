# Laborbefund BL26-100512 vom 2026-09-10

Quelle: [`Laborbefund_12_O72_Blutgruppe.bundle.json`](Laborbefund_12_O72_Blutgruppe.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | 08b84dcd-bfd8-5258-8655-33907a66049d |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100512<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-09-10T05:15:00+02:00 |
| Ressourcen | 28 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 3, Specimen 3, ServiceRequest 1, Observation 13, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100512 vom 2026-09-10 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100512<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-09-10T05:15:00+02:00 |
| Patient | Katharina Nowak |
| Kontakt | Kontakt ambulatory 2026-09-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial<br>Hinweise |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0012<br><sub>https://labor-testdaten.example/praxis/398212700/sid/auftragsnummer</sub><br>`FILL` L26-100512<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Anke Bergmann |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Atonische postpartale Blutung, Blutverlust ca. 1800 ml (`ICD-10-GM#O72.1` (v2026))<br>Akute Blutungsanaemie (`ICD-10-GM#D62` (v2026))<br>Lebendgeborener Einling, Spontangeburt 10.09.2026 (`ICD-10-GM#Z37.0` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100512<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0012, L26-100512 |
| Befundzeitpunkt | 2026-09-10T05:15:00+02:00 |
| Freigegeben | 2026-09-10T05:15:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | ED01 (EDTA-Blut (Blutbild))<br>ED02 (EDTA-Blut (Immunhaematologie))<br>CI01 (Citratblut (Gerinnung)) |
| Ergebnisse | 13 Observation(s) |
| Beurteilung | Beurteilung: schwere akute Blutungsanaemie (Hb 6.8 g/dl) mit beginnender Verbrauchskoagulopathie (Fibrinogen 1.4 g/l, INR 1.4) bei atonischer postpartaler Blutung. Transfusion von Erythrozytenkonzentraten indiziert; 4 EK 0 RhD+ kompatibel gekreuzt und bereitgestellt. Empfehlung: Fibrinogensubstitution, Tranexamsaeure, Blutbild- und Gerinnungskontrolle nach Transfusion. |

## Patient

| Element | Inhalt |
|---|---|
| Name | Katharina Nowak (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1012<br><sub>https://labor-testdaten.example/praxis/398212700/sid/patienten-id</sub><br>`KVZ10` N345678913<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | female |
| Geburtsdatum | 1993-04-15 |
| Aktiv | ja |
| Adresse | Heinrichstr. 27, 64283 Darmstadt, DE (both) |

## Beteiligte

| Ressource | Name | Rolle im Befund | Identifier | Kontakt | Adresse | Profil |
|---|---|---|---|---|---|---|
| Practitioner | Dr. Richard Mueller | Autor des Befunds<br>Befunderstellung (performer)<br>Befundfreigabe (resultsInterpreter) | `EN` MUELLE<br><sub>https://labor-testdaten.example/labor/270719100/sid/mitarbeiter</sub> |  |  | ISiKPersonImGesundheitsberuf |
| Practitioner | Dr. med. Anke Bergmann | Einsender (anfordernde Person)<br>behandelnde Person | `LANR` 543210015<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR</sub> |  |  | ISiKPersonImGesundheitsberuf |
| Organization | Labor Mueller | Labor (Auftragsempfaenger)<br>Verwahrer des Befunds (custodian)<br>Autor des Befunds<br>Befunderstellung (performer) | `BSNR` 270719100<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR</sub> | phone: 02211456546 (work) | Ottostr. 2, 50859 Koeln, DE | ISiKOrganisation |
| Organization | Frauenarztpraxis Dr. med. Anke Bergmann | Einsender (Betriebsstaette) | `BSNR` 398212700<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR</sub> | phone: 061512222222 (work) | Klinikweg 3, 64283 Darmstadt, DE | ISiKOrganisation |

## Kontakt (Encounter)

| Element | Inhalt |
|---|---|
| Status | finished |
| Klasse | ambulatory (`v3-ActCode#AMB`) |
| Patient | Katharina Nowak |
| Zeitraum | 2026-09-10 |
| Beteiligte | Dr. med. Anke Bergmann |
| Einrichtung | Frauenarztpraxis Dr. med. Anke Bergmann |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#O72.1` (v2026) | G |  | Atonische postpartale Blutung, Blutverlust ca. 1800 ml | active | confirmed | 2026-09-10 | ISiKDiagnose |
| 2 | `ICD-10-GM#D62` (v2026) | G |  | Akute Blutungsanaemie | active | confirmed | 2026-09-10 | ISiKDiagnose |
| 3 | `ICD-10-GM#Z37.0` (v2026) | G |  | Lebendgeborener Einling, Spontangeburt 10.09.2026 | active | confirmed | 2026-09-10 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| ED01 | EDTA-Blut (Blutbild) (`SNOMED#445295009`) | 2026-09-10T04:05:00+02:00 |  |  |  | available |  |
| ED02 | EDTA-Blut (Immunhaematologie) (`SNOMED#445295009`) | 2026-09-10T04:05:00+02:00 |  |  |  | available |  |
| CI01 | Citratblut (Gerinnung) | 2026-09-10T04:05:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Haemoglobin | `LOINC#718-7`, `lokal#HB` | 6.8 g/dl | g/dl (`g/dL`) | LL (kritisch erniedrigt) | 12 g/dl – 16 g/dl (Alter und Geschlecht) | ED01 (EDTA-Blut (Blutbild)) | 2026-09-10T05:00:00+02:00 | final | Hematology studies (set) |
| 2 | Haematokrit | `LOINC#4544-3`, `lokal#HK` | 21 % | % | LL (kritisch erniedrigt) | 36 % – 46 % (Alter und Geschlecht) | ED01 (EDTA-Blut (Blutbild)) | 2026-09-10T05:00:00+02:00 | final | Hematology studies (set) |
| 3 | Erythrozyten | `LOINC#789-8`, `lokal#ERY` | 2.4 /pl | /pl (`/pL`) | LL (kritisch erniedrigt) | 4 /pl – 5.2 /pl (Alter und Geschlecht) | ED01 (EDTA-Blut (Blutbild)) | 2026-09-10T05:00:00+02:00 | final | Hematology studies (set) |
| 4 | Thrombozyten | `LOINC#777-3`, `lokal#THR` | 118 /nl | /nl (`/nL`) | L (erniedrigt) | 150 /nl – 400 /nl (Alter und Geschlecht) | ED01 (EDTA-Blut (Blutbild)) | 2026-09-10T05:00:00+02:00 | final | Hematology studies (set) |
| 5 | Leukozyten | `LOINC#6690-2`, `lokal#LEU` | 16.2 /nl | /nl (`/nL`) | H (erhoeht) | 4 /nl – 10 /nl (Alter und Geschlecht) | ED01 (EDTA-Blut (Blutbild)) | 2026-09-10T05:00:00+02:00 | final | Hematology studies (set) |
| 6 | Quick | `LOINC#5894-1`, `lokal#QUICK` | 62 % | % | L (erniedrigt) | 70 % – 120 % (Alter und Geschlecht) | CI01 (Citratblut (Gerinnung)) | 2026-09-10T05:00:00+02:00 | final | Coagulation studies (set) |
| 7 | INR | `LOINC#6301-6`, `lokal#INR` | 1.4 1 | 1 | H (erhoeht) | 0.9 1 – 1.2 1 (Alter und Geschlecht) | CI01 (Citratblut (Gerinnung)) | 2026-09-10T05:00:00+02:00 | final | Coagulation studies (set) |
| 8 | aPTT | `LOINC#3173-2`, `lokal#APTT` | 41 s | s | H (erhoeht) | 25 s – 38 s (Alter und Geschlecht) | CI01 (Citratblut (Gerinnung)) | 2026-09-10T05:00:00+02:00 | final | Coagulation studies (set) |
| 9 | Fibrinogen | `LOINC#3255-7`, `lokal#FIB` | 1.4 g/l | g/l (`g/L`) | LL (kritisch erniedrigt) | 2 g/l – 4 g/l (Alter und Geschlecht) | CI01 (Citratblut (Gerinnung)) | 2026-09-10T05:00:00+02:00 | final | Coagulation studies (set) |
| 10 | Blutgruppe (AB0/RhD) | `LOINC#882-1` | 0 RhD+ |  |  |  | ED02 (EDTA-Blut (Immunhaematologie)) | 2026-09-10T05:00:00+02:00 | final | Blood bank studies (set) |
| 11 | Antikoerpersuchtest | `LOINC#890-4` | Not detected (`SNOMED#260415000`) |  | NEG (negativ) |  | ED02 (EDTA-Blut (Immunhaematologie)) | 2026-09-10T05:00:00+02:00 | final | Blood bank studies (set) |
| 12 | Direkter Coombstest | `LOINC#1007-4` | Not detected (`SNOMED#260415000`) |  | NEG (negativ) |  | ED02 (EDTA-Blut (Immunhaematologie)) | 2026-09-10T05:00:00+02:00 | final | Blood bank studies (set) |
| 13 | Kreuzproben | `LOINC#1250-0` | EK 0 RhD+ K- Nr. 276003123456001 kompatibel; EK 0 RhD+ K- Nr. 276003123456002 kompatibel; EK 0 RhD+ K- Nr. 276003123456003 kompatibel; EK 0 RhD+ K- Nr. 276003123456004 kompatibel |  |  |  | ED02 (EDTA-Blut (Immunhaematologie)) | 2026-09-10T05:00:00+02:00 | final | Blood bank studies (set) |

### Details zu einzelnen Ergebnissen

**1. Haemoglobin**

- Identifier: `OBI` BL26-100512-E0001
- Freigegeben: 2026-09-10T05:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: KRITISCHER WERT - telefonisch an Dr. Bergmann 05:05 Uhr.

**2. Haematokrit**

- Identifier: `OBI` BL26-100512-E0002
- Freigegeben: 2026-09-10T05:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**3. Erythrozyten**

- Identifier: `OBI` BL26-100512-E0003
- Freigegeben: 2026-09-10T05:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**4. Thrombozyten**

- Identifier: `OBI` BL26-100512-E0004
- Freigegeben: 2026-09-10T05:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**5. Leukozyten**

- Identifier: `OBI` BL26-100512-E0005
- Freigegeben: 2026-09-10T05:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Leukozytose postpartal / Stressreaktion moeglich.

**6. Quick**

- Identifier: `OBI` BL26-100512-E0006
- Freigegeben: 2026-09-10T05:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**7. INR**

- Identifier: `OBI` BL26-100512-E0007
- Freigegeben: 2026-09-10T05:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**8. aPTT**

- Identifier: `OBI` BL26-100512-E0008
- Freigegeben: 2026-09-10T05:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**9. Fibrinogen**

- Identifier: `OBI` BL26-100512-E0009
- Freigegeben: 2026-09-10T05:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Fibrinogen < 2 g/l bei PPH: Substitution erwaegen.

**10. Blutgruppe (AB0/RhD)**

- Identifier: `OBI` BL26-100512-E0010-ABO
- Freigegeben: 2026-09-10T05:05:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Rhesus-Formel CcD.ee, Kell negativ (K-)
- Hinweis: Kreuzproben gueltig bis 13.09.2026 (72 h ab Entnahme).
- Hinweis: Blutgruppe aus zwei unabhaengigen Proben bestaetigt (Zweitbestimmung ED01).
- Hinweis: Hinweis zu Blutgruppenzugehoerigkeit: Massive postpartale Blutung (Blutverlust ca. 1800 ml). Blutgruppe 0 RhD positiv, Kell negativ; Antikoerpersuchtest negativ. 4 Erythrozytenkonzentrate 0 RhD+ gekreuzt (alle kompatibel) und im Blutdepot zur sofortigen Abholung bereitgestellt. Telefonische Durchgabe an Dr. med. Anke Bergmann (Kreisssaal) am 10.09.2026 um 05:05 Uhr. Bei anhaltender Blutung: weitere EK sowie Plasma/Fibrinogen nach Massivtransfusionsprotokoll ungekreuzt abrufbar.
- Hinweis: Test-ID: BG-AKS-KP

**11. Antikoerpersuchtest**

- Identifier: `OBI` BL26-100512-E0010-AKS
- Freigegeben: 2026-09-10T05:05:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**12. Direkter Coombstest**

- Identifier: `OBI` BL26-100512-E0010-DCT
- Freigegeben: 2026-09-10T05:05:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**13. Kreuzproben**

- Identifier: `OBI` BL26-100512-E0010-KP
- Freigegeben: 2026-09-10T05:05:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Nachweis Hauptantigene/NHP: kein Nachweis

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100512 vom 2026-09-10**

Patient: Katharina Nowak; Einsender: Dr. med. Anke Bergmann; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

14 verknuepfte Ressource(n)

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Haemoglobin | 6.8 | g/dl | LL | 12.0 - 16.0 |
| Haematokrit | 21 | % | LL | 36 - 46 |
| Erythrozyten | 2.4 | /pl | LL | 4.0 - 5.2 |
| Thrombozyten | 118 | /nl | L | 150 - 400 |
| Leukozyten | 16.2 | /nl | H | 4.0 - 10.0 |
| Quick | 62 | % | L | 70 - 120 |
| INR | 1.4 |  | H | 0.9 - 1.2 |
| aPTT | 41 | s | H | 25 - 38 |
| Fibrinogen | 1.4 | g/l | LL | 2.0 - 4.0 |
| Blutgruppe | 0 RhD+ |  |  | Rhesus-Formel CcD.ee, Kell negativ (K-) |
| Antikoerpersuchtest | Not detected |  |  |  |
| Direkter Coombstest | Not detected |  |  |  |
| Kreuzproben | EK 0 RhD+ K- Nr. 276003123456001 kompatibel; EK 0 RhD+ K- Nr. 276003123456002 kompatibel; EK 0 RhD+ K- Nr. 276003123456003 kompatibel; EK 0 RhD+ K- Nr. 276003123456004 kompatibel |  |  |  |

**Beurteilung:** Beurteilung: schwere akute Blutungsanaemie (Hb 6.8 g/dl) mit beginnender Verbrauchskoagulopathie (Fibrinogen 1.4 g/l, INR 1.4) bei atonischer postpartaler Blutung. Transfusion von Erythrozytenkonzentraten indiziert; 4 EK 0 RhD+ kompatibel gekreuzt und bereitgestellt. Empfehlung: Fibrinogensubstitution, Tranexamsaeure, Blutbild- und Gerinnungskontrolle nach Transfusion.

### Diagnosen / Veranlassungsgrund

3 verknuepfte Ressource(n): Atonische postpartale Blutung, Blutverlust ca. 1800 ml (`ICD-10-GM#O72.1` (v2026)), Akute Blutungsanaemie (`ICD-10-GM#D62` (v2026)), Lebendgeborener Einling, Spontangeburt 10.09.2026 (`ICD-10-GM#Z37.0` (v2026))

- O72.1 Atonische postpartale Blutung, Blutverlust ca. 1800 ml
- D62 Akute Blutungsanaemie
- Z37.0 Lebendgeborener Einling, Spontangeburt 10.09.2026

### Probenmaterial

4 verknuepfte Ressource(n): Auftrag A2026-0012, L26-100512, ED01 (EDTA-Blut (Blutbild)), ED02 (EDTA-Blut (Immunhaematologie)), CI01 (Citratblut (Gerinnung))

- ED01: EDTA-Blut (Blutbild) (2026-09-10T04:05:00+02:00)
- ED02: EDTA-Blut (Immunhaematologie) (2026-09-10T04:05:00+02:00)
- CI01: Citratblut (Gerinnung) (2026-09-10T04:05:00+02:00)

### Hinweise

0 verknuepfte Ressource(n)

- Hinweis zu Blutgruppenzugehoerigkeit: Massive postpartale Blutung (Blutverlust ca. 1800 ml). Blutgruppe 0 RhD positiv, Kell negativ; Antikoerpersuchtest negativ. 4 Erythrozytenkonzentrate 0 RhD+ gekreuzt (alle kompatibel) und im Blutdepot zur sofortigen Abholung bereitgestellt. Telefonische Durchgabe an Dr. med. Anke Bergmann (Kreisssaal) am 10.09.2026 um 05:05 Uhr. Bei anhaltender Blutung: weitere EK sowie Plasma/Fibrinogen nach Massivtransfusionsprotokoll ungekreuzt abrufbar.

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
