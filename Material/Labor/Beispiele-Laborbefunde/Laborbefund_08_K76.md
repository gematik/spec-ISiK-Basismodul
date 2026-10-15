# Laborbefund BL26-100448 vom 2026-08-11

Quelle: [`Laborbefund_08_K76.bundle.json`](Laborbefund_08_K76.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | 83271a99-dbd7-55ee-97df-3e10d0949737 |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100448<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-11T16:30:00+02:00 |
| Ressourcen | 17 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 2, Specimen 1, ServiceRequest 1, Observation 5, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100448 vom 2026-08-11 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100448<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-11T16:30:00+02:00 |
| Patient | Marco Da Silva |
| Kontakt | Kontakt ambulatory 2026-08-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0008<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100448<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Fettleber, anderenorts nicht klassifiziert (`ICD-10-GM#K76.0` (v2026))<br>Erhoehung der Transaminasen (`ICD-10-GM#R74.0` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100448<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0008, L26-100448 |
| Befundzeitpunkt | 2026-08-11T16:30:00+02:00 |
| Freigegeben | 2026-08-11T16:30:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | SE01 (Serum) |
| Ergebnisse | 5 Observation(s) |

## Patient

| Element | Inhalt |
|---|---|
| Name | Marco Da Silva (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1008<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` D890123457<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | male |
| Geburtsdatum | 1977-08-14 |
| Aktiv | ja |
| Adresse | Kastanienweg 7, 12203 Berlin, DE (both) |

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
| Patient | Marco Da Silva |
| Zeitraum | 2026-08-10 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#K76.0` (v2026) | V |  | Fettleber, anderenorts nicht klassifiziert | active | provisional | 2026-08-11 | ISiKDiagnose |
| 2 | `ICD-10-GM#R74.0` (v2026) | G |  | Erhoehung der Transaminasen | active | confirmed | 2026-08-11 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-10T10:00:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | AST (GOT) [Enzymaktivitaet/Volumen] in Serum | `LOINC#1920-8` | 62 U/l | U/l (`U/L`) | H (erhoeht) | – 50 U/l | SE01 (Serum) | 2026-08-11T16:30:00+02:00 | final | Chemistry studies (set) |
| 2 | ALT (GPT) [Enzymaktivitaet/Volumen] in Serum | `LOINC#1742-6` | 98 U/l | U/l (`U/L`) | H (erhoeht) | – 50 U/l | SE01 (Serum) | 2026-08-11T16:30:00+02:00 | final | Chemistry studies (set) |
| 3 | Gamma-GT [Enzymaktivitaet/Volumen] in Serum | `LOINC#2324-2` | 134 U/l | U/l (`U/L`) | HH (kritisch erhoeht) | – 60 U/l | SE01 (Serum) | 2026-08-11T16:30:00+02:00 | final | Chemistry studies (set) |
| 4 | Alkalische Phosphatase in Serum | `LOINC#6768-6` | 102 U/l | U/l (`U/L`) | N (normal) | 40 U/l – 130 U/l (Alter und Geschlecht) | SE01 (Serum) | 2026-08-11T16:30:00+02:00 | final | Chemistry studies (set) |
| 5 | Bilirubin gesamt in Serum | `LOINC#1975-2` | 0.9 mg/dl | mg/dl (`mg/dL`) | N (normal) | – 1.2 mg/dl | SE01 (Serum) | 2026-08-11T16:30:00+02:00 | final | Chemistry studies (set) |

### Details zu einzelnen Ergebnissen

**1. AST (GOT) [Enzymaktivitaet/Volumen] in Serum**

- Identifier: `OBI` BL26-100448-E0001
- Freigegeben: 2026-08-11T16:30:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**2. ALT (GPT) [Enzymaktivitaet/Volumen] in Serum**

- Identifier: `OBI` BL26-100448-E0002
- Freigegeben: 2026-08-11T16:30:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**3. Gamma-GT [Enzymaktivitaet/Volumen] in Serum**

- Identifier: `OBI` BL26-100448-E0003
- Freigegeben: 2026-08-11T16:30:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Konstellation vereinbar mit Steatosis hepatis. Sonographie empfohlen.

**4. Alkalische Phosphatase in Serum**

- Identifier: `OBI` BL26-100448-E0004
- Freigegeben: 2026-08-11T16:30:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**5. Bilirubin gesamt in Serum**

- Identifier: `OBI` BL26-100448-E0005
- Freigegeben: 2026-08-11T16:30:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100448 vom 2026-08-11**

Patient: Marco Da Silva; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

6 verknuepfte Ressource(n): DiagnosticReport/c04191f5, AST (GOT) [Enzymaktivitaet/Volumen] in Serum, ALT (GPT) [Enzymaktivitaet/Volumen] in Serum, Gamma-GT [Enzymaktivitaet/Volumen] in Serum, Alkalische Phosphatase in Serum, Bilirubin gesamt in Serum

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| AST (GOT) [Enzymaktivitaet/Volumen] in Serum | 62 | U/l | H | - 50 |
| ALT (GPT) [Enzymaktivitaet/Volumen] in Serum | 98 | U/l | H | - 50 |
| Gamma-GT [Enzymaktivitaet/Volumen] in Serum | 134 | U/l | HH | - 60 |
| Alkalische Phosphatase in Serum | 102 | U/l | N | 40 - 130 |
| Bilirubin gesamt in Serum | 0.9 | mg/dl | N | - 1.2 |

### Diagnosen / Veranlassungsgrund

2 verknuepfte Ressource(n): Fettleber, anderenorts nicht klassifiziert (`ICD-10-GM#K76.0` (v2026)), Erhoehung der Transaminasen (`ICD-10-GM#R74.0` (v2026))

- K76.0 Fettleber, anderenorts nicht klassifiziert
- R74.0 Erhoehung der Transaminasen

### Probenmaterial

2 verknuepfte Ressource(n): Auftrag A2026-0008, L26-100448, SE01 (Serum)

- SE01: Serum (2026-08-10T10:00:00+02:00)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
