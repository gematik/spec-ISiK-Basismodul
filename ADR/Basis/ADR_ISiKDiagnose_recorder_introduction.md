# ADR: Einführung von Must-Support auf `recorder` und `asserter` (inkl. `reference` und `display`) im Profil ISiKDiagnose

Datum: 2026-11-12  

Status: Angenommen  

Ticket: PTDATA-2424

## Kontext

Im Profil ISiKDiagnose (Condition) war bisher kein Element zur Angabe der Person vorgesehen, die eine Diagnose festgestellt oder dokumentiert hat. Für die Nachvollziehbarkeit einer Diagnose (fachliche Rückfragen, Verantwortungskette, Qualitätssicherung) ist diese Information jedoch relevant. Daher soll in Stufe 6 gefordert werden, dass bestätigungsrelevante Systeme diese Information mitgeben können.

Die FHIR-R4-Condition-Ressource bietet dafür zwei Elemente:

- `Condition.recorder` – Reference(Practitioner | PractitionerRole | Patient | RelatedPerson): Person, die die Diagnose **dokumentiert** hat.
- `Condition.asserter` – Reference(Practitioner | PractitionerRole | Patient | RelatedPerson): Person, die die Diagnose **festgestellt bzw. angegeben** hat und damit fachlich für sie verantwortlich ist.

Beide Rollen können auseinanderfallen, z. B. wenn eine Ärztin eine Diagnose stellt und eine Pflegekraft oder ein Schreibdienst sie dokumentiert, oder wenn eine Diagnose vom Patienten selbst oder von Angehörigen berichtet (anamnestische Diagnose) und von Klinikpersonal erfasst wird.

Als Orientierung wurden herangezogen:

