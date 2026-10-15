# Laborbefund BL26-100451 vom 2026-08-13

Quelle: [`Laborbefund_11_C58.bundle.json`](Laborbefund_11_C58.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | 26d5e16c-b012-571f-856e-da2a9a1bc291 |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100451<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-13T14:15:00+02:00 |
| Ressourcen | 17 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 2, Specimen 2, ServiceRequest 1, Observation 4, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100451 vom 2026-08-13 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100451<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-13T14:15:00+02:00 |
| Patient | Julia Weber |
| Kontakt | Kontakt ambulatory 2026-08-12 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial<br>Hinweise<br>Weitere Angaben |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0011<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100451<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | V.a. Chorionkarzinom bei exzessiv erhoehtem Beta-hCG (`ICD-10-GM#C58` (v2026))<br>Ueberwachung einer Schwangerschaft, 31+2 SSW (`ICD-10-GM#Z34` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100451<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0011, L26-100451 |
| Befundzeitpunkt | 2026-08-13T14:15:00+02:00 |
| Freigegeben | 2026-08-13T14:15:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | SE01 (Serum)<br>ED01 (EDTA-Blut) |
| Ergebnisse | 3 Observation(s) |

## Patient

| Element | Inhalt |
|---|---|
| Name | Julia Weber (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1011<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` W678901234<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | female |
| Geburtsdatum | 1994-03-16 |
| Aktiv | ja |
| Adresse | Kastanienallee 8, 10435 Berlin, DE (both) |

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
| Patient | Julia Weber |
| Zeitraum | 2026-08-12 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#C58` (v2026) | V |  | V.a. Chorionkarzinom bei exzessiv erhoehtem Beta-hCG | active | provisional | 2026-08-13 | ISiKDiagnose |
| 2 | `ICD-10-GM#Z34` (v2026) | G |  | Ueberwachung einer Schwangerschaft, 31+2 SSW | active | confirmed | 2026-08-13 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-12T09:15:00+02:00 |  |  |  | available |  |
| ED01 | EDTA-Blut (`SNOMED#445295009`) | 2026-08-12T09:15:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Beta-hCG quantitativ (Serum) | `LOINC#19080-1`, `lokal#BHCG` | 1250000 U/l | U/l (`U/L`) | HH (kritisch erhoeht) | – 5 U/l | SE01 (Serum) | 2026-08-13T14:15:00+02:00 | final | Chemistry studies (set) |
| 2 | Haemoglobin | `LOINC#718-7`, `lokal#HB` | 9.8 g/dl | g/dl (`g/dL`) | L (erniedrigt) | 11.2 g/dl – 15.7 g/dl | ED01 (EDTA-Blut) | 2026-08-13T14:15:00+02:00 | final | Hematology studies (set) |
| 3 | TSH basal | `LOINC#3016-3`, `lokal#TSH` | 0.02 mU/l | mU/l (`mU/L`) | LL (kritisch erniedrigt) | 0.27 mU/l – 4.2 mU/l | SE01 (Serum) | 2026-08-13T14:15:00+02:00 | final | Chemistry studies (set) |

### Details zu einzelnen Ergebnissen

**1. Beta-hCG quantitativ (Serum)**

- Identifier: `OBI` BL26-100451-E0001
- Freigegeben: 2026-08-13T14:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Weit ueber gestationsaltersgerechtem Bereich - V.a. Blasenmole/Chorionkarzinom, Gynaeko-Onkologie informiert.

**2. Haemoglobin**

- Identifier: `OBI` BL26-100451-E0002
- Freigegeben: 2026-08-13T14:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**3. TSH basal**

- Identifier: `OBI` BL26-100451-E0003
- Freigegeben: 2026-08-13T14:15:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: hCG-vermittelte Hyperthyreose moeglich.

## Weitere Beobachtungen

| Beobachtung | Code | Wert | Bewertung | Zeitpunkt | Status | Profil |
|---|---|---|---|---|---|---|
| Pregnancy status | `LOINC#82810-3` | Pregnant (`LOINC#LA15173-0`) |  | 2026-08-13 | final | ISiKSchwangerschaftsstatus |

**Pregnancy status**

- Hinweis: Schwangerschaftsdauer in Tagen: 312
- Hinweis: Erster Tag der letzten Periode: 2026-11-23

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100451 vom 2026-08-13**

Patient: Julia Weber; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

4 verknuepfte Ressource(n): DiagnosticReport/a543aeb0, Beta-hCG quantitativ (Serum), Haemoglobin, TSH basal

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Beta-hCG quantitativ (Serum) | 1250000 | U/l | HH | - 5 |
| Haemoglobin | 9.8 | g/dl | L | 11.2 - 15.7 |
| TSH basal | 0.02 | mU/l | LL | 0.27 - 4.2 |

### Diagnosen / Veranlassungsgrund

2 verknuepfte Ressource(n): V.a. Chorionkarzinom bei exzessiv erhoehtem Beta-hCG (`ICD-10-GM#C58` (v2026)), Ueberwachung einer Schwangerschaft, 31+2 SSW (`ICD-10-GM#Z34` (v2026))

- C58 V.a. Chorionkarzinom bei exzessiv erhoehtem Beta-hCG
- Z34 Ueberwachung einer Schwangerschaft, 31+2 SSW

### Probenmaterial

3 verknuepfte Ressource(n): Auftrag A2026-0011, L26-100451, SE01 (Serum), ED01 (EDTA-Blut)

- SE01: Serum (2026-08-12T09:15:00+02:00)
- ED01: EDTA-Blut (2026-08-12T09:15:00+02:00)

### Hinweise

0 verknuepfte Ressource(n)

- Tumor: Probe: SE01; Befund: V.a. Chorionkarzinom (Blasenmole nicht ausgeschlossen); Diagnosejahr: 2026; Lokalisation: Uterus. Staging ausstehend, Tumorboard Gynaeko-Onkologie angemeldet.

### Weitere Angaben

1 verknuepfte Ressource(n): Pregnancy status

- Schwangerschaftsstatus: schwanger

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
