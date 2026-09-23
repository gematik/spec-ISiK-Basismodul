# Laborbefund BL26-100499 vom 2026-08-13

Quelle: [`Laborbefund_Anhang_Beispiel.bundle.json`](Laborbefund_Anhang_Beispiel.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | d65cb6ea-0002-5c9f-971c-d2d4b07a8888 |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100499<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-13T14:30:00+02:00 |
| Ressourcen | 13 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 1, Specimen 1, ServiceRequest 1, Observation 1, DocumentReference 1, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100499 vom 2026-08-13 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100499<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-13T14:30:00+02:00 |
| Patient | Bernd Beispiel |
| Kontakt | Kontakt ambulatory 2026-08-13 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial<br>Anhaenge |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0099<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100499<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Verlaufskontrolle Entzuendungsparameter (`ICD-10-GM#R70.0` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100499<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0099, L26-100499 |
| Befundzeitpunkt | 2026-08-13T14:30:00+02:00 |
| Freigegeben | 2026-08-13T14:30:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | SE01 (Serum) |
| Ergebnisse | 1 Observation(s) |
| Praesentationsform | application/pdf · eingebettet, 393 Bytes |

## Patient

| Element | Inhalt |
|---|---|
| Name | Bernd Beispiel (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1099<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` B234567895<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | male |
| Geburtsdatum | 1975-02-14 |
| Aktiv | ja |
| Adresse | Anlagenweg 10, 10117 Berlin, DE (both) |

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
| Patient | Bernd Beispiel |
| Zeitraum | 2026-08-13 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#R70.0` (v2026) | G |  | Verlaufskontrolle Entzuendungsparameter | active | confirmed | 2026-08-13 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-13T08:10:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | C-reaktives Protein | `LOINC#1988-5`, `lokal#CRP` | 12 mg/l | mg/l (`mg/L`) | H (erhoeht) | – 5 mg/l | SE01 (Serum) | 2026-08-13T14:30:00+02:00 | final | Chemistry studies (set) |

### Details zu einzelnen Ergebnissen

**1. C-reaktives Protein**

- Identifier: `OBI` BL26-100499-E0001
- Freigegeben: 2026-08-13T14:30:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

## Anhaenge (DocumentReference)

| Beschreibung | Dokumenttyp | Inhalt | Datum | Status |
|---|---|---|---|---|
| Beispielanlage zum Test des Downloads |  | application/pdf · eingebettet, 393 Bytes | 2026-08-13T14:30:00+02:00 | current |

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100499 vom 2026-08-13**

Patient: Bernd Beispiel; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

2 verknuepfte Ressource(n): DiagnosticReport/34a32495, C-reaktives Protein

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| C-reaktives Protein | 12 | mg/l | H | - 5 |

### Diagnosen / Veranlassungsgrund

1 verknuepfte Ressource(n): Verlaufskontrolle Entzuendungsparameter (`ICD-10-GM#R70.0` (v2026))

- R70.0 Verlaufskontrolle Entzuendungsparameter

### Probenmaterial

2 verknuepfte Ressource(n): Auftrag A2026-0099, L26-100499, SE01 (Serum)

- SE01: Serum (2026-08-13T08:10:00+02:00)

### Anhaenge

1 verknuepfte Ressource(n): Beispielanlage zum Test des Downloads

- anh-bi-0 - Beispielanlage zum Test des Downloads

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
