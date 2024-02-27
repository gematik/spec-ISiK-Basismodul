# Decision Log

Version Technical Correction 3.0.4

* Problem: In der [Extension Abrechnungsart](http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur) ist eine eindeutige Zuweisung zwischen Use und Referenz nicht möglich aufgrund der Kardinalität von Use - (vergleiche ANFISK-206)
  * Option zur Lösung:
    * Die Extension sollte in ISiK auf 0..* gesetzt werden
    * In den Basisprofilen sollte die Extension angepasst werden, sodass Use auf 0..1 gesetzt wird
    * ggf. erneute Prüfung der Codes unter "Use" prüfen

----
Version: Technical Correction 3.0.2

Datum: 11.12.2023

* Problem: Das Datenobjekt RelatedPerson sollte einen optionalen Suchparameter enthalten für .address, da das Element ein MS-Flag besitzt.
  * Option A: Hinzufügen optionaler Suchparameter für die UCs:
    * Suchabfragen von Angehörigen mit Hilfe der Adresse
    * Suchabfragen von Angehörigen mit Hilfe der Adresse unter Angabe der Stadt
    * Suchabfragen von Angehörigen mit Hilfe der Adresse unter Angabe des Ländercodes
    * Suchabfragen von Angehörigen mit Hilfe der Adresse unter Angabe der Postleihzahl
  * Option B (ggf. mit Nennung der Risiken): Keine Änderung. 
    * Risiko: könnte ggf. zu Abweichung bei den oben gelisteten Abfragen führen, bei Implementierung abweichender Custom-Suchparameter.
  * Entscheidung: Option A - umgesetzt hier: Add new optional SearchParameter for RelatedPerson.address - https://github.com/gematik/spec-ISiK-Basismodul/pull/345/commits/beca71aaae70538f52f934a072928e93d23fd6fd

  ----

Version: 3.0.1

Datum: 05.12.2023

* Problem: SNOMED Code (103693007|Diagnostic procedure) zur Codierung einer Prozeduren-Kategorie wurde zurückgezogen.
  * Option A (ggf. mit Nennung der Risiken): Der obsolete Code wird ersetzt (165197003|Diagnostic assessment), um zu verhindern, dass Terminologieserver diesen nicht verarbeiten können.
    * Risiko: Ein Breaking Change wird eingeführt.
  * Option B (ggf. mit Nennung der Risiken): Der obsolete Code wird nicht angepasst, um einen Breaking Change zu vermeiden, mit dem Risiko, dass Terminologieserver diesen nicht verarbeiten können.
  * Entscheidung: Option A - umgesetzt hier: obsoleter SNOMED Code ersetzt: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/d72f3a08a41b999074b4f33db299d5d71cd04be9


