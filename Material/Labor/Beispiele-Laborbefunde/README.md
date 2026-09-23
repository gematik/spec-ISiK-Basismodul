# Beispiel-Laborbefunde als ISiK-Bundles

Dieses Verzeichnis enthält 16 synthetische Laborbefunde als FHIR-R4-Document-Bundles
nach **ISiK Stufe 6** (Basismodul 6.0.0 + Labor 6.0.0, Profil `ISiKBerichtBundle`):
<https://gematik.github.io/spec-ISiK-Basismodul/main-stufe-6/ISiK-Labor/en/index.html>

Die Bundles validieren mit dem HL7 FHIR Validator ohne Fehler (siehe
[Validierung](#validierung)). Zu jedem Bundle gibt es eine Markdown-Ansicht (`*.md`),
die alle enthaltenen Ressourcen lesbar darstellt (Befund, Patient, Beteiligte,
Diagnosen, Proben, Laborergebnisse, Anhänge, Composition-Narrative), damit die
Beispiele direkt in GitHub gelesen werden können. Massgeblich ist immer die JSON-Datei.

Zweck: realistische, vollständig kodierte Beispiele für Laborbefunde, die ein
Laborsystem an ein Krankenhausinformationssystem übermittelt – als Testdaten für
Implementierungen und als Diskussionsgrundlage für die Profile des Moduls Labor.

## Inhalt

| Pfad | Inhalt |
|---|---|
| `Laborbefund_*.bundle.json` | je Befund ein Document-Bundle nach `ISiKBerichtBundle` |
| `Laborbefund_*.md` | Markdown-Ansicht des jeweiligen Bundles (generiert) |
| [`terminology/`](terminology/) | lokale `CodeSystem`s des fiktiven Labors (Untersuchungs-Codes, Antibiotika) für die Validierung |
| [`bundle2md.py`](bundle2md.py) | erzeugt die Markdown-Ansichten und die Übersichtstabelle unten (Python 3, ohne Abhängigkeiten) |
| [`validate.sh`](validate.sh) | validiert alle Bundles mit dem HL7 FHIR Validator gegen die ISiK-Profile |
| [`packages/`](packages/) | ISiK-Pakete Basismodul 6.0.0 und Labor 6.0.0 vom IG-Build main-stufe-6 (Stand 17.09.2026), gegen die validiert wurde |
| [`download_packages.sh`](download_packages.sh) | lädt die ISiK-Pakete bei Bedarf neu vom IG-Build nach `packages/` |

## Übersicht

<!-- bundle-index:start -->
| Markdown | Bundle | Titel | Patient | Diagnosen (ICD-10-GM) | Observations | Besonderheiten |
|---|---|---|---|---|---|---|
| [Laborbefund_01_I10.md](Laborbefund_01_I10.md) | [JSON](Laborbefund_01_I10.bundle.json) | Laborbefund BL26-100441 vom 2026-08-11 | Klaus Bergmann | I10.90 | 7 |  |
| [Laborbefund_02_E11.md](Laborbefund_02_E11.md) | [JSON](Laborbefund_02_E11.bundle.json) | Laborbefund BL26-100442 vom 2026-08-11 | Fatma Yilmaz | E11.90 | 5 |  |
| [Laborbefund_03_E78.md](Laborbefund_03_E78.md) | [JSON](Laborbefund_03_E78.bundle.json) | Laborbefund BL26-100443 vom 2026-08-11 | Piotr Nowak | E78.0 | 4 |  |
| [Laborbefund_04_E03.md](Laborbefund_04_E03.md) | [JSON](Laborbefund_04_E03.bundle.json) | Laborbefund BL26-100444 vom 2026-08-11 | Anna Schneider | E03.9, E04.9 | 4 |  |
| [Laborbefund_05_N39.md](Laborbefund_05_N39.md) | [JSON](Laborbefund_05_N39.bundle.json) | Laborbefund BL26-100445 vom 2026-08-12 | Elena Petrova | N39.0 | 3 |  |
| [Laborbefund_05_N39_Nachforderung_Antibiogramm.md](Laborbefund_05_N39_Nachforderung_Antibiogramm.md) | [JSON](Laborbefund_05_N39_Nachforderung_Antibiogramm.bundle.json) | Laborbefund BL26-100445-NF1 vom 2026-08-13 | Elena Petrova | N39.0 | 2 | Antibiogramm/Komponenten |
| [Laborbefund_06_D50.md](Laborbefund_06_D50.md) | [JSON](Laborbefund_06_D50.bundle.json) | Laborbefund BL26-100446 vom 2026-08-11 | Miriam Krause | D50.9 | 7 |  |
| [Laborbefund_07_N18.md](Laborbefund_07_N18.md) | [JSON](Laborbefund_07_N18.bundle.json) | Laborbefund BL26-100447 vom 2026-08-11 | Heinz Wagner | N18.3 | 6 |  |
| [Laborbefund_08_K76.md](Laborbefund_08_K76.md) | [JSON](Laborbefund_08_K76.bundle.json) | Laborbefund BL26-100448 vom 2026-08-11 | Marco Da Silva | K76.0, R74.0 | 5 |  |
| [Laborbefund_09_M10.md](Laborbefund_09_M10.md) | [JSON](Laborbefund_09_M10.bundle.json) | Laborbefund BL26-100449 vom 2026-08-11 | Murat Oezdemir | M10.99 | 3 |  |
| [Laborbefund_10_Z00.md](Laborbefund_10_Z00.md) | [JSON](Laborbefund_10_Z00.bundle.json) | Laborbefund BL26-100450 vom 2026-08-11 | Sabine Lehmann | Z00.0 | 6 |  |
| [Laborbefund_11_C58.md](Laborbefund_11_C58.md) | [JSON](Laborbefund_11_C58.bundle.json) | Laborbefund BL26-100451 vom 2026-08-13 | Julia Weber | C58, Z34 | 4 | Schwangerschaft |
| [Laborbefund_12_O72_Blutgruppe.md](Laborbefund_12_O72_Blutgruppe.md) | [JSON](Laborbefund_12_O72_Blutgruppe.bundle.json) | Laborbefund BL26-100512 vom 2026-09-10 | Katharina Nowak | O72.1, D62, Z37.0 | 13 | Blutgruppe |
| [Laborbefund_Anhang_Beispiel.md](Laborbefund_Anhang_Beispiel.md) | [JSON](Laborbefund_Anhang_Beispiel.bundle.json) | Laborbefund BL26-100499 vom 2026-08-13 | Bernd Beispiel | R70.0 | 1 | Anhang |
| [Laborbefund_S01E03_OccamsRazor.md](Laborbefund_S01E03_OccamsRazor.md) | [JSON](Laborbefund_S01E03_OccamsRazor.bundle.json) | Laborbefund BL2026-081234 vom 2026-08-12 | Brandon Merrell | R50.9, N17.9 | 13 |  |
| [Laborbefund_Vollabdeckung_Gesund.md](Laborbefund_Vollabdeckung_Gesund.md) | [JSON](Laborbefund_Vollabdeckung_Gesund.bundle.json) | Laborbefund BL26-100777 vom 2026-09-12 | Dr. Salome Vita Freifrau von Wohlauf | Z34, E80.4, Z00.0, Z01.4, D22.6, Z02, Z71, Z36, Z52.3, Z20.8, Z00.0 | 22 | Antibiogramm/Komponenten, Anhang, Medikation, Schwangerschaft, Vitalzeichen, Blutgruppe |

<!-- bundle-index:end -->

Die Befunde decken typische hausärztliche Diagnosen ab (I10, E11, E78, E03, N39, D50,
N18, K76, M10, Z00, C58, O72) sowie Sonderfälle: Nachforderung mit mikrobiologischem
Befund und Antibiogramm, Blutgruppenbestimmung mit Antikörpersuchtest und Kreuzproben,
Anhang als eingebettetes PDF und ein Befund, der möglichst viele Inhalte kombiniert
(`Vollabdeckung_Gesund`: Schwangerschaft, Körpermaße, Medikation, Zytologie, Histologie,
Umgebungsuntersuchung, mehrere Anhänge).

Alle Personen, Einrichtungen, Identifikatoren und Ergebnisse sind erfunden. Einsender
ist die Praxis Dr. Topp-Glücklich (BSNR 398212400), Labor ist das Labor Dr. Müller
(BSNR 270719100). Die Namensräume der lokalen Identifier und Codes
(`https://labor-testdaten.example/...`) sind Platzhalter. Umlaute sind in den Bundles
transliteriert (ue, ae, ss).

## Aufbau der Bundles

| FHIR-Ressource | Profil | Inhalt |
|---|---|---|
| `Bundle` (type document) | ISiKBerichtBundle | Befund-Identifier (FILL), Zeitstempel; alle Referenzen bundle-intern (`urn:uuid`) |
| `Composition` | ISiKBerichtSubSysteme | Typ KDL LB120107 Laborbefund, IHE BEFU, LOINC 11502-2; Autor und Verwahrer = Labor; Abschnitte mit generierter Narrative: Laborergebnisse, Diagnosen, Probenmaterial, Hinweise, weitere Angaben, Anhänge |
| `DiagnosticReport` | Basis-R4 | LOINC 11502-2, Kategorie LAB, Beurteilung, Verweise auf Proben und Ergebnisse, `presentedForm` für Anhänge |
| `ServiceRequest` | Basis-R4 | Auftragsnummern von Einsender (PLAC) und Labor (FILL), ggf. Nachforderung, Veranlassungsgründe |
| `Patient` | ISiKPatient | Patientennummer (MR), Versichertennummer (KVZ10), Name mit Namenszusätzen, Anschrift |
| `Practitioner` / `Organization` | ISiKPersonImGesundheitsberuf, ISiKOrganisation | Einsender (LANR, BSNR) und Labor (BSNR, IKNR, Laborleitung) |
| `Encounter` | Basis-R4 | ambulanter Kontakt; erforderlich, weil ISiKDiagnose kodierte Diagnosen an einen Encounter bindet (isik-con1) |
| `Condition` | ISiKDiagnose | ICD-10-GM mit Diagnosesicherheit und Seitenlokalisation |
| `Specimen` | Basis-R4 | Proben-ID, Materialart (SNOMED CT, sonst Text), Entnahme, Eingang, Menge, Körperstelle |
| `Observation` | ISiKLaboruntersuchung | LOINC (plus lokaler Code), UCUM-Einheit, Referenzbereiche, Bewertung, Methode als Text, Hinweise; Laborbereich als zweite Kategorie (ISiKLaborbereichVS) |
| `Observation` (Mikrobiologie) | ISiKLaboruntersuchung | Keimnachweis (SNOMED Detected/Not detected), Antibiogramm als eigene Observation (LOINC 29576-6) mit einer Komponente je Wirkstoff (ATC/lokaler Code, MHK, S/I/R) |
| `Observation` (Blutgruppe) | ISiKLaboruntersuchung | AB0/RhD (882-1), Antikörpersuchtest (890-4), direkter Coombstest (1007-4), Kreuzproben (1250-0) |
| `Observation` (Zytologie, Histologie) | ISiKLaboruntersuchung | Ergebnistext, Münchner Nomenklatur, ggf. `dataAbsentReason` und Status cancelled |
| `Observation` (Schwangerschaft) | ISiKSchwangerschaftsstatus, ISiKSchwangerschaftErwarteterEntbindungstermin | Schwangerschaftsstatus (82810-3) und errechneter Termin (11779-6) |
| `Observation` (Körpermaße) | FHIR-Vitalzeichen | Körpergröße, Körpergewicht |
| `MedicationStatement` | Basis-R4 | Medikation (PZN, ATC, Dosierung, Zeitraum) |
| `DocumentReference` | Basis-R4 | Anhänge (eingebettet als base64 oder nur als Verweis) |

## Arbeitsablauf

```bash
cd Material/Labor/Beispiele-Laborbefunde

# Markdown-Ansichten und Übersichtstabelle (neu) erzeugen
python3 bundle2md.py

# Bundles validieren (Java >= 17, Internet; lädt Validator und Pakete nach)
./validate.sh              # alle Bundles; ./validate.sh DATEI... für einzelne
```

## Validierung

`validate.sh` lädt beim ersten Aufruf den HL7 FHIR Validator 6.10.4 (`validator_cli.jar`,
ca. 190 MB, nicht im Repository) nach `.tools/`, nutzt die ISiK-Pakete aus `packages/`, holt die
übrigen Abhängigkeiten (de.basisprofil.r4 1.6.0, kbv.all.st, dvmd.kdl.r4 usw.) aus der
FHIR-Paketregistry, prüft die Codes gegen tx.fhir.org und schreibt das vollständige
Protokoll nach `validation.log`. Geprüft wird gegen `ISiKBerichtBundle`; die Profile der
enthaltenen Ressourcen werden über `meta.profile` mitgeprüft.

Die ISiK-Pakete verlangen die Abhängigkeit `kbv.all.terminology.allergyintolerance#1.0.0`,
die in keiner öffentlichen Registry verfügbar ist (Stand 09/2026). `validate.sh` legt
deshalb unter `.tools/` Kopien der Pakete ohne diese Abhängigkeit an; für Laborbefunde
wird sie nicht benötigt.

Ergebnis (Validator 6.10.4, ISiK 6.0.0 vom IG-Build main-stufe-6, 17.09.2026):

```
Datei                                                       Fehler  Warn.  Hinw.
Laborbefund_01_I10.bundle.json                                   0      9     19
Laborbefund_02_E11.bundle.json                                   0      5     21
Laborbefund_03_E78.bundle.json                                   0      4     17
Laborbefund_04_E03.bundle.json                                   0      4     18
Laborbefund_05_N39.bundle.json                                   0      3     17
Laborbefund_05_N39_Nachforderung_Antibiogramm.bundle.json        0      4     12
Laborbefund_06_D50.bundle.json                                   0      7     17
Laborbefund_07_N18.bundle.json                                   0      8     22
Laborbefund_08_K76.bundle.json                                   0      5     15
Laborbefund_09_M10.bundle.json                                   0      3     15
Laborbefund_10_Z00.bundle.json                                   0      6     18
Laborbefund_11_C58.bundle.json                                   0      3     18
Laborbefund_12_O72_Blutgruppe.bundle.json                        0     13     36
Laborbefund_Anhang_Beispiel.bundle.json                          0      1     12
Laborbefund_S01E03_OccamsRazor.bundle.json                       0     14     39
Laborbefund_Vollabdeckung_Gesund.bundle.json                     0     29     71

Gesamt: 16 Bundles, 0 Fehler, 118 Warnungen
```

Die verbleibenden Warnungen sind bekannt und nicht behebbar, ohne von den Profilen
abzuweichen:

- `identifier.type` (100): die von ISiK/Basisprofil vorgegebenen Identifier-Typen OBI,
  LANR, BSNR, KVZ10 sind nicht im R4-ValueSet IdentifierType (extensible).
- `Observation.method` (10) nur als Text, da die Nachweisverfahren nicht verlässlich
  auf das ValueSet „ISiK Labor Methode" (SNOMED CT) abbildbar sind.
- UCUM-Annotation `mL/min/{1.73_m2}` (5, eGFR), LOINC 33914-3 (2, MDRD, discouraged,
  nicht im IPS-ValueSet), CodeSystem PZN (1) ist auf tx.fhir.org nicht verfügbar.
- ICD-10-GM 2026: tx.fhir.org kennt die vierstelligen Codes Z34.0, Z02.8 und Z71.3 nicht
  (Fehler statt Warnung); `Vollabdeckung_Gesund` verwendet deshalb die Kategorien Z34,
  Z02 und Z71.
