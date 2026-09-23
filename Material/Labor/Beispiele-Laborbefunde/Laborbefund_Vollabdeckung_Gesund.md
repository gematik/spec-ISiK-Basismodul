# Laborbefund BL26-100777 vom 2026-09-12

Quelle: [`Laborbefund_Vollabdeckung_Gesund.bundle.json`](Laborbefund_Vollabdeckung_Gesund.bundle.json) · [Übersicht](README.md)

| Element | Inhalt |
|---|---|
| Bundle-ID | f8b172ab-f6b0-5150-b2df-d2d8e4e7a1d1 |
| Profil | ISiKBerichtBundle |
| Typ | document |
| Identifier | `FILL` BL26-100777<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-bundle</sub> |
| Zeitstempel | 2026-09-12T14:00:00+02:00 |
| Ressourcen | 55 (Composition 1, Organization 2, Practitioner 2, Patient 1, Encounter 1, Condition 12, Specimen 7, ServiceRequest 1, Observation 22, DocumentReference 4, MedicationStatement 1, DiagnosticReport 1) |

## Befund

### Composition

| Element | Inhalt |
|---|---|
| Titel | Laborbefund BL26-100777 vom 2026-09-12 |
| Profil | ISiKBerichtSubSysteme |
| Status | final |
| Identifier | `FILL` BL26-100777<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Typ | Laborbefund (`KDL#LB120107`, `IHE-XDS-Typ#BEFU`, `LOINC#11502-2`) |
| Kategorie | Laborergebnisse (`IHE-XDS-Klasse#LAB`) |
| Datum | 2026-09-12T14:00:00+02:00 |
| Patient | Dr. Salome Vita Freifrau von Wohlauf |
| Kontakt | Kontakt ambulatory 2026-09-10 |
| Autor | Dr. Richard Mueller<br>Labor Mueller |
| Verwahrer | Labor Mueller |
| Abschnitte | Laborergebnisse<br>Diagnosen / Veranlassungsgrund<br>Probenmaterial<br>Hinweise<br>Weitere Angaben<br>Anhaenge |

### Auftrag (ServiceRequest)

| Element | Inhalt |
|---|---|
| Identifier | `PLAC` A2026-0777<br><sub>https://labor-testdaten.example/praxis/398212400/sid/auftragsnummer</sub><br>`FILL` L26-100777<br><sub>https://labor-testdaten.example/labor/270719100/sid/auftragsnummer</sub><br>NF-2026-0777-01<br><sub>https://labor-testdaten.example/praxis/398212400/sid/nachforderung</sub> |
| Status / Intent | completed / order |
| Kategorie | Laboratory procedure (`SNOMED#108252007`) |
| Leistung | Laboruntersuchung (`LOINC#26436-6`) |
| Anfordernde Person | Dr. med. Heribert Topp-Gluecklich |
| Ausfuehrendes Labor | Labor Mueller |
| Angefordert am | 2026-09-10T08:30:00+02:00 |
| Veranlassungsgruende | Ueberwachung einer normalen Erstschwangerschaft, 26+3 SSW (`ICD-10-GM#Z34` (v2026))<br>Bekannter M. Meulengracht (harmlose Hyperbilirubinaemie) (`ICD-10-GM#E80.4` (v2026))<br>Aerztliche Allgemeinuntersuchung (Check-up), gesund (`ICD-10-GM#Z00.0` (v2026))<br>Gynaekologische Krebsfrueherkennung (Zervix) (`ICD-10-GM#Z01.4` (v2026))<br>Melanozytaerer Naevus Unterarm links, exzidiert 08.09.2026 (`ICD-10-GM#D22.6` (v2026))<br>Abstinenznachweis Alkohol (freiwillig, Fahreignung) (`ICD-10-GM#Z02` (v2026))<br>Umgebungsuntersuchung: Hauskatze und Trinkwasser (Altbau)<br>Vitamin-D-Versorgung in der Schwangerschaft (HzV) (`ICD-10-GM#Z71` (v2026))<br>B-Streptokokken-Screening 26. SSW (IGeL) (`ICD-10-GM#Z36` (v2026))<br>HLA-Typisierung Stammzellspender-Registrierung (DKMS) (`ICD-10-GM#Z52.3` (v2026))<br>Bestaetigungs-PCR nach pos. Antigentest, beschwerdefrei (`ICD-10-GM#Z20.8` (v2026))<br>Vorsorge-Laborprofil (Laborgemeinschaft) (`ICD-10-GM#Z00.0` (v2026)) |
| Hinweise | Mutterschaftsvorsorge nach Mutterschafts-Richtlinien, 26. SSW; Anti-D-Prophylaxe geplant (RhD negativ).<br>Roeteln-Immunitaet laut Impfpass (2 Impfungen) - keine Titerbestimmung erforderlich; Blutbild als Check-up.<br>Vorbefund 03/2026: Blutbild, Ferritin, TSH unauffaellig<br>Vorbefund 03/2026: Roeteln-IgG positiv (immun)<br>Folsaeure 5 mg 1-0-0 (Schwangerschaftssupplement) |

### DiagnosticReport

| Element | Inhalt |
|---|---|
| Identifier | `FILL` BL26-100777<br><sub>https://labor-testdaten.example/labor/270719100/sid/befund-id</sub> |
| Status | final |
| Kategorie | Laboratory (`v2-0074#LAB`) |
| Code | Laborbefund (`LOINC#11502-2`) |
| Basiert auf | Auftrag A2026-0777, L26-100777, NF-2026-0777-01 |
| Befundzeitpunkt | 2026-09-12T14:00:00+02:00 |
| Freigegeben | 2026-09-12T14:00:00+02:00 |
| Erstellt von | Labor Mueller<br>Dr. Richard Mueller |
| Freigegeben von | Dr. Richard Mueller |
| Proben | ED01 (EDTA-Blut)<br>SE01 (Serum)<br>UR01 (Sammelurin)<br>AB01 (Zervixabstrich)<br>AB02 (Vaginal-Rektalabstrich)<br>GW01 (Gewebe)<br>TW01 (Trinkwasser) |
| Ergebnisse | 18 Observation(s) |
| Beurteilung | Gesunde Schwangere (26+3 SSW). Alle Befunde ohne Krankheitswert. Empfehlungen: Anti-D-Prophylaxe SSW 28; GBS-Prophylaxe unter der Geburt vermerken; Ko-Test Zytologie/HPV in 12 Monaten; Hautkrebs-Screening in 2 Jahren. Zusammenfassung: Blutbild, Vitamin D, Blutgruppe/AKS, Zytologie, Histologie, SARS-CoV-2-PCR und Ethanol unauffaellig; Bilirubin leicht erhoeht bei bekanntem M. Meulengracht (harmlos); GBS-Besiedlung ohne Krankheitswert; HPV-HR-Nachweis ohne Zellveraenderung. Katze Minka: Toxoplasma-PCR im Kot negativ (separater Bericht). |
| Praesentationsform | application/pdf · eingebettet, 404 Bytes<br>HLA_Typisierung_DKMS.pdf · application/pdf · nur Verweis, kein Inhalt<br>Unterschrift_Mueller.png · image/png · nur Verweis, kein Inhalt<br>Mutterpass_S05_Wohlauf.pdf · application/pdf · nur Verweis, kein Inhalt |

## Patient

| Element | Inhalt |
|---|---|
| Name | Dr. Salome Vita Freifrau von Wohlauf (official) |
| Profil | ISiKPatient |
| Identifier | `MR` P2026-0777<br><sub>https://labor-testdaten.example/praxis/398212400/sid/patienten-id</sub><br>`KVZ10` W234567812<br><sub>http://fhir.de/sid/gkv/kvid-10</sub> |
| Geschlecht | female |
| Geburtsdatum | 1994-05-20 |
| Verstorben | 2099-12-31 |
| Aktiv | ja |
| Adresse | Wilhelminenstr. 7, Vorderhaus, 2. OG, 64283 Darmstadt, DE (both) |
| Kontakt | phone: 061519876543 (work)<br>phone: 01701234567 (mobile)<br>email: salome.wohlauf@example.org (work) |

## Beteiligte

| Ressource | Name | Rolle im Befund | Identifier | Kontakt | Adresse | Profil |
|---|---|---|---|---|---|---|
| Practitioner | Dr. Richard Mueller | Autor des Befunds<br>Befunderstellung (performer)<br>Befundfreigabe (resultsInterpreter) | `EN` RM<br><sub>https://labor-testdaten.example/labor/270719100/sid/mitarbeiter</sub> |  |  | ISiKPersonImGesundheitsberuf |
| Practitioner | Dr. med. Heribert Topp-Gluecklich | Einsender (anfordernde Person)<br>behandelnde Person | `LANR` 776299002<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR</sub> |  |  | ISiKPersonImGesundheitsberuf |
| Organization | Labor Mueller | Labor (Auftragsempfaenger)<br>Verwahrer des Befunds (custodian)<br>Autor des Befunds<br>Befunderstellung (performer) | `BSNR` 270719100<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR</sub><br>`XX` 261987654<br><sub>http://fhir.de/sid/arge-ik/iknr</sub> | phone: 02211456546 (work)<br>fax: 02211456547 (work)<br>email: befund@labor-mueller.example (work)<br>url: www.labor-mueller.example | Ottostr. 2, 50859 Koeln, DE | ISiKOrganisation |
| Organization | Praxis Dr. med. Heribert Topp-Gluecklich | Einsender (Betriebsstaette) | `BSNR` 398212400<br><sub>https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR</sub> | phone: 061511111111 (work)<br>fax: 061511111112 (work)<br>email: praxis@topp-gluecklich.example (work)<br>url: www.topp-gluecklich.example | Musterstr. 1, 64297 Darmstadt, DE | ISiKOrganisation |

## Kontakt (Encounter)

| Element | Inhalt |
|---|---|
| Status | finished |
| Klasse | ambulatory (`v3-ActCode#AMB`) |
| Patient | Dr. Salome Vita Freifrau von Wohlauf |
| Zeitraum | 2026-09-10 |
| Beteiligte | Dr. med. Heribert Topp-Gluecklich |
| Einrichtung | Praxis Dr. med. Heribert Topp-Gluecklich |

## Diagnosen

| # | Code | Sicherheit | Seite | Bezeichnung / Hinweis | Klinischer Status | Verifikation | Dokumentiert | Profil |
|---|---|---|---|---|---|---|---|---|
| 1 | `ICD-10-GM#Z34` (v2026) | G |  | Ueberwachung einer normalen Erstschwangerschaft, 26+3 SSW<br>Erstgravida, unauffaelliger Verlauf | active | confirmed | 2026-09-12 | ISiKDiagnose |
| 2 | `ICD-10-GM#E80.4` (v2026) | G |  | Bekannter M. Meulengracht (harmlose Hyperbilirubinaemie)<br>Gilbert-Syndrom, keine Krankheitsbedeutung<br>Keine Ausnahme - Angabe nur zur Feldabdeckung | active | confirmed | 2026-09-12 | ISiKDiagnose |
| 3 | `ICD-10-GM#Z00.0` (v2026) | G |  | Aerztliche Allgemeinuntersuchung (Check-up), gesund | active | confirmed | 2026-09-12 | ISiKDiagnose |
| 4 | `ICD-10-GM#Z01.4` (v2026) | G |  | Gynaekologische Krebsfrueherkennung (Zervix) | active | confirmed | 2026-09-12 | ISiKDiagnose |
| 5 | `ICD-10-GM#D22.6` (v2026) | Z | L | Melanozytaerer Naevus Unterarm links, exzidiert 08.09.2026<br>Klinisch benigne, Exzision auf Patientenwunsch | resolved | confirmed | 2026-09-12 | ISiKDiagnose |
| 6 | `ICD-10-GM#Z02` (v2026) | G |  | Abstinenznachweis Alkohol (freiwillig, Fahreignung) | active | confirmed | 2026-09-12 | ISiKDiagnose |
| 7 |  |  |  | Umgebungsuntersuchung: Hauskatze und Trinkwasser (Altbau) | active |  | 2026-09-12 | ISiKDiagnose |
| 8 | `ICD-10-GM#Z71` (v2026) | G |  | Vitamin-D-Versorgung in der Schwangerschaft (HzV) | active | confirmed | 2026-09-12 | ISiKDiagnose |
| 9 | `ICD-10-GM#Z36` (v2026) | G |  | B-Streptokokken-Screening 26. SSW (IGeL) | active | confirmed | 2026-09-12 | ISiKDiagnose |
| 10 | `ICD-10-GM#Z52.3` (v2026) | G |  | HLA-Typisierung Stammzellspender-Registrierung (DKMS) | active | confirmed | 2026-09-12 | ISiKDiagnose |
| 11 | `ICD-10-GM#Z20.8` (v2026) | A |  | Bestaetigungs-PCR nach pos. Antigentest, beschwerdefrei |  | refuted | 2026-09-12 | ISiKDiagnose |
| 12 | `ICD-10-GM#Z00.0` (v2026) | G |  | Vorsorge-Laborprofil (Laborgemeinschaft) | active | confirmed | 2026-09-12 | ISiKDiagnose |

## Proben

| Proben-ID | Material | Entnahme | Eingang im Labor | Menge | Koerperstelle | Status | Hinweise |
|---|---|---|---|---|---|---|---|
| ED01 | EDTA-Blut (`SNOMED#445295009`) | 2026-09-10T08:15:00+02:00 | 2026-09-10T11:00:00+02:00 | 2.7 ml | Vena cubitalis links | available | Blutbild / Blutgruppe<br>nuechtern seit 22:00 Uhr<br>Wasser (250 ml) um 07:00 Uhr<br>Material organisch (menschlich)<br>Gefaess ED01: Transport bei Raumtemperatur, Eingang am gleichen Tag. |
| SE01 | Serum (`SNOMED#119364003`) | 2026-09-10T08:15:00+02:00 | 2026-09-10T11:00:00+02:00 | 4.9 ml | Vena cubitalis links | available | Serum-Monovette mit Gel<br>nuechtern seit 22:00 Uhr<br>Wasser (250 ml) um 07:00 Uhr<br>Material organisch (menschlich)<br>Gefaess SE01: Transport bei Raumtemperatur, Eingang am gleichen Tag. |
| UR01 | Sammelurin (`SNOMED#122575003`) | 2026-09-10T08:15:00+02:00 | 2026-09-10T11:00:00+02:00 | 650 ml | Harnblase | available | 12-h-Nachturin (Iodausscheidung)<br>Material organisch (menschlich)<br>Gefaess UR01: Transport bei Raumtemperatur, Eingang am gleichen Tag.<br>Aufmerksamkeit: Urinzytologie: Zellmaterial nicht verwertbar (zu geringe Zellzahl im Sammelurin). Iodausscheidung und Urinstatus sind davon nicht betroffen. Bei Bedarf Spontanurin nachsenden. |
| AB01 | Zervixabstrich | 2026-09-10T08:15:00+02:00 | 2026-09-10T11:00:00+02:00 |  | Ekto-/Endozervix | available | Duennschichtzytologie (LBC-Medium)<br>Material organisch (menschlich)<br>Gefaess AB01: Transport bei Raumtemperatur, Eingang am gleichen Tag. |
| AB02 | Vaginal-Rektalabstrich | 2026-09-10T08:15:00+02:00 | 2026-09-10T11:00:00+02:00 |  | Introitus vaginae / Rektum | available | GBS-Screening (Selektivmedium)<br>Material organisch (menschlich)<br>Gefaess AB02: Transport bei Raumtemperatur, Eingang am gleichen Tag. |
| GW01 | Gewebe (`SNOMED#119376003`) | 2026-09-10T08:15:00+02:00 | 2026-09-10T11:00:00+02:00 |  | Unterarm links, volar | available | Exzidat Naevus in Formalin<br>Material organisch (menschlich)<br>Gefaess GW01: Transport bei Raumtemperatur, Eingang am gleichen Tag. |
| TW01 | Trinkwasser | 2026-09-10T08:15:00+02:00 | 2026-09-10T11:00:00+02:00 | 500 ml | Wohnung Wilhelminenstr. 7 | available | Kaltwasser Kueche, Stagnationsprobe<br>Anorganisches Material: Wasserprobe aus Bleirohr-Verdacht<br>Gefaess TW01: Transport bei Raumtemperatur, Eingang am gleichen Tag. |

## Laborergebnisse

