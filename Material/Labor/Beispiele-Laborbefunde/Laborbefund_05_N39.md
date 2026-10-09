# Laborbefund BL26-100445 vom 2026-08-12

Quelle: [`Laborbefund_05_N39.bundle.json`](Laborbefund_05_N39.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | f889fba8-cb84-5aa1-a82c-40800975431e |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100445<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-12T10:00:00+02:00 |
| Ressourcen | 14 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 1, Specimen 1, ServiceRequest 1, Observation 3, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100445 vom 2026-08-12 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100445<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-12T10:00:00+02:00 |
| Patient | Elena Petrova |
| Kontakt | Kontakt ambulatory 2026-08-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0005<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100445<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Harnwegsinfektion, Lokalisation nicht bezeichnet (`ICD-10-GM#N39.0` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100445<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0005, L26-100445 |
| Befundzeitpunkt | 2026-08-12T10:00:00+02:00 |
| Freigegeben | 2026-08-12T10:00:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | UR01 (Mittelstrahlurin) |
| Ergebnisse | 3 Observation(s) |

## Patient

| Element | Inhalt |
|---|---|
| Name | Elena Petrova (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1005<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` P567890124<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | female |
| Geburtsdatum | 1995-06-30 |
| Aktiv | ja |
| Adresse | Hauptstr. 55, 12163 Berlin, DE (both) |

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
| Patient | Elena Petrova |
| Zeitraum | 2026-08-10 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#N39.0` (v2026) | V |  | Harnwegsinfektion, Lokalisation nicht bezeichnet | active | provisional | 2026-08-12 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| UR01 | Mittelstrahlurin (`SNOMED#122575003`) | 2026-08-10T09:15:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Urinstatus Teststreifen | `LOINC#24356-8`, `lokal#USTAT` | Leukozyten +++, Nitrit positiv, Blut ++ |  |  |  | UR01 (Mittelstrahlurin) | 2026-08-12T10:00:00+02:00 | final | Urinalysis studies (set) |
| 2 | Urinsediment | `LOINC#12235-8`, `lokal#USED` | Leukozyten massenhaft, Bakterien reichlich, Erys vereinzelt |  |  |  | UR01 (Mittelstrahlurin) | 2026-08-12T10:00:00+02:00 | final | Urinalysis studies (set) |
| 3 | Bakterienkultur Urin | `LOINC#630-4` | E. coli 10^5 KBE/ml, Antibiogramm folgt |  |  |  | UR01 (Mittelstrahlurin) | 2026-08-12T10:00:00+02:00 | final | Laboratory studies (set) |

### Details zu einzelnen Ergebnissen

**1. Urinstatus Teststreifen**

- Identifier: `OBI` BL26-100445-E0001
- Freigegeben: 2026-08-12T10:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**2. Urinsediment**

- Identifier: `OBI` BL26-100445-E0002
- Freigegeben: 2026-08-12T10:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**3. Bakterienkultur Urin**

- Identifier: `OBI` BL26-100445-E0003
- Freigegeben: 2026-08-12T10:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Signifikante Bakteriurie. Resistenztestung siehe Folgebefund.

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100445 vom 2026-08-12**

Patient: Elena Petrova; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

4 verknuepfte Ressource(n): DiagnosticReport/968f71a8, Urinstatus Teststreifen, Urinsediment, Bakterienkultur Urin

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Urinstatus Teststreifen | Leukozyten +++, Nitrit positiv, Blut ++ |  |  |  |
| Urinsediment | Leukozyten massenhaft, Bakterien reichlich, Erys vereinzelt |  |  |  |
| Bakterienkultur Urin | E. coli 10^5 KBE/ml, Antibiogramm folgt |  |  |  |

### Diagnosen / Veranlassungsgrund

1 verknuepfte Ressource(n): Harnwegsinfektion, Lokalisation nicht bezeichnet (`ICD-10-GM#N39.0` (v2026))

- N39.0 Harnwegsinfektion, Lokalisation nicht bezeichnet

### Probenmaterial

2 verknuepfte Ressource(n): Auftrag A2026-0005, L26-100445, UR01 (Mittelstrahlurin)

- UR01: Mittelstrahlurin (2026-08-10T09:15:00+02:00)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