- das Profil [TI Condition Diagnosis](https://gemspec.gematik.de/ig/fhir/ti/1.5.0-ballot.2/de/StructureDefinition-ti-condition-diagnosis.html) (`https://gematik.de/fhir/ti/StructureDefinition/ti-condition-diagnosis`, Version 1.5.0-ballot.2): Dort sind `recorder.reference` und `recorder.display` als Must-Support gekennzeichnet; `asserter` ist nicht als Must-Support gekennzeichnet.
- das ISiK-Profil ISiKAllergieUnvertraeglichkeit: Dort sind sowohl `recorder` als auch `asserter` jeweils mit `reference` und `display` als Must-Support gekennzeichnet.

Diskutiert wurde außerdem, ob Must-Support nur auf `reference` gesetzt werden soll. Dagegen spricht, dass nicht in jedem Fall eine referenzierbare Ressourceninstanz der beteiligten Person im System vorliegt (z. B. wenn Personen im Primärsystem nur als Name oder Kürzel geführt werden oder bei berichtenden Angehörigen). In diesen Fällen bietet `display` eine Möglichkeit, die Person bzw. Herkunft der Diagnose zumindest textuell anzugeben.

## Optionen

### Option 1: Must-Support nur auf `recorder.reference`
Die dokumentierende Person wird ausschließlich per Referenz angegeben.  
**Pro:** Strukturierte, maschinell auswertbare Angabe; klare Anforderung an Server.  
**Contra:** Liegt keine referenzierbare Instanz vor, kann die Information nicht übermittelt werden; die fachlich verantwortliche (feststellende) Person ist nicht abbildbar.  
**Verworfen.**

### Option 2: Must-Support auf `recorder`, `recorder.reference` und `recorder.display` (analog TI Common)
Die dokumentierende Person kann per Referenz und/oder als Freitext angegeben werden.  
**Pro:** Abbildung auch ohne referenzierbare Instanz möglich; Harmonisierung mit TI Common.  
**Contra:** `recorder` bildet nur die dokumentierende, nicht die feststellende Person ab. Die eigentliche Anforderung – Angabe der für die Diagnosestellung verantwortlichen Person – wird damit nicht präzise erfüllt. Insbesondere bei von Patienten oder Angehörigen berichteten Diagnosen ist die berichtende Person in FHIR als `asserter` vorgesehen.  
**Verworfen.**

### Option 3 (gewählt): Must-Support auf `recorder` und `asserter`, jeweils inkl. `reference` und `display` (analog ISiKAllergieUnvertraeglichkeit)
Sowohl die dokumentierende als auch die feststellende Person können jeweils per Referenz und/oder als Freitext angegeben werden.  
**Pro:** Fachlich präzise Unterscheidung zwischen Dokumentation und Feststellung der Diagnose; korrekte Abbildung von Diagnosen, die von Patienten oder Angehörigen berichtet werden; konsistent zu ISiKAllergieUnvertraeglichkeit und damit einheitliches Vorgehen innerhalb des Basismoduls; `recorder` bleibt kompatibel zu TI Common.  
**Contra:** Höherer Implementierungsaufwand für Hersteller; Primärsysteme unterscheiden ggf. nicht zwischen dokumentierender und feststellender Person; über TI Common hinausgehende Anforderung an `asserter`.

## Entscheidung

1. Im Profil ISiKDiagnose werden `recorder`, `recorder.reference` und `recorder.display` als Must-Support gekennzeichnet.
2. Im Profil ISiKDiagnose werden `asserter`, `asserter.reference` und `asserter.display` als Must-Support gekennzeichnet.
3. Die Profilierung erfolgt analog zu ISiKAllergieUnvertraeglichkeit, d. h. ohne Einschränkung der Kardinalität von `reference` oder `display`. Die Angabe kann per Referenz, per `display` oder mit beidem erfolgen.
4. `display` dient insbesondere dazu, die Person bzw. Herkunft einer Diagnose anzugeben, wenn keine referenzierbare Instanz vorliegt.
5. Für Systeme, die nicht zwischen dokumentierender und feststellender Person unterscheiden, wird folgender Hinweis in das Profil (Kommentar an `asserter`) aufgenommen:

   > **Hinweis für Systeme ohne Unterscheidung zwischen dokumentierender und feststellender Person:**
   > Führt ein System zu einer Diagnose nur eine Person (z. B. „Ersteller“ oder „verantwortliche Ärztin“), MUSS diese Person in `recorder` angegeben werden.
   > Die Person SOLL zusätzlich in `asserter` angegeben werden, wenn systemseitig sichergestellt ist, dass sie die Diagnose auch fachlich gestellt hat (z. B. weil nur ärztliches Personal Diagnosen erfassen oder freigeben kann).
   > Wird eine Diagnose durch eine andere Person (z. B. Kodierfachkraft, Medizinische Dokumentationsassistenz, Schreibdienst) erfasst und anschließend ärztlich freigegeben bzw. validiert, SOLL die freigebende Person in `asserter` angegeben werden; die erfassende Person wird in `recorder` angegeben.
   > Ist weder sichergestellt, dass die erfassende Person die Diagnose fachlich gestellt hat, noch eine freigebende Person bekannt, DARF `asserter` NICHT aus `recorder` abgeleitet werden.
   > Wurde eine Diagnose vom Patienten oder von Angehörigen berichtet und ist dies im System erkennbar, SOLL die berichtende Person in `asserter` angegeben werden: per Referenz auf den Patienten bzw. ISiKAngehoeriger oder, falls keine Instanz vorliegt, per `display` (z. B. „Angabe der Ehefrau“).
   > Clients DÜRFEN aus dem Fehlen von `asserter` NICHT schließen, dass die in `recorder` angegebene Person die Diagnose gestellt hat.

6. **Offener Punkt – Herstellerabfrage zu `asserter`:** In der Praxis werden Diagnosen in Krankenhäusern häufig nicht von der feststellenden Ärztin bzw. dem feststellenden Arzt erfasst, sondern z. B. von Kodierfachkräften für die DRG-Abrechnung, teils erst nach der Entlassung auf Grundlage des Arztbriefs. Es ist derzeit nicht bekannt, ob und wie bestätigungsrelevante Systeme die feststellende oder freigebende Person an der Diagnose strukturiert führen. Dies wird bei den Herstellern abgefragt (z. B. im Rahmen der Kommentierung). Ergibt die Abfrage, dass diese Information überwiegend nicht strukturiert vorliegt, wird für `asserter` eine Einschränkung der übergreifenden MS-Definition analog zu `clinicalStatus` ergänzt:

   > **Einschränkung der übergreifenden MS-Definition:** Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung der Person, die die Diagnose festgestellt hat, so MUSS dieses System die Information NICHT abbilden. Das System MUSS jedoch `asserter` befüllen, sofern die entsprechende Information verfügbar ist.

## Konsequenzen

**Positiv:**
- Die feststellende (fachlich verantwortliche) und die dokumentierende Person einer Diagnose können getrennt übermittelt werden; das verbessert Nachvollziehbarkeit und Rückfragemöglichkeiten.
- Von Patienten oder Angehörigen berichtete Diagnosen können FHIR-konform über `asserter` gekennzeichnet werden.
- Einheitliches Vorgehen für Condition und AllergyIntolerance im Basismodul.
- `recorder` bleibt mit TI Common harmonisiert.
- Flexibilität durch Angabe per Referenz oder als Freitext.

**Negativ:**
- Server MÜSSEN beide Informationen befüllen können, sofern sie vorliegen – ggf. Nachrüstbedarf bei Herstellern.
- Clients MÜSSEN sowohl Referenzen als auch reine `display`-Angaben für beide Elemente verarbeiten und darstellen können.
- Angaben nur per `display` sind nicht strukturiert auswertbar (keine Suche, keine Verknüpfung zu Personenressourcen).
- Unterscheidet ein Primärsystem nicht zwischen dokumentierender und feststellender Person, bleibt `asserter` ggf. leer; Clients erhalten in diesem Fall nur die dokumentierende Person (siehe Hinweis in Entscheidung Punkt 5).
- Die Anforderung an `asserter` geht über TI Common hinaus.
- Bis zum Ergebnis der Herstellerabfrage (Entscheidung Punkt 6) ist offen, ob `asserter` mit regulärem oder eingeschränktem Must-Support gefordert wird; dies wirkt sich auf die Testfälle im Bestätigungsverfahren aus.

## Anhänge (optional)

- ISiKDiagnose-Profil: `Resources/input/fsh/Basis/ISiKDiagnose.fsh`
- Referenzumsetzung ISiKAllergieUnvertraeglichkeit (`recorder` und `asserter` MS): `Resources/input/fsh/Basis/ISiKAllergieUnvertraeglichkeit.fsh`
- TI Condition Diagnosis: <https://gemspec.gematik.de/ig/fhir/ti/1.5.0-ballot.2/de/StructureDefinition-ti-condition-diagnosis.html>
- FHIR R4 Condition: <https://hl7.org/fhir/R4/condition.html>
- PR: <https://github.com/gematik/spec-ISiK-Basismodul/pull/1371>
