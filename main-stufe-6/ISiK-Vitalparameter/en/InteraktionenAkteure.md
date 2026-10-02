# Interaktionen und Akteure - ISiK Vitalparameter Implementierungsleitfaden v6.0.0

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Interaktionen und Akteure**

## Interaktionen und Akteure

### Akteure

Alle bestätigungsrelevanten Systeme für dieses Modul nehmen die Rolle des Servers im Sinne eines patientenführenden Systems ein (eine Vitalparameter und Stammdaten exponierende Rolle), an das ein Client Suchabfragen richten und (bei erfolgter Autorisierung) Schreiboperationen durchführen kann

In Bezug auf den Lesenden Zugriff gilt daher: Alle bestätigungsrelevanten Systeme in diesem Modul MÜSSEN nach QEDm die Rolle der **Data Source** einnehmen können (für mehr Informationen siehe [Basismodul - Abschnitt QEDm](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/KompatibilitaetDerGematikSpezifikation_IHE.html)).

### Festlegungen zu lesendem Zugriff

Es gelten die Festlegungen für Observations des [Basismoduls](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/StructureDefinition-ISiKLebensZustand.html#LebensZustand-Interaktionen)