| # | Untersuchung | Code | Ergebnis | Einheit | Bewertung | Referenzbereich | Probe | Zeitpunkt | Status | Bereich |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Hemoglobin [Mass/volume] in Blood | `LOINC#718-7` | 12.4 g/dl | g/dl (`g/dL`) | N (normal) | 11 g/dl – 14 g/dl (Referenzbereich 2. Trimenon Einflussgroesse SSW: physiologische Haemodilution)<br>(Sonstiger Standard: Laborinterne Liste) | ED01 (EDTA-Blut) | 2026-09-12T14:30:00+02:00 | final | Hematology studies (set) |
| 2 | Bilirubin gesamt | `LOINC#1975-2`, `lokal#BILI` | 1.6 mg/dl | mg/dl (`mg/dL`) | H (erhoeht) | – 1.2 mg/dl (Alter und Geschlecht) | SE01 (Serum) | 2026-09-12T14:30:00+02:00 | final | Chemistry studies (set) |
| 3 | 25-OH-Vitamin D | `LOINC#26436-6` | 38 ng/ml | ng/ml (`ng/mL`) | N (normal) | 30 ng/ml – 100 ng/ml | SE01 (Serum) | 2026-09-12T14:30:00+02:00 | final | Laboratory studies (set) |
| 4 | Ethanol im Serum | `LOINC#5643-2`, `lokal#ETOH` | <0.1 g/l | g/l (`g/L`) | N (normal) | – 0.1 g/l (Nachweisgrenze 0.10 g/l) | SE01 (Serum) | 2026-09-12T14:30:00+02:00 | final | Toxicology studies (set) |
| 5 | Blei im Trinkwasser | `LOINC#9477-1`, `lokal#PB` | 1.2 ug/l | ug/l (`ug/L`) | N (normal) | – 5 ug/l (Grenzwert TrinkwV 5 ug/l Trinkwasserverordnung (kein Patientenwert)) | TW01 (Trinkwasser) | 2026-09-12T14:30:00+02:00 | final | Toxicology studies (set) |
| 6 | B-Streptokokken-Screening mit Antibiogramm | `LOINC#72607-5`, `lokal#GBS` | Streptococcus agalactiae (Gruppe B) (nachgewiesen) (`SNOMED#260373001`) |  |  |  | AB02 (Vaginal-Rektalabstrich) | 2026-09-12T11:30:00+02:00 | final | Laboratory studies (set) |
| 7 | Antibiogramm (Streptococcus agalactiae (Gruppe B)) | `LOINC#29576-6` |  |  |  |  | AB02 (Vaginal-Rektalabstrich) | 2026-09-12T11:30:00+02:00 | final | Laboratory studies (set) |
| 8 | SARS-CoV-2-PCR | `LOINC#94500-6`, `lokal#COVPCR` | SARS-CoV-2 RNA (nicht nachgewiesen) (`SNOMED#260415000`) |  |  |  | AB02 (Vaginal-Rektalabstrich) | 2026-09-10T16:00:00+02:00 | final | Laboratory studies (set) |
| 9 | Blutalkoholkonzentration (BAK) | `LOINC#5643-2` | 0 Promille | Promille (`[ppth]`) | N (normal) | – 0 Promille (Abstinenz: 0.00) |  | 2026-09-10T16:00:00+02:00 | final | Toxicology studies (set) |
| 10 | Zervixzytologie Duennschicht | `LOINC#47527-7`, `lokal#PAP` | Muenchner Nomenklatur III: Gruppe II-a |  | N (normal) |  | AB01 (Zervixabstrich) | 2026-09-12T14:30:00+02:00 | final | Laboratory studies (set) |
| 11 | HPV-High-Risk-Test (14 Typen) | `LOINC#82675-0`, `lokal#HPVHR` | HPV-HR positiv (Typ 52), HPV 16/18 negativ. Persistenz aus 2023; Zytologie unauffaellig - kein Anhalt fuer Erkrankung. Kontrolle gemaess oKFE-RL. |  | A (auffaellig) |  | AB01 (Zervixabstrich) | 2026-09-12T14:30:00+02:00 | final | Laboratory studies (set) |
| 12 | HPV-Genotypisierung + Biomarker | `LOINC#91851-6`, `lokal#HPVTYP` | HPV-Genotyp 52 (High-Risk) und 6 (Low-Risk) nachweisbar; p16/Ki-67 negativ, L1 positiv (guenstige Prognose). |  | N (normal) |  | AB01 (Zervixabstrich) | 2026-09-12T14:30:00+02:00 | final | Laboratory studies (set) |
| 13 | Urinzytologie | `LOINC#47525-1`, `lokal#URZYT` | – (kein Wert: not-performed) |  | N (normal) |  | UR01 (Sammelurin) | 2026-09-12T14:00:00+02:00 | cancelled | Laboratory studies (set) |
| 14 | Blutgruppe (AB0/RhD) | `LOINC#882-1` | A RhD- |  |  |  | ED01 (EDTA-Blut) | 2026-09-12T14:30:00+02:00 | final | Blood bank studies (set) |
| 15 | Antikoerpersuchtest | `LOINC#890-4` | Not detected (`SNOMED#260415000`) |  | NEG (negativ) |  | ED01 (EDTA-Blut) | 2026-09-12T14:30:00+02:00 | final | Blood bank studies (set) |
| 16 | Direkter Coombstest | `LOINC#1007-4` | Not detected (`SNOMED#260415000`) |  | NEG (negativ) |  | ED01 (EDTA-Blut) | 2026-09-12T14:30:00+02:00 | final | Blood bank studies (set) |
| 17 | Kreuzproben | `LOINC#1250-0` | Type & Screen negativ, keine Kreuzprobe erforderlich; Erythrozytenkonzentrate im Bedarfsfall: A RhD neg, K neg |  |  |  | ED01 (EDTA-Blut) | 2026-09-12T14:30:00+02:00 | final | Blood bank studies (set) |
| 18 | Histologie Exzidat Naevus | `LOINC#22637-3`, `lokal#HISTO` | Makroskopie: Hautspindel 12 x 8 x 3 mm mit zentraler, hellbrauner, scharf begrenzter Laesion 6 x 4 mm. Mikroskopie: Nester regelrechter Melanozyten an der dermo-epidermalen Junktion und in der oberen Dermis, Ausreifung zur Tiefe, keine Atypien, keine Mitosen. Diagnose: Benigner melanozytaerer Compound-Naevus, vollstaendig exzidiert (R0). Kein Anhalt fuer Malignitaet. |  | N (normal) |  | GW01 (Gewebe) | 2026-09-12T14:30:00+02:00 | final | Laboratory studies (set) |

### Details zu einzelnen Ergebnissen

**1. Hemoglobin [Mass/volume] in Blood**

