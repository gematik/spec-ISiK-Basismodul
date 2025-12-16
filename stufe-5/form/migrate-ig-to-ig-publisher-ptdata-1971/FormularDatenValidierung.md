# Formular Daten Validierung - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Formular Daten Validierung**

## Formular Daten Validierung

## Funktion: FormularDatenValidierung

Bei der Formulardatenvalidierung handelt es sich formal nicht um eine **Inter**aktion, da diese derzeit als eine Aktion angenommen wird, die vom eigenständig ausgeführt wird. Gemäß FHIR-Spezifikation ist die Validierung jedoch auch als ein Service mittels der $validate-Operation implementierbar.

In künftigen Ausbaustufen des ISiK-Formular-Moduls ist auch eine Einbindung [externer Validierungs-Services](https://hl7.org/fhir/R4/validation.html#op) denkbar. Daher wird diese Funktion bereits in dieser Stufe als **potentielle** Interaktion betrachtet.

Die Datenextraktion wird in dieser Stufe zunächst ausschließlich von implementiert. Hierbei ist zu beachten, dass (QuestionnaireResponse-Ressourcen) **nicht** gegen ein QuestionnaireResponse-Profil zu validieren sind, sondern gegen die zugrundeliegende (Questionnaire).

| | |
| :--- | :--- |
| ![](https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/piktogramme/Ampel%20auf%20Rot_Blau_gematik.svg) | Die Validierung von QuestionnaireResponse-Ressourcen gegen Questionnaires wird nicht von allen Validatoren unterstützt! |

Die folgenden Core und SDC Extensions sind für die Validierung in dieser Stufe relevant. Unter sind mehr Informationen dazu zu finden.

* [maxDecimalPlaces](https://hl7.org/fhir/R4/extension-maxdecimalplaces.html)
* [maxValue](https://hl7.org/fhir/R4/extension-maxvalue.html)
* [minLength](https://hl7.org/fhir/R4/extension-minlength.html)
* [minValue](https://hl7.org/fhir/R4/extension-minvalue.html)
* [regex](https://hl7.org/fhir/R4/extension-regex.html)

