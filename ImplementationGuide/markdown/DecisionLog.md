# Decision Log

----
Version: 3.0.1

Datum: 05.12.2023

* Problem: SNOMED Code (103693007|Diagnostic procedure) zur Codierung einer Prozeduren-Kategorie wurde zurückgezogen.
  * Option A (ggf. mit Nennung der Risiken): Der obsolete Code wird ersetzt (165197003|Diagnostic assessment), um zu verhindern, dass Terminologieserver diesen nicht verarbeiten können.
  * Option B (ggf. mit Nennung der Risiken): Der obsolete Code wird nicht angepasst, mit dem Risiko, dass Terminologieserver diesen nicht verarbeiten können.
  * Entscheidung: Option A - umgesetzt hier: obsoleter SNOMED Code ersetzt: https://github.com/gematik/spec-ISiK-Basismodul/pull/322/commits/d72f3a08a41b999074b4f33db299d5d71cd04be9

