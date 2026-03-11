Profile: FormularDatenRueckuebermittlungBundle
Parent: ISiKBerichtBundle
Id: FormularDatenRueckuebermittlungBundle
Title: "FormularDaten Rückübermittlung-Bundle"
Description: "Auf Basis des [ISiKBerichtBundle](https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle) wird hier das Bundle um die Daten der Rückübermittlung ergänzt."
* entry contains FormularDefinition 0..1 MS
* entry[FormularDefinition].resource only ISiKFormularDefinition
  * ^short = "Slice zur Hinterlegung einer ISiKFormularDefinition-Instanz"
  * ^comment = "Die ISiKFormularDefinition-Instanz enthält die Referenz auf die FormularDefinition, die der Rückübermittlung zugrunde liegt. Sie ist optional, da es auch möglich ist, dass die FormularDefinition nicht übermittelt wird, sondern bereits im Zielsystem vorhanden, bzw. im Zugriff ist."
* entry contains FormularDaten 1..1 MS
* entry[FormularDaten].resource only ISiKFormularDaten
  * ^short = "Slice zur Hinterlegung einer ISiKFormularDaten-Instanz"
  * ^comment = "Die ISiKFormularDaten-Instanz enthält das ausgefüllte Questionnaire in Form einer QuestionnaireResponse."
* entry contains FormularDatenExtrakt ..* MS
* entry[FormularDatenExtrakt].resource
  * ^short = "Slice zur Hinterlegung von ISiKFormularDatenExtrakt-Instanzen"
  * ^comment = "Die ISiKFormularDatenExtrakt-Instanzen enthalten die extrahierten Daten aus dem Formular, die zurückübermittelt werden. Es können mehrere Extrakte enthalten sein."