# Decision Log

----
Version: Technical Correction 3.0.2

Datum: 11.12.2023

* Problem: Das Datenobjekt RelatedPerson sollte einen optionalen Suchparameter enthalten für .address, da das Element ein MS-Flag besitzt.
  * Option A (ggf. mit Nennung der Risiken): Hinzufügen optionaler Suchparameter für die UCs:
    * Suchabfragen von Angehörigen mit Hilfe der Adresse
    * Suchabfragen von Angehörigen mit Hilfe der Adresse unter Angabe der Stadt
    * Suchabfragen von Angehörigen mit Hilfe der Adresse unter Angabe des Ländercodes
    * Suchabfragen von Angehörigen mit Hilfe der Adresse unter Angabe der Postleihzahl
  * Option B (ggf. mit Nennung der Risiken): Keine Änderung - könnte ggf. zu Abweichung bei den oben gelisteten Abfragen führen
  * Entscheidung: Option A - umgesetzt hier: Add new optional SearchParameter for RelatedPerson.address - https://github.com/gematik/spec-ISiK-Basismodul/pull/345/commits/beca71aaae70538f52f934a072928e93d23fd6fd

  ----