- Identifier: `OBI` BL26-100777-E0001
- Methode: Photometrie (SLS-Haemoglobin)
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Leichte Haemodilution in der Schwangerschaft ist physiologisch.
- Hinweis: Haemoglobin im Referenzbereich fuer das 2. Trimenon.
- Hinweis: Ergebnis aerztlich validiert.
- Hinweis: DRG: Ohne DRG-Relevanz (ambulant).

**2. Bilirubin gesamt**

- Identifier: `OBI` BL26-100777-E0002
- Methode: Diazo-Methode, Cobas
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Isolierte indirekte Hyperbilirubinaemie ohne Krankheitswert (Gilbert-Syndrom, ca. 5 % der Bevoelkerung). Kein Handlungsbedarf.
- Hinweis: Bilirubin leicht erhoeht - bekannter M. Meulengracht.
- Hinweis: Ergebnis aerztlich validiert.
- Hinweis: Hinweis zu Bilirubin gesamt: Auffaelliger Wert ohne Krankheitswert: bekannter M. Meulengracht laut Auftrag.
- Hinweis: DRG: Ohne DRG-Relevanz (ambulant).

**3. 25-OH-Vitamin D**

- Identifier: `OBI` BL26-100777-E0003
- Methode: CLIA
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Supplementierung nicht erforderlich.
- Hinweis: Vitamin-D-Versorgung ausreichend.
- Hinweis: Ergebnis aerztlich validiert.
- Hinweis: DRG: Ohne DRG-Relevanz (ambulant).

**4. Ethanol im Serum**

- Identifier: `OBI` BL26-100777-E0004
- Methode: Enzymatisch (ADH)
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Abstinenznachweis erbracht.
- Hinweis: Ethanol nicht nachweisbar (< 0.10 g/l = 0.00 Promille).
- Hinweis: Ergebnis aerztlich validiert.
- Hinweis: DRG: Ohne DRG-Relevanz (ambulant).

**5. Blei im Trinkwasser**

- Identifier: `OBI` BL26-100777-E0005
- Methode: ICP-MS
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Stagnationsprobe; Wasser kann bedenkenlos genutzt werden.
- Hinweis: Blei unterhalb des Grenzwertes; Bleileitung unwahrscheinlich.
- Hinweis: Ergebnis aerztlich validiert.
- Hinweis: DRG: Ohne DRG-Relevanz (ambulant).

**6. B-Streptokokken-Screening mit Antibiogramm**

- Identifier: `OBI` BL26-100777-E0006
- Methode: Anreicherung LIM-Bouillon, Granada-Agar, 36 C, 24-48 h; MALDI-TOF Identifizierung
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Besiedlung (keine Infektion). Bei ca. 20 % gesunder Schwangerer nachweisbar; relevant nur fuer die Geburt.
- Hinweis: Streptococcus agalactiae, maessig.
- Hinweis: GBS-Besiedlung nachgewiesen. Empfehlung: intrapartale Antibiotikaprophylaxe (Vermerk im Mutterpass).
- Hinweis: Kein Behandlungsbedarf waehrend der Schwangerschaft.
- Hinweis: Hinweis zu B-Streptokokken-Screening mit Antibiogramm: Wiedervorstellung: Ergebnis in den Mutterpass uebernehmen (Geburtsplanung). (Termin 2026-12-14: Geburtstermin: GBS-Prophylaxe)
- Hinweis: DRG: Ohne DRG-Relevanz.
- Hinweis: Wachstum/Menge: 2 KBE/Abstrich (semiquantitativ)
- Hinweis: Antibiogramm bei Nachweis

**7. Antibiogramm (Streptococcus agalactiae (Gruppe B))**

- Identifier: `OBI` BL26-100777-E0006-AB1
- Methode: Agardiffusion
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Abgeleitet von: B-Streptokokken-Screening mit Antibiogramm
- Hinweis: Intrapartale Prophylaxe: Penicillin G i.v. (1. Wahl); bei Penicillinallergie Cefazolin oder - da Erythromycin resistent, Clindamycin sensibel - Clindamycin.
- Hinweis: Bewertung nach EUCAST.

Komponenten:

| Komponente | Code | Wert | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Penicillin G | `ATC#J01CE01`, `lokal#PEN` | 0.06 mg/l | S (sensibel) |  |
| Ampicillin | `ATC#J01CA01`, `lokal#AMP` | 0.12 mg/l | S (sensibel) |  |
| Cefazolin | `ATC#J01DB04`, `lokal#CEF` | 0.25 mg/l | S (sensibel) |  |
| Clindamycin | `ATC#J01FF01`, `lokal#CLI` | 0.06 mg/l | S (sensibel) |  |
| Erythromycin | `ATC#J01FA01`, `lokal#ERY` | 8 mg/l | R (resistent) |  |
| Vancomycin | `ATC#J01XA01`, `lokal#VAN` | 0.5 mg/l | S (sensibel) |  |


**8. SARS-CoV-2-PCR**

- Identifier: `OBI` BL26-100777-E0007
- Methode: RT-PCR (Zielgene E, N), Cobas 6800
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: SARS-CoV-2-RNA nicht nachweisbar.
- Hinweis: Antigen-Schnelltest falsch positiv; PCR negativ. Keine Infektion, keine Isolation erforderlich.
- Hinweis: DRG: Ohne DRG-Relevanz.

**9. Blutalkoholkonzentration (BAK)**

- Identifier: `OBI` BL26-100777-E0007-BAK
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Blutalkoholkonzentration (Serum SE01, enzymatisch + GC): 0.00 Promille
- Hinweis: Kein Ethanol nachweisbar.
- Hinweis: Bestimmung aus Probe SE01.

**10. Zervixzytologie Duennschicht**

