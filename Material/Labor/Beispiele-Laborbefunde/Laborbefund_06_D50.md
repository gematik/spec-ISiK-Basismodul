# Laborbefund BL26-100446 vom 2026-08-11

Quelle: [`Laborbefund_06_D50.bundle.json`](Laborbefund_06_D50.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | b3322e6c-1dc9-5ba6-87c7-866baa1a9784 |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100446<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-08-11T16:00:00+02:00 |
| Ressourcen | 19 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 1, Specimen 2, ServiceRequest 1, Observation 7, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100446 vom 2026-08-11 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100446<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-08-11T16:00:00+02:00 |
| Patient | Miriam Krause |
| Kontakt | Kontakt ambulatory 2026-08-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0006<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100446<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Veranlassungsgruende | Eisenmangelanaemie, nicht naeher bezeichnet (`ICD-10-GM#D50.9` (v2026)) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100446<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0006, L26-100446 |
| Befundzeitpunkt | 2026-08-11T16:00:00+02:00 |
| Freigegeben | 2026-08-11T16:00:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | ED01 (EDTA-Blut)<br>SE01 (Serum) |
| Ergebnisse | 7 Observation(s) |

## Patient

| Element | Inhalt |
|---|---|
| Name | Miriam Krause (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P1006<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` K678901235<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | female |
| Geburtsdatum | 1988-11-05 |
| Aktiv | ja |
| Adresse | Feldstr. 3, 10559 Berlin, DE (both) |

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
| Patient | Miriam Krause |
| Zeitraum | 2026-08-10 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#D50.9` (v2026) | V |  | Eisenmangelanaemie, nicht naeher bezeichnet | active | provisional | 2026-08-11 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| ED01 | EDTA-Blut (`SNOMED#445295009`) | 2026-08-10T09:30:00+02:00 |  |  |  | available |  |
| SE01 | Serum (`SNOMED#119364003`) | 2026-08-10T09:30:00+02:00 |  |  |  | available |  |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Haemoglobin [Masse/Volumen] im Blut | `LOINC#718-7` | 10.2 g/dl | g/dl (`g/dL`) | L (erniedrigt) | 12 g/dl – 15.4 g/dl | ED01 (EDTA-Blut) | 2026-08-11T16:00:00+02:00 | final | Hematology studies (set) |
| 2 | MCV (mittleres Erythrozytenvolumen) | `LOINC#787-2` | 74 fl | fl (`fL`) | L (erniedrigt) | 81 fl – 96 fl | ED01 (EDTA-Blut) | 2026-08-11T16:00:00+02:00 | final | Hematology studies (set) |
| 3 | Leukozyten [Anzahl/Volumen] im Blut | `LOINC#6690-2` | 6.4 /nl | /nl (`/nL`) | N (normal) | 3.9 /nl – 10.5 /nl | ED01 (EDTA-Blut) | 2026-08-11T16:00:00+02:00 | final | Hematology studies (set) |
| 4 | Thrombozyten [Anzahl/Volumen] im Blut | `LOINC#777-3` | 398 /nl | /nl (`/nL`) | H (erhoeht) | 150 /nl – 370 /nl | ED01 (EDTA-Blut) | 2026-08-11T16:00:00+02:00 | final | Hematology studies (set) |
| 5 | Ferritin [Masse/Volumen] in Serum | `LOINC#2276-4` | 7 ng/ml | ng/ml (`ng/mL`) | LL (kritisch erniedrigt) | 13 ng/ml – 150 ng/ml | SE01 (Serum) | 2026-08-11T16:00:00+02:00 | final | Chemistry studies (set) |
| 6 | Transferrinsaettigung | `LOINC#2502-3` | 9 % | % | L (erniedrigt) | 16 % – 45 % | SE01 (Serum) | 2026-08-11T16:00:00+02:00 | final | Chemistry studies (set) |
| 7 | Retikulozyten/100 Erythrozyten | `LOINC#17849-1` | 0.6 % | % | N (normal) | 0.5 % – 2 % | ED01 (EDTA-Blut) | 2026-08-11T16:00:00+02:00 | final | Hematology studies (set) |

### Details zu einzelnen Ergebnissen

**1. Haemoglobin [Masse/Volumen] im Blut**

- Identifier: `OBI` BL26-100446-E0001
- Freigegeben: 2026-08-11T16:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**2. MCV (mittleres Erythrozytenvolumen)**

- Identifier: `OBI` BL26-100446-E0002
- Freigegeben: 2026-08-11T16:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**3. Leukozyten [Anzahl/Volumen] im Blut**

- Identifier: `OBI` BL26-100446-E0003
- Freigegeben: 2026-08-11T16:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**4. Thrombozyten [Anzahl/Volumen] im Blut**

- Identifier: `OBI` BL26-100446-E0004
- Freigegeben: 2026-08-11T16:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**5. Ferritin [Masse/Volumen] in Serum**

- Identifier: `OBI` BL26-100446-E0005
- Freigegeben: 2026-08-11T16:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Ferritin stark erniedrigt - vereinbar mit Eisenmangel.

**6. Transferrinsaettigung**

- Identifier: `OBI` BL26-100446-E0006
- Freigegeben: 2026-08-11T16:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**7. Retikulozyten/100 Erythrozyten**

- Identifier: `OBI` BL26-100446-E0007
- Freigegeben: 2026-08-11T16:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100446 vom 2026-08-11**

Patient: Miriam Krause; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

8 verknuepfte Ressource(n): DiagnosticReport/799724aa, Haemoglobin [Masse/Volumen] im Blut, MCV (mittleres Erythrozytenvolumen), Leukozyten [Anzahl/Volumen] im Blut, Thrombozyten [Anzahl/Volumen] im Blut, Ferritin [Masse/Volumen] in Serum, Transferrinsaettigung, Retikulozyten/100 Erythrozyten

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Haemoglobin [Masse/Volumen] im Blut | 10.2 | g/dl | L | 12.0 - 15.4 |
| MCV (mittleres Erythrozytenvolumen) | 74 | fl | L | 81 - 96 |
| Leukozyten [Anzahl/Volumen] im Blut | 6.4 | /nl | N | 3.9 - 10.5 |
| Thrombozyten [Anzahl/Volumen] im Blut | 398 | /nl | H | 150 - 370 |
| Ferritin [Masse/Volumen] in Serum | 7 | ng/ml | LL | 13 - 150 |
| Transferrinsaettigung | 9 | % | L | 16 - 45 |
| Retikulozyten/100 Erythrozyten | 0.6 | % | N | 0.5 - 2.0 |

### Diagnosen / Veranlassungsgrund

1 verknuepfte Ressource(n): Eisenmangelanaemie, nicht naeher bezeichnet (`ICD-10-GM#D50.9` (v2026))

- D50.9 Eisenmangelanaemie, nicht naeher bezeichnet

### Probenmaterial

3 verknuepfte Ressource(n): Auftrag A2026-0006, L26-100446, ED01 (EDTA-Blut), SE01 (Serum)

- ED01: EDTA-Blut (2026-08-10T09:30:00+02:00)
- SE01: Serum (2026-08-10T09:30:00+02:00)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
