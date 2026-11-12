# ADR: Einführung von Must-Support auf `performer` (inkl. `actor` und `function`) im Profil ISiKProzedur

Datum: 2026-11-12  

Status: Vorgeschlagen  

Ticket: PTDATA-2424

## Kontext

Im Profil ISiKProzedur (Procedure) war bisher nicht gefordert, die Person bzw. Instanz anzugeben, die eine Prozedur durchgeführt hat. Für die Nachvollziehbarkeit einer Prozedur (fachliche Rückfragen, Verantwortungskette, Qualitätssicherung) ist diese Information jedoch relevant. Daher soll in Stufe 6 gefordert werden, dass bestätigungsrelevante Systeme diese Information mitgeben können.

Die FHIR-R4-Procedure-Ressource bildet die Durchführenden im Element `Procedure.performer` (0..*) ab:

- `performer.actor` (1..1) – Reference(Practitioner | PractitionerRole | Organization | Patient | RelatedPerson | Device): Wer die Prozedur durchgeführt hat.
- `performer.function` (0..1) – CodeableConcept: In welcher Funktion die Person beteiligt war (z. B. Operateur, Assistenz, Anästhesie).
- `performer.onBehalfOf` (0..1) – Reference(Organization): Organisation, für die der Durchführende tätig war.

Prozeduren werden häufig von mehreren Personen in unterschiedlichen Funktionen durchgeführt (z. B. Operateur, Assistenz, Anästhesie). Ohne Angabe der Funktion ist bei mehreren `performer`-Einträgen nicht erkennbar, wer welche Rolle hatte.

Zusätzlich kennt Procedure die Elemente `recorder` (dokumentierende Person) und `asserter` (Person, die angibt, dass die Prozedur stattgefunden hat). Diese sind nicht Gegenstand dieses ADR.

Für ISiKDiagnose wurde im ADR `ADR_ISiKDiagnose_recorder_introduction.md` entschieden, auf `recorder` und `asserter` jeweils `reference` und `display` als Must-Support zu setzen, damit die Angabe auch ohne referenzierbare Instanz möglich ist. Diese Überlegung trifft auf Prozeduren gleichermaßen zu, z. B. bei extern durchgeführten oder anamnestisch erhobenen Prozeduren („Z. n. Appendektomie 2005“) oder wenn das Primärsystem die durchführende Person nur als Name oder Kürzel führt.

In der TI-Common-Spezifikation (1.5.0-ballot.2) existiert kein Procedure-Profil, an dem sich orientiert werden könnte.

### Verfügbarkeit der durchführenden Person in der Praxis

Ob einer Prozedur eine einzelne durchführende Person zugeordnet werden kann, hängt stark von der Art der Prozedur ab. Die folgende Einschätzung beruht auf allgemeinem Wissen über OPS und klinische Prozesse und ist nicht systemspezifisch verifiziert; sie sollte im Rahmen einer Herstellerabfrage bestätigt werden.

| Art der Prozedur (OPS-Kapitel) | Einzelne durchführende Person verfügbar? |
|---|---|
| Operationen (5-…) | In der Regel ja. Die OP-Dokumentation erfasst das OP-Team (Operateur, Assistenz, Anästhesie) strukturiert. Hier ist auch die Angabe der Funktion (`performer.function`) besonders relevant. |
| Diagnostik und bildgebende Verfahren (1-…, 3-…) | Häufig ja, jedoch oft nur im Subsystem (z. B. RIS, Endoskopie). Ob die Person an das KIS übermittelt wird, hängt von der Schnittstelle ab. |
| Komplexbehandlungen (z. B. 8-98…: intensivmedizinische, geriatrische, palliativmedizinische Komplexbehandlung, Stroke Unit) | Nein. Die Leistung wird von einem multiprofessionellen Team über einen längeren Zeitraum erbracht. Sinnvoll ist hier allenfalls die Angabe einer Organisation (z. B. Fachabteilung). |
| Medikamentengabe und pflegerische Leistungen (6-…, 9-…) | Selten. Diese Codes werden häufig aus der Abrechnungslogik oder der Pflegedokumentation abgeleitet und ohne durchführende Person gespeichert. |
| Nachträglich kodierte Prozeduren (alle Kapitel) | Häufig nicht. Erfolgt die OPS-Kodierung durch Kodierfachkräfte oder Medizinische Dokumentationsassistenz, ggf. erst nach der Entlassung, ist im System oft nur die erfassende Person hinterlegt, nicht die durchführende. |

Für operative und viele diagnostische Prozeduren ist die durchführende Person somit in der Regel verfügbar, für einen erheblichen Teil der übrigen OPS-Codes hingegen nicht. Daraus folgt:

- Die Angabe einer Organisation (z. B. Fachabteilung) als `performer.actor` ist kein Randfall, sondern für Komplexbehandlungen der Regelfall und sollte im Profil als Hinweis beschrieben werden.
- Es ist zu prüfen, ob für `performer` eine Einschränkung der übergreifenden MS-Definition (analog `clinicalStatus` in ISiKDiagnose) erforderlich ist, damit Systeme die Information nur dann liefern MÜSSEN, wenn sie verfügbar ist.
- Die erfassende Person (z. B. Kodierfachkraft) DARF NICHT als `performer` angegeben werden; hierfür ist `Procedure.recorder` vorgesehen.

## Optionen