- Identifier: `OBI` BL26-100777-E0008
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Gruppe II-a: unauffaelliger Befund bei auffaelliger Anamnese (HPV-HR 2023 positiv). Schwangerschaftsbedingte Veraenderungen (Navikularzellen), kein Anhalt fuer Dysplasie.
- Hinweis: Gruppe II-a: unauffaelliger Befund bei auffaelliger Anamnese (HPV-HR 2023 positiv).
- Hinweis: Schwangerschaftsbedingte Veraenderungen (Navikularzellen), kein Anhalt fuer Dysplasie.
- Hinweis: Zytologische Beurteilung durch Zytologieassistentin, aerztliche Freigabe.
- Hinweis: DRG: Ohne DRG-Relevanz.
- Hinweis: Krebsfrueherkennung Zervix-Karzinom (Ko-Test): Ko-Testung im Rahmen des organisierten Screenings (Alter >= 35 nicht erreicht, Ko-Test wegen HPV-Nachweis 2023 empfohlen); Voruntersuchung 2023-06-15, Gruppe II-a; Z.n. laparoskopischer Ovarialzystenentfernung 2019-03-12 (benigne); Anamnese laut Patientin.

**11. HPV-High-Risk-Test (14 Typen)**

- Identifier: `OBI` BL26-100777-E0009
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: HPV-HR positiv (Typ 52), HPV 16/18 negativ.
- Hinweis: Persistenz aus 2023; Zytologie unauffaellig - kein Anhalt fuer Erkrankung. Kontrolle gemaess oKFE-RL.
- Hinweis: Transiente HPV-Infektionen sind bei gesunden Frauen haeufig und heilen meist spontan aus.
- Hinweis: Hinweis zu HPV-High-Risk-Test (14 Typen): HPV-HR positiv (Non-16/18) bei unauffaelliger Zytologie: Ko-Test in 12 Monaten. (Termin 2027-09-10: Ko-Test Zytologie + HPV)
- Hinweis: DRG: Ohne DRG-Relevanz.

**12. HPV-Genotypisierung + Biomarker**

- Identifier: `OBI` BL26-100777-E0010
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: HPV-Genotyp 52 (High-Risk) und 6 (Low-Risk) nachweisbar; p16/Ki-67 negativ, L1 positiv (guenstige Prognose).
- Hinweis: L1-Kapsidprotein positiv: produktive, ausheilende Infektion.
- Hinweis: DRG: Ohne DRG-Relevanz.

**13. Urinzytologie**

- Identifier: `OBI` BL26-100777-E0011
- Freigegeben: 2026-09-12T14:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Zellmaterial nicht verwertbar (zu geringe Zellzahl).
- Hinweis: Zellmaterial nicht verwertbar (zu geringe Zellzahl).
- Hinweis: Sammelurin ist fuer Zytologie ungeeignet; Spontanurin empfohlen. Kein pathologischer Hintergrund.
- Hinweis: Hinweis zu Urinzytologie: Probenmaterial fuer Urinzytologie nicht verwendbar; Wiederholung nur bei Bedarf.
- Hinweis: DRG: Ohne DRG-Relevanz.

**14. Blutgruppe (AB0/RhD)**

- Identifier: `OBI` BL26-100777-E0012-ABO
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Rhesusformel ccddee, Kell negativ (K-), Cw negativ
- Hinweis: HLA-A*02:01, A*24:02; B*07:02, B*44:02; DRB1*15:01, *04:01
- Hinweis: Blutgruppe aus zwei unabhaengigen Proben (ED01, SE01) bestaetigt. HLA-Typisierung im Auftragslabor (DKMS).
- Hinweis: Hinweis zu Blutgruppenzugehoerigkeit: RhD negativ: Anti-D-Prophylaxe (300 ug) in SSW 28 durchfuehren; AKS-Kontrolle vorher. (Termin 2026-09-21: Anti-D-Prophylaxe SSW 28)
- Hinweis: Test-ID: T-BG-AKS-HLA

**15. Antikoerpersuchtest**

- Identifier: `OBI` BL26-100777-E0012-AKS
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Keine irregulaeren erythrozytaeren Antikoerper nachweisbar
- Hinweis: HLA-/HPA-/HNA-Antikoerper nicht nachweisbar

**16. Direkter Coombstest**

- Identifier: `OBI` BL26-100777-E0012-DCT
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller

**17. Kreuzproben**

- Identifier: `OBI` BL26-100777-E0012-KP
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Nachweis Hauptantigene/NHP: kein Nachweis
- Hinweis: Praeparatekennung: ISBT 128
- Hinweis: Praeparatekennung: Eurocode IBLS

**18. Histologie Exzidat Naevus**

- Identifier: `OBI` BL26-100777-E0013
- Freigegeben: 2026-09-12T15:00:00+02:00
- Durchgefuehrt von: Dr. Richard Mueller, Labor Mueller
- Hinweis: Makroskopie: Hautspindel 12 x 8 x 3 mm mit zentraler, hellbrauner, scharf begrenzter Laesion 6 x 4 mm.
- Hinweis: Mikroskopie: Nester regelrechter Melanozyten an der dermo-epidermalen Junktion und in der oberen Dermis, Ausreifung zur Tiefe, keine Atypien, keine Mitosen.
- Hinweis: Diagnose: Benigner melanozytaerer Compound-Naevus, vollstaendig exzidiert (R0). Kein Anhalt fuer Malignitaet.
- Hinweis: Fachgebiet Pathologie; Zweitbefundung nicht erforderlich.
- Hinweis: DRG: Ohne DRG-Relevanz.

## Weitere Beobachtungen

| Beobachtung | Code | Wert | Bewertung | Zeitpunkt | Status | Profil |
|---|---|---|---|---|---|---|
| Delivery date Estimated from last menstrual period | `LOINC#11779-6` | 2026-12-14 |  | 2026-09-12 | final | ISiKSchwangerschaftErwarteterEntbindungstermin |
| Pregnancy status | `LOINC#82810-3` | Pregnant (`LOINC#LA15173-0`) |  | 2026-09-12 | final | ISiKSchwangerschaftsstatus |
| Koerpergroesse | `LOINC#8302-2` | 168 cm |  | 2026-09-10T08:05:00+02:00 | final | vitalsigns |
| Koerpergewicht | `LOINC#29463-7` | 66.5 kg |  | 2026-09-10T08:06:00+02:00 | final | vitalsigns |

