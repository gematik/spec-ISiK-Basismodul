---
topic: markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen-Performance
---

### Performance-Aspekte

Für alle REST-Endpunkte MUSS die Performance - bei Antwortzeiten, Lasten, Durchsatz und Skalierbarkeit - so ausgelegt sein, dass die typischen Arbeitsabläufe der jeweiligen Nutzerrolle (z.B. Arzt, Pflege, Verwaltung) ohne wahrnehmbare Verzögerung durchgeführt werden können. Insbesondere dürfen für klinisch kritische Funktionen keine Wartezeiten entstehen, die eine zeitgerechte Patientenversorgung beeinträchtigen.

Daher werden Systemfunktionen entlang der in ISiK definierten Rollen in Performance-Kategorien eingeteilt.  
Für diese Performance-Kategorien werden im Test-System des Zertifizierungsverfahrens angemessene Performance-Anforderungen (z.B. Perzentile der Antwortzeiten) dokumentiert und implementiert.


#### Performance-Kategorien

Die Performance-Kategorien sind:

- P1) `hochkritisch`
- P2) `klinisch`
- P3) `administrativ`

Konkrete Zielwerte (Antwortzeiten, Lasten, Durchsatz etc.) werden rollen- und szenario-basiert in der Test-Dokumentation definiert. Für die Performance-Kategorien gilt:

**P1 – hochkritisch (`hochkritisch`)**  
Als hochkritisch gelten REST-Endpunkte und Endpunktgruppen,  
- die von klinischen Rollen (z.B. Ärztinnen/Ärzte, Pflegekräfte, Notaufnahmepersonal, Intensivpflege) in unmittelbar behandlungsrelevanten, zeitkritischen Situationen genutzt werden und  
- deren verzögerte Bereitstellung die sichere und zeitgerechte Versorgung der Patientinnen und Patienten beeinträchtigen kann.  

Hierunter fallen insbesondere:  
- Abfragen zu einzelnen Patienten-Instanzen (z.B. `GET /Patient/{id}`) mit aktuellen, für die Behandlung relevanten Informationen (Stammdaten, Alerts),  
- Abfragen zu einzelnen Fallkontakt-/Encounter-Instanzen (z.B. `GET /Encounter/{id}`) mit aktuellen Statusinformationen,  

Für P1-Endpunkte sind sehr kurze Antwortzeiten ohne wahrnehmbare Verzögerung anzustreben. 

**P2 – klinisch (`klinisch`)**  
Als klinisch gelten REST-Endpunkte und Endpunktgruppen, 
- die in der unmittelbaren Behandlung und Dokumentation verwendet werden,  
- deren verzögerte Bereitstellung typischerweise keine sofortige Gefährdung der Patientensicherheit bewirkt, jedoch Arbeitsabläufe im klinischen Alltag merklich beeinträchtigen kann.  

Hierunter fallen insbesondere:  
- für die Behandlung relevante Informationen (Vitalparameter, Anordnungen, Ergebnisse, Diagnosen, Allergien, Medikation, Alerts),
- Listen- und Übersichtsabfragen (z.B. Patientenlisten, Falllisten, Aufgaben- und Worklisten, Befundübersichten),  
- Abfragen klinischer Verlaufsdokumentation (z.B. Kurven, Verlaufsnotizen, Pflegeberichte),  
- Planungs- und Organisationsinformationen mit Bezug zu Patienten (z.B. Terminpläne, Belegungspläne, OP- und Untersuchungsplanung),  
- Schreiboperationen, die nicht in der akuten Entscheidungssituation, sondern zeitnah im Verlauf erforderlich sind (z.B. Nachdokumentation).  

Für P2-Endpunkte sind zügige Antwortzeiten erforderlich; kurze Verzögerungen sind akzeptabel, wenn sie den klinischen Workflow nicht wesentlich stören. 

**P3 – administrativ (`administrativ`)**  
Als administrativ gelten REST-Endpunkte und Endpunktgruppen,  
- die überwiegend für Verwaltung, Abrechnung, Controlling, Stammdatenpflege, Reporting oder technische Administration genutzt werden und  
- deren Bearbeitungsdauer keine unmittelbaren Auswirkungen auf die laufende Patientenversorgung hat.  

Hierunter fallen insbesondere:  
- Abfragen und Operationen zur Stammdatenpflege ohne unmittelbaren Behandlungskontext,  
- Reporting- und Statistik-Endpunkte (inkl. Aggregationen und Auswertungen mit großen Datenmengen),  
- Import-/Export- sowie andere Batch-orientierte oder langlaufende Operationen,  
- technische Administrations- und Konfigurations-Endpunkte.  

Für P3-Endpunkte sind längere Antwortzeiten grundsätzlich tolerierbar; bei zu erwartenden längeren Laufzeiten sind asynchrone Verfahren möglich.

#### Rollen und Performance der Basis

Zuordnung von Performance-Kategorien zu bestehenden Rollen für den Akteur [Basis-Server](https://simplifier.net/resolve?&scope=package:de.gematik.isik@5.1.1&canonical=https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementBasisServerAkteur):

- **Rolle:** `ISiKCapabilityStatementStammdatenRolle` → **hochkritisch**  
  *Begründung:* Stammdaten (z.B. Identität, Patientenbasisdaten) sind für jede klinische Aktion grundlegend; Verzögerungen wirken sich unmittelbar auf alle nachfolgenden hochkritischen Interaktionen aus.

- **Rolle:** `ISiKCapabilityStatementAufbaustrukturRolle` → **klinisch**  
  *Begründung:* Die Aufbaustruktur dient der klinischen Dokumentation und Navigation, ist behandlungsnah, aber nicht in jeder Situation unmittelbar lebensentscheidend.

  - **Rolle:** `ISiKCapabilityStatementGesundheitsstatusRolle` → **klinisch**  
  *Begründung:* Informationen zum Gesundheitsstatus fließen in klinische Entscheidungen ein, sind behandlungsrelevant, müssen aber nicht in jeder Situation unter strengsten Latenzanforderungen bereitstehen.

- **Rolle:** `ISiKCapabilityStatementKlinischeRolle` → **klinisch**  
  *Begründung:* Diese Rolle steht direkt für die Nutzung klinischer Inhalte im Versorgungskontext und erfordert daher zügige, aber nicht zwingend maximal priorisierte Antwortzeiten.

- **Rolle:** `ISiKCapabilityStatementLeistungserbringerRolle` → **klinisch**  
  *Begründung:* Informationen über Leistungserbringer unterstützen den klinischen Behandlungsprozess (Zuständigkeiten, Zuordnung), sind klinisch relevant, aber nicht akut lebensentscheidend.

- **Rolle:** `ISiKCapabilityStatementTerminologieRolle` → **klinisch**  
  *Begründung:* Terminologieservices (z.B. Codes, Kataloge) werden in klinischen Workflows zur sicheren Dokumentation und Interpretation verwendet und sollten zügig, aber nicht zwingend höchstprioritär reagieren.

- **Rolle:** `ISiKCapabilityStatementCompositionKonsumentenRolle` → **administrativ**  
  *Begründung:* Die konsumierende Nutzung von Composition-Ressourcen ist typischerweise für Dokumentation, Auswertung und Sekundärnutzung relevant und nicht unmittelbar zeitkritisch für die akute Behandlung.

- **Rolle:** `ISiKCapabilityStatementErweiterteStammdatenRolle` → **administrativ**  
  *Begründung:* Erweiterte Stammdaten werden primär für Verwaltung, Strukturierung und Kontextinformationen genutzt und sind daher vorwiegend administrativ geprägt.

- **Rolle:** `ISiKCapabilityStatementVersicherungsverhaeltnisRolle` → **administrativ**  
  *Begründung:* Versicherungsverhältnisse betreffen primär Abrechnung, Kostenträgerzuordnung und Verwaltung und sind damit klar administrativ einzuordnen.

#### Rollen für weitere Akteure

Die Zuordnung von Performance-Kategorien zu anderen Rollen spezifischer Akteure erfolgt in den entsprechenden Implementierungsleitfäden.