### Option 1: Must-Support nur auf `performer.actor.reference`
Die durchführende Instanz wird ausschließlich per Referenz angegeben.  
**Pro:** Strukturierte, maschinell auswertbare Angabe; klare Anforderung an Server.  
**Contra:** Liegt keine referenzierbare Instanz vor, kann die Information nicht übermittelt werden; bei mehreren Durchführenden ist die jeweilige Rolle nicht erkennbar.  
**Verworfen.**

### Option 2 (gewählt): Must-Support auf `performer`, `performer.function`, `performer.actor`, `performer.actor.reference` und `performer.actor.display`
Die durchführende Instanz kann per Referenz und/oder als Freitext angegeben werden; zusätzlich wird die Funktion des Durchführenden angegeben.  
**Pro:** Abbildung auch ohne referenzierbare Instanz möglich; Rollen bei mehreren Durchführenden unterscheidbar; konsistent zum Vorgehen in ISiKDiagnose und ISiKAllergieUnvertraeglichkeit.  
**Contra:** Freitextangaben sind nicht strukturiert auswertbar; Clients müssen beide Varianten verarbeiten können; Aufwand für das Mapping systeminterner Funktionen auf SNOMED CT.

### Option 3: Zusätzlich Must-Support auf `performer.onBehalfOf`
Neben der durchführenden Person wird auch die Organisation (z. B. Fachabteilung) gefordert, für die sie tätig war.  
**Pro:** Organisatorische Zuordnung auch dann möglich, wenn keine einzelne Person benannt werden kann (z. B. Komplexbehandlungen durch ein Team).  
**Contra:** Zusätzlicher Implementierungsaufwand; die organisatorische Zuordnung ist in vielen Fällen bereits über `encounter` (Fachabteilungskontakt) nachvollziehbar. Alternativ kann eine Organisation direkt als `actor` angegeben werden.  
**Vorerst verworfen**; eine erneute Bewertung ist in einer späteren Stufe möglich.

## Entscheidung

1. Im Profil ISiKProzedur werden `performer`, `performer.function` (inkl. `coding`), `performer.actor`, `performer.actor.reference` und `performer.actor.display` als Must-Support gekennzeichnet.
2. Die Kardinalität von `performer.actor.reference` wird nicht eingeschränkt (analog ISiKDiagnose). Die Angabe kann per Referenz, per `display` oder mit beidem erfolgen.
3. `performer.function` wird als Must-Support gekennzeichnet, damit bei mehreren Durchführenden deren jeweilige Rolle erkennbar ist. **Offener Punkt:** Das Binding ist noch zu klären. Aktuell ist `function` mit dem ValueSet `http://hl7.org/fhir/ValueSet/performer-role` (SNOMED CT, `preferred`) gebunden. Dieses enthält Berufsbezeichnungen (z. B. „Chirurg“), jedoch keine Funktionen innerhalb einer Prozedur (z. B. „Operateur“, „1. Assistenz“). Es ist zu prüfen, ob ein geeigneteres ValueSet existiert oder definiert werden muss.
4. `performer.actor.display` dient insbesondere dazu, die durchführende Person anzugeben, wenn keine referenzierbare Instanz vorliegt (z. B. extern oder anamnestisch erhobene Prozeduren).
5. `performer.onBehalfOf` wird vorerst **nicht** als Must-Support gekennzeichnet. Kann keine einzelne Person benannt werden, KANN eine Organisation (z. B. die Fachabteilung) als `actor` angegeben werden.

## Konsequenzen

**Positiv:**
- Die durchführenden Personen einer Prozedur und ihre jeweilige Funktion können übermittelt werden; das verbessert Nachvollziehbarkeit und Rückfragemöglichkeiten.
- Einheitliches Vorgehen für Procedure, Condition und AllergyIntolerance im Basismodul.
- Flexibilität durch Angabe per Referenz oder als Freitext.

**Negativ:**
- Server MÜSSEN die Information befüllen können, sofern sie vorliegt – ggf. Nachrüstbedarf bei Herstellern.
- Systeminterne Funktionen (z. B. „1. Operateur“, „2. Assistenz“) müssen auf SNOMED CT gemappt werden.
- Clients MÜSSEN sowohl Referenzen als auch reine `display`-Angaben verarbeiten und darstellen können.
- Angaben nur per `display` sind nicht strukturiert auswertbar (keine Suche, keine Verknüpfung zu Personenressourcen).
- Keine Harmonisierung mit TI Common möglich, da dort kein Procedure-Profil existiert.
- Für einen erheblichen Teil der Prozeduren (insb. Komplexbehandlungen, Medikamentengabe, pflegerische Leistungen, nachträglich kodierte Prozeduren) ist keine einzelne durchführende Person verfügbar (siehe Kontext). Ohne Einschränkung der MS-Definition sind entsprechende Testfälle im Bestätigungsverfahren für diese Prozeduren nicht sinnvoll erfüllbar.

## Anhänge (optional)

- ISiKProzedur-Profil: `Resources/input/fsh/Basis/ISiKProzedur.fsh`
- ADR ISiKDiagnose `recorder`/`asserter`: `ADR/Basis/ADR_ISiKDiagnose_recorder_introduction.md`
- FHIR R4 Procedure: <https://hl7.org/fhir/R4/procedure.html>
- ValueSet Performer Role: <http://hl7.org/fhir/ValueSet/performer-role>
- PR: <https://github.com/gematik/spec-ISiK-Basismodul/pull/1371>