**Pregnancy status**

- Umfasst: Delivery date Estimated from last menstrual period
- Hinweis: Schwangerschaftsdauer in Tagen: 263
- Hinweis: Erster Tag der letzten Periode: 2026-03-09

## Medikation

| Ressource | Medikament | Status | Zeitraum | Dosierung | Erfasst | Hinweise |
|---|---|---|---|---|---|---|
| MedicationStatement | Folsaeure-ratiopharm 5 mg (`PZN#1953843`, `ATC#B03BB01`) | active | 2026-03-01 – 2026-12-14 | Tabletten, 1 x taeglich 1 Tablette morgens | 2026-09-12 | Praekonzeptionell begonnen; Einnahme bis zur Geburt geplant. |

## Anhaenge (DocumentReference)

| Beschreibung | Dokumenttyp | Inhalt | Datum | Status |
|---|---|---|---|---|
| Laborbefund als PDF (eingebettet) |  | application/pdf · eingebettet, 404 Bytes | 2026-09-12T14:00:00+02:00 | current |
| Fremdbefund HLA-Typisierung (Auftragslabor DKMS) |  | HLA_Typisierung_DKMS.pdf · application/pdf · nur Verweis, kein Inhalt | 2026-09-12T14:00:00+02:00 | current |
| Faksimile der Unterschrift des Befunderstellers |  | Unterschrift_Mueller.png · image/png · nur Verweis, kein Inhalt | 2026-09-12T14:00:00+02:00 | current |
| Mutterpass Seite 5 (Vorsorgeuntersuchungen) |  | Mutterpass_S05_Wohlauf.pdf · application/pdf · nur Verweis, kein Inhalt | 2026-09-12T14:00:00+02:00 | current |

## Abschnitte der Composition (Narrative)

Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.

**Laborbefund BL26-100777 vom 2026-09-12**

Patient: Dr. Salome Vita Freifrau von Wohlauf; Einsender: Dr. med. Heribert Topp-Gluecklich; Labor: Dr. Richard Mueller

### Laborergebnisse (`LOINC#26436-6`)

19 verknuepfte Ressource(n)

| Untersuchung | Ergebnis | Einheit | Bewertung | Referenzbereich |
|---|---|---|---|---|
| Hemoglobin [Mass/volume] in Blood | 12.4 | g/dl | N | Referenzbereich 2. Trimenon;  - |
| Bilirubin gesamt | 1.6 | mg/dl | H | - 1.2 |
| 25-OH-Vitamin D | 38 | ng/ml | N | 30 - 100 |
| Ethanol im Serum | <0.10 | g/l | N | Nachweisgrenze 0.10 g/l |
| Blei im Trinkwasser | 1.2 | ug/l | N | Grenzwert TrinkwV 5 ug/l |
| B-Streptokokken-Screening mit Antibiogramm | Streptococcus agalactiae (Gruppe B) |  |  |  |
| Antibiogramm | Penicillin G: S (MHK 0.06 mg/l); Ampicillin: S (MHK 0.12 mg/l); Cefazolin: S (MHK 0.25 mg/l); Clindamycin: S (MHK 0.06 mg/l); Erythromycin: R (MHK 8 mg/l); Vancomycin: S (MHK 0.5 mg/l) |  |  |  |
| SARS-CoV-2-PCR | SARS-CoV-2 RNA |  |  |  |
| Blutalkoholkonzentration | 0.00 | Promille |  |  |
| Zervixzytologie Duennschicht | Gruppe II-a: unauffaelliger Befund bei auffaelliger Anamnese (HPV-HR 2023 positiv). Schwangerschaftsbedingte Veraenderungen (Navikularzellen), kein Anhalt fuer |  | N |  |
| HPV-High-Risk-Test (14 Typen) | HPV-HR positiv (Typ 52), HPV 16/18 negativ. Persistenz aus 2023; Zytologie unauffaellig - kein Anhalt fuer Erkrankung. Kontrolle gemaess oKFE-RL. |  | A |  |
| HPV-Genotypisierung + Biomarker | HPV-Genotyp 52 (High-Risk) und 6 (Low-Risk) nachweisbar; p16/Ki-67 negativ, L1 positiv (guenstige Prognose). |  | N |  |
| Urinzytologie | Zellmaterial nicht verwertbar (zu geringe Zellzahl). |  | N |  |
| Blutgruppe | A RhD- |  |  | Rhesusformel ccddee, Kell negativ (K-), Cw negativ |
| Antikoerpersuchtest | Not detected |  |  |  |
| Direkter Coombstest | Not detected |  |  |  |
| Kreuzproben | Type & Screen negativ, keine Kreuzprobe erforderlich; Erythrozytenkonzentrate im Bedarfsfall: A RhD neg, K neg |  |  |  |
| Histologie Exzidat Naevus | Makroskopie: Hautspindel 12 x 8 x 3 mm mit zentraler, hellbrauner, scharf begrenzter Laesion 6 x 4 mm. Mikroskopie: Nester regelrechter Melanozyten an der dermo |  | N |  |

**Beurteilung:** Gesunde Schwangere (26+3 SSW). Alle Befunde ohne Krankheitswert. Empfehlungen: Anti-D-Prophylaxe SSW 28; GBS-Prophylaxe unter der Geburt vermerken; Ko-Test Zytologie/HPV in 12 Monaten; Hautkrebs-Screening in 2 Jahren. Zusammenfassung: Blutbild, Vitamin D, Blutgruppe/AKS, Zytologie, Histologie, SARS-CoV-2-PCR und Ethanol unauffaellig; Bilirubin leicht erhoeht bei bekanntem M. Meulengracht (harmlos); GBS-Besiedlung ohne Krankheitswert; HPV-HR-Nachweis ohne Zellveraenderung. Katze Minka: Toxoplasma-PCR im Kot negativ (separater Bericht).

