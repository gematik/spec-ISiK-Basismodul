# Laborbefund BL26-100441 vom 2026-08-11

Quelle: [`Laborbefund_01_I10.bundle.json`](Laborbefund_01_I10.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | 573a4705-7d0f-51c1-8e6b-0201efb53328 |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100441<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-11T14:10:00+02:00 |
| Ressourcen | 19 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 1, Specimen 2, ServiceRequest 1, Observation 7, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100441 vom 2026-08-11 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100441<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-11T14:10:00+02:00 |
| Patient | Klaus Bergmann |
| Kontakt | Kontakt ambulatory 2026-08-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0001<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100441<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Essentielle Hypertonie (`ICD-10-GM#I10.90` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100441<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0001, L26-100441 |
| Befundzeitpunkt | 2026-08-11T14:10:00+02:00 |
| Freigegeben | 2026-08-11T14:10:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | SE01 (Serum)<br>UR01 (Urin) |
| Ergebnisse | 7 Observation(s) |

## Patient

| Element | Inhalt |
|---|---|
| Name | Klaus Bergmann (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1001<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` B123456780<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | male |
| Geburtsdatum | 1958-04-12 |
| Aktiv | ja |
| Adresse | Ahornweg 4, 12043 Berlin, DE (both) |

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
| Patient | Klaus Bergmann |
| Zeitraum | 2026-08-10 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#I10.90` (v2026) | G |  | Essentielle Hypertonie | active | confirmed | 2026-08-11 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-10T08:15:00+02:00 |  |  |  | available |  |
| UR01 | Urin (`SNOMED#122575003`) | 2026-08-10T08:15:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Kreatinin [Masse/Volumen] in Serum | `LOINC#2160-0` | 1.3 mg/dl | mg/dl (`mg/dL`) | H (erhoeht) | 0.7 mg/dl – 1.2 mg/dl | SE01 (Serum) | 2026-08-11T14:10:00+02:00 | final | Chemistry studies (set) |
| 2 | eGFR nach CKD-EPI | `LOINC#62238-1` | 58 mL/min/{1.73_m2} | mL/min/{1.73_m2} | L (erniedrigt) | 90 mL/min/{1.73_m2} – (Alter und Geschlecht) | SE01 (Serum) | 2026-08-11T14:10:00+02:00 | final | Chemistry studies (set) |
| 3 | Kalium [Mol/Volumen] in Serum | `LOINC#2823-3` | 4.1 mmol/l | mmol/l (`mmol/L`) | N (normal) | 3.5 mmol/l – 5.1 mmol/l | SE01 (Serum) | 2026-08-11T14:10:00+02:00 | final | Chemistry studies (set) |
| 4 | Natrium [Mol/Volumen] in Serum | `LOINC#2951-2` | 141 mmol/l | mmol/l (`mmol/L`) | N (normal) | 136 mmol/l – 145 mmol/l | SE01 (Serum) | 2026-08-11T14:10:00+02:00 | final | Chemistry studies (set) |
| 5 | Glukose [Masse/Volumen] in Serum | `LOINC#2345-7` | 96 mg/dl | mg/dl (`mg/dL`) | N (normal) | 70 mg/dl – 100 mg/dl | SE01 (Serum) | 2026-08-11T14:10:00+02:00 | final | Chemistry studies (set) |
| 6 | Cholesterin gesamt [Masse/Volumen] in Serum | `LOINC#2093-3` | 232 mg/dl | mg/dl (`mg/dL`) | H (erhoeht) | – 200 mg/dl | SE01 (Serum) | 2026-08-11T14:10:00+02:00 | final | Chemistry studies (set) |
| 7 | Urinstatus Teststreifen | `LOINC#24356-8`, `lokal#USTAT` | Eiweiss negativ, Glukose negativ, Blut negativ |  |  |  | UR01 (Urin) | 2026-08-11T14:10:00+02:00 | final | Urinalysis studies (set) |

### Details zu einzelnen Ergebnissen

**1. Kreatinin [Masse/Volumen] in Serum**

- Identifier: `OBI` BL26-100441-E0001
- Freigegeben: 2026-08-11T14:10:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**2. eGFR nach CKD-EPI**

- Identifier: `OBI` BL26-100441-E0002
- Freigegeben: 2026-08-11T14:10:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: eGFR vermindert, Kontrolle in 3 Monaten empfohlen.

**3. Kalium [Mol/Volumen] in Serum**

- Identifier: `OBI` BL26-100441-E0003
- Freigegeben: 2026-08-11T14:10:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**4. Natrium [Mol/Volumen] in Serum**

- Identifier: `OBI` BL26-100441-E0004
- Freigegeben: 2026-08-11T14:10:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**5. Glukose [Masse/Volumen] in Serum**

- Identifier: `OBI` BL26-100441-E0005
- Freigegeben: 2026-08-11T14:10:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**6. Cholesterin gesamt [Masse/Volumen] in Serum**

- Identifier: `OBI` BL26-100441-E0006
- Freigegeben: 2026-08-11T14:10:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**7. Urinstatus Teststreifen**

- Identifier: `OBI` BL26-100441-E0007
- Freigegeben: 2026-08-11T14:10:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100441 vom 2026-08-11**

Patient: Klaus Bergmann; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

8 verknuepfte Ressource(n): DiagnosticReport/a4f0b63f, Kreatinin [Masse/Volumen] in Serum, eGFR nach CKD-EPI, Kalium [Mol/Volumen] in Serum, Natrium [Mol/Volumen] in Serum, Glukose [Masse/Volumen] in Serum, Cholesterin gesamt [Masse/Volumen] in Serum, Urinstatus Teststreifen

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Kreatinin [Masse/Volumen] in Serum | 1.3 | mg/dl | H | 0.7 - 1.2 |
| eGFR nach CKD-EPI | 58 | ml/min/1.73qm | L | 90 - |
| Kalium [Mol/Volumen] in Serum | 4.1 | mmol/l | N | 3.5 - 5.1 |
| Natrium [Mol/Volumen] in Serum | 141 | mmol/l | N | 136 - 145 |
| Glukose [Masse/Volumen] in Serum | 96 | mg/dl | N | 70 - 100 |
| Cholesterin gesamt [Masse/Volumen] in Serum | 232 | mg/dl | H | - 200 |
| Urinstatus Teststreifen | Eiweiss negativ, Glukose negativ, Blut negativ |  |  |  |

### Diagnosen / Veranlassungsgrund

1 verknuepfte Ressource(n): Essentielle Hypertonie (`ICD-10-GM#I10.90` (v2026))

- I10.90 Essentielle Hypertonie

### Probenmaterial

3 verknuepfte Ressource(n): Auftrag A2026-0001, L26-100441, SE01 (Serum), UR01 (Urin)

- SE01: Serum (2026-08-10T08:15:00+02:00)
- UR01: Urin (2026-08-10T08:15:00+02:00)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
