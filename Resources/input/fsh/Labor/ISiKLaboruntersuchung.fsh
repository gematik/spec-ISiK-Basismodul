Profile: ISiKLaboruntersuchung
Parent: Observation
Id: ISiKLaboruntersuchung
Description: "Dieses Profil ermöglicht die Abbildung von Informationen zur Laboruntersuchungen eines Patienten in ISiK Szenarien. Es dient primär als Vorlage, von der spezifische Laboruntersuchungs-Profile abgeleitet werden, kann aber grundsätzlich auch zur Repräsentation von nicht weiter ausspezifizierten Laboruntersuchungen genutzt werden.

Viele medizinischen Entscheidungen benötigen Informationen zu den Laboruntersuchungen eines Patienten. Hierzu gehören z.B. aktuelle Nierenfunktionswerte, Leberwerte, Blutbildwerte oder Hormone aus Schilddrüse.
Jede dieser Untersuchungen wird durch bestimmte [[https://loinc.org/ LOINC]] oder [[http://snomed.info/sct SNOMED CT]] Codes bezeichnet. Der angegebene Wert ist durch genaue Einheitenangaben in [[http://unitsofmeasure.org UCUM]] zu konkretitiseren.
Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://gemspec.gematik.de/ig/fhir/isik/amts/6.0.0-rc/UseCases.html).

In FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert. Zugehörige Codes und Einheiten sind den entsprechenden Valuessets zu entnehmen."
* insert Meta
* insert CommonElements
* status MS
  * ^short = "Status der Laboruntersuchung"
  * ^comment = "**Begründung MS**: Der Status ist unerlässlich für die korrekte Interpretation einer Untersuchung. **WICHTIGER Hinweis für Implementierer**:  
  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, 
  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch die Werte `final` und `unknown`.
  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, 
  beispielsweise durch Ausblenden/Durchstreichen von Prozeduren mit dem status `entered-in-error` und Ausgrauen von Untersuchungen, die noch nicht stattgefunden haben, o.ä."
* category 1.. MS
  * ^short = "Kategorie der Laboruntersuchung"
  * ^comment = "**Begründung MS**: Ermöglicht das Filtern, Sortieren und Gruppieren von Befunden. Für Laboruntersuchungen ist die Kategorie zwingend mit dem entsprechenden Code (z. B. LOINC-Kategorie „laboratory“) zu befüllen."
* category = $cs-observation-category#laboratory 
* code MS
  * ^short = "Gegenstand der Untersuchung (Laborparameter)"
  * ^comment = "**Begründung MS**: Der Code identifiziert, was gemessen wurde, und ist damit das zentrale Element der Observation. Ohne .code ist kein eindeutiger sowie maschinell auswertbarer klinischer Kontext  dokumentiert."  
  * coding
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding 1.. MS
    * ^short = "Kodierung des Laborparameters"
    * system 1.. MS
      * ^short = "System, aus dem der Code für den Laborparameter stammt (z. B. LOINC)"
    * code 1.. MS
      * ^short = "Code des Laborparameters entsprechend dem verwendeten System"
    * display MS
      * ^short = "Anzeige-/Bezeichnungstext für den Laborparameter-Code"
  * text MS
  * coding contains loinc 1.. MS
  * coding[loinc] only ISiKLoincCoding
  * coding[loinc] ^patternCoding.system = $loinc
* subject only Reference(Patient)  
* subject 1.. MS
  * ^short = "Referenz auf den Patienten"
  * ^comment = "**Begründung MS**: Die Verknüpfung zur Patientin oder zum Patienten ist zwingend notwendig für jegliche klinische Verwertbarkeit."
  * reference MS
    * ^short = "Patienten-Link"
    * insert Comment-Reference-Subject(Begründung MS)
* encounter MS
  * ^short = "Referenz auf den Abteilungskontakt"
  * ^comment = "**Begründung MS**: Dient der Einordnung in den klinischen Verlauf und ermöglicht Kontextinformationen wie Aufnahmediagnose oder behandelnde Abteilung."
  * reference MS
    * insert Comment-Reference-Encounter(Begründung MS)
* effective[x] MS
  * ^short = "Zeitpunkt der Untersuchung"
  * ^comment = "**Begründung Must Support**:
Das Element effective[x] ist zentral, um die Beobachtung - insbesondere bei Laborbefunden - zeitlich korrekt einzuordnen. Es stellt sicher, dass Systeme erkennen können, wann eine Untersuchung durchgeführt oder ein Zustand beobachtet wurde. Dies ist entscheidend für:

* die klinische Relevanz des Ergebnisses (z.B. aktueller vs. älterer Befund),
* Verlaufsauswertungen und Trendanalysen,
* zeitlich abhängige Entscheidungsunterstützung,
* eine valide Anzeige im zeitlichen Kontext des Patientenaufenthalts."
* effectiveDateTime MS
* issued MS
  * ^short = "Zeitpunkt der Verfügbarkeit des Untersuchungsergebnisses"
  * ^comment = "**Begründung MS**: Relevant zur Nachvollziehbarkeit und Validierung von Befunden, z.B. wann eine Entscheidung darauf basierte."
* value[x] MS
  * ^short = "Festgestellter (Mess)Wert für den Laborparameter"
  * ^comment = "**Begründung MS**: Der gemessene Wert stellt die zentrale Aussage der Observation dar. Ohne value besitzt die Observation keine medizinische Relevanz."
* valueQuantity MS
  * ^short = "Messwert in quantitativer Form"
  * ^comment = "**Begründung MS**: Standardisierte, codierte Einheiten sind für Vergleichbarkeit, Umrechnung und automatische Plausibilisierung erforderlich."
  * value 1.. MS
    * ^short = "Der numerische Messwert"
  * unit MS
    * ^short = "Einheit des Messwertes (z. B. mg/dL)"
  * system 1.. MS
    * ^short = "Kodiersystem für die Einheit (UCUM)"
  * system = $cs-ucum
  * code 1.. MS
    * ^short = "UCUM-Code der Einheit"
* dataAbsentReason MS
  * ^short = "Angabe eines Grundes weshalb kein Ergebniss der Laboruntersuchung vorliegt"
  * ^comment = "**Begründung Must Support**:
Nicht alle geplanten oder dokumentierten Untersuchungen liefern auch tatsächlich ein Ergebnis. In solchen Fällen ist es wichtig, nicht nur auf das Fehlen eines Wertes zu reagieren, sondern den Grund strukturiert anzugeben. dataAbsentReason ermöglicht diese präzise Aussage und verhindert Fehlinterpretationen"
* interpretation MS
  * ^short = "Interpretation oder Bewertung des Messergebnisses (z.B. „hoch“, „niedrig“, „normal“)"
  * ^comment = "Begründung MS: Unterstützt die klinische Interpretation, insbesondere bei komplexen Parametern und automatisierten Auswertungen."
* note MS
  * ^short = "Freitextnotiz oder Kommentar zur Beobachtung (z. B. Hinweise des Labors)"
  * ^comment = "**Begründung MS**: Dient zur Dokumentation abweichender Umstände, Freitextbefundung oder ergänzender Laborkommentare."
* method MS
  * ^comment = "**Einschränkung der übergreifenden MS-Definition:** 
  Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung der zugrundeliegenden Methode, so MUSS dieses System
   die Information NICHT abbilden. 
   
   Motivation zum eingeschränkten MS: Die Untersuchungsmethode einer Laboruntersuchung ist eine relevante medizinische Information: Unterschiedliche Methoden können unterschiedliche Resultate liefern. Die Methode ist daher für Transparenz und Vergleichbarkeit entscheidend.
   Da diese Information aktuell häufig nicht übergeben wird, wird das MS eingeschränkt. Es ist dennoch wünschenswert, dass die Probe in der Zukunft übergeben wird."
* specimen MS
  * ^comment = "**Einschränkung der übergreifenden MS-Definition:** 
  Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung der Laboruntersuchung zugrundeliegenden Probe, so MUSS dieses System
   die Information NICHT abbilden. 
   
   Motivation zum eingeschränkten MS: Die Probe (z. B. Serum, Urin) ist zentral für die korrekte Bewertung des Ergebnisses. Die Unterscheidung von Materialtypen ist oft diagnostisch ausschlaggebend.
   Da die Information aktuell jedoch häufig nicht übergeben wird, wird das MS eingeschränkt. Es ist dennoch wünschenswert, dass die Probe in der Zukunft übergeben wird"
  * reference MS
  * identifier MS
    * system 1.. MS
    * value 1.. MS
* device MS
  * ^short = "Verwendetes Gerät oder Instrument zur Durchführung der Untersuchung"
  * ^comment = "**Begründung Must Support**:
Das verwendete Mess- oder Analysegerät kann einen entscheidenden Einfluss auf die Genauigkeit, Validität und Vergleichbarkeit von Untersuchungsergebnissen haben."
* referenceRange MS
  * ^short = "Referenzbereich zur Interpretation des Messergebnisses (z. B. Normalwerte)"
  * ^comment = "**Begründung MS**: Referenzbereiche erlauben die sofortige klinische Bewertung eines Wertes"
  * low MS
    * ^short = "Untergrenze des Referenzbereichs"
    * value 1.. MS
    * unit MS
    * system 1.. MS
    * system = $cs-ucum
    * code 1.. MS
  * high MS
    * ^short = "Obergrenze des Referenzbereichs"
    * value 1.. MS
    * unit MS
    * system 1.. MS
    * system = $cs-ucum
    * code 1.. MS
  * type MS
    * ^short = "Art des Referenzbereichs (z. B. normal, kritisch)"
    * coding MS
      * system 1.. MS
      * code 1.. MS
      * display MS
    * text MS
  * appliesTo MS
    * ^short = "Für wen der Referenzbereich gilt (z. B. Geschlecht, Alter)"
    * coding MS
      * ^short = "Kodierte Angabe zur Zielgruppe"
      * system 1.. MS
      * code 1.. MS
      * display MS
    * text MS
  * age MS
    * ^short = "Altersbereich, für den der Referenzbereich gilt"
    * low MS
    * high MS
  * text MS
    * ^short = "Freitextbeschreibung des Referenzbereichs"