### Diagnosen / Veranlassungsgrund

12 verknuepfte Ressource(n)

- Z34 Ueberwachung einer normalen Erstschwangerschaft, 26+3 SSW
- E80.4 Bekannter M. Meulengracht (harmlose Hyperbilirubinaemie)
- Z00.0 Aerztliche Allgemeinuntersuchung (Check-up), gesund
- Z01.4 Gynaekologische Krebsfrueherkennung (Zervix)
- D22.6 Melanozytaerer Naevus Unterarm links, exzidiert 08.09.2026
- Z02 Abstinenznachweis Alkohol (freiwillig, Fahreignung)
-  Umgebungsuntersuchung: Hauskatze und Trinkwasser (Altbau)
- Z71 Vitamin-D-Versorgung in der Schwangerschaft (HzV)
- Z36 B-Streptokokken-Screening 26. SSW (IGeL)
- Z52.3 HLA-Typisierung Stammzellspender-Registrierung (DKMS)
- Z20.8 Bestaetigungs-PCR nach pos. Antigentest, beschwerdefrei
- Z00.0 Vorsorge-Laborprofil (Laborgemeinschaft)

### Probenmaterial

8 verknuepfte Ressource(n): Auftrag A2026-0777, L26-100777, NF-2026-0777-01, ED01 (EDTA-Blut), SE01 (Serum), UR01 (Sammelurin), AB01 (Zervixabstrich), AB02 (Vaginal-Rektalabstrich), GW01 (Gewebe), TW01 (Trinkwasser)

- ED01: EDTA-Blut (2026-09-10T08:15:00+02:00)
- SE01: Serum (2026-09-10T08:15:00+02:00)
- UR01: Sammelurin (2026-09-10T08:15:00+02:00)
- AB01: Zervixabstrich (2026-09-10T08:15:00+02:00)
- AB02: Vaginal-Rektalabstrich (2026-09-10T08:15:00+02:00)
- GW01: Gewebe (2026-09-10T08:15:00+02:00)
- TW01: Trinkwasser (2026-09-10T08:15:00+02:00)

### Hinweise

0 verknuepfte Ressource(n)

- Hinweis zu Bilirubin gesamt: Auffaelliger Wert ohne Krankheitswert: bekannter M. Meulengracht laut Auftrag.
- Hinweis zu B-Streptokokken-Screening mit Antibiogramm: Wiedervorstellung: Ergebnis in den Mutterpass uebernehmen (Geburtsplanung). (Termin 2026-12-14: Geburtstermin: GBS-Prophylaxe)
- Hinweis zu HPV-High-Risk-Test (14 Typen): HPV-HR positiv (Non-16/18) bei unauffaelliger Zytologie: Ko-Test in 12 Monaten. (Termin 2027-09-10: Ko-Test Zytologie + HPV)
- Hinweis zu Urinzytologie: Probenmaterial fuer Urinzytologie nicht verwendbar; Wiederholung nur bei Bedarf.
- Hinweis zu Blutgruppenzugehoerigkeit: RhD negativ: Anti-D-Prophylaxe (300 ug) in SSW 28 durchfuehren; AKS-Kontrolle vorher. (Termin 2026-09-21: Anti-D-Prophylaxe SSW 28)
- Hinweis zu Tumor: Benigner Befund. Hautkrebs-Screening turnusgemaess in 2 Jahren empfohlen. (Termin 2028-09-10: Hautkrebs-Screening)
- Hinweis zu Befund: Wiedervorstellung zur Anti-D-Prophylaxe in SSW 28. Meldung nach KFRG: Krebsfrueherkennungsdaten (Muster 39) an die zentrale Stelle uebermittelt - Befund unauffaellig. (Termin 2026-09-21: Anti-D-Prophylaxe)
- Tumor: Melanozytaerer Naevus, Compound-Typ, benigne (ICD-O 8760/0), Grading G0, Diagnosejahr 2026, Lokalisation Haut Unterarm links, volar; Laesion 6 x 4 mm, Exzidat 12 x 8 x 3 mm, hellbraun, homogen; Infiltration keine (auf Epidermis/obere Dermis beschraenkt); Exzision und Eingang 2026-09-08; kein DRG-Bezug (ambulante Exzision); vollstaendig im Gesunden exzidiert, kein Anhalt fuer Malignitaet (Probe GW01).

### Weitere Angaben

5 verknuepfte Ressource(n): Pregnancy status, Delivery date Estimated from last menstrual period, Koerpergroesse, Koerpergewicht, MedicationStatement/84f1d82e

- Schwangerschaftsstatus: schwanger, ET 2026-12-14
- Koerpergroesse: 168 cm
- Koerpergewicht: 66.5 kg
- Medikation: Folsaeure-ratiopharm 5 mg - Tabletten, 1 x taeglich 1 Tablette morgens

### Anhaenge

4 verknuepfte Ressource(n): Laborbefund als PDF (eingebettet), Fremdbefund HLA-Typisierung (Auftragslabor DKMS), Faksimile der Unterschrift des Befunderstellers, Mutterpass Seite 5 (Vorsorgeuntersuchungen)

- anh-bericht-17 - Laborbefund als PDF (eingebettet)
- HLA_Typisierung_DKMS.pdf - Fremdbefund HLA-Typisierung (Auftragslabor DKMS)
- Unterschrift_Mueller.png - Faksimile der Unterschrift des Befunderstellers
- Mutterpass_S05_Wohlauf.pdf - Mutterpass Seite 5 (Vorsorgeuntersuchungen)

---
_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._
