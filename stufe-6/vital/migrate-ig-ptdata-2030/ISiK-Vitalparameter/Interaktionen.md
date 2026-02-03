# Interaktionen - ISiK Vitalparameter Implementierungsleitfaden v6.0.0-rc

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0-rc - 6.0.0-rc 

* [**Table of Contents**](toc.md)
* **Interaktionen**

## Interaktionen

# Interaktionen

## Akteure

Alle bestätigungsrelevanten Systeme für dieses Modul nehmen die Rolle des Servers ein im Sinne eines patientenführenden Systems, an das ein Client Suchabfragen richten kann und (bei erfolgter Autorisierung) Schreiboperationen vollziehen kann.

In Bezug auf den Lesenden Zugriff gilt daher: Alle bestätigungsrelevanten Systeme in diesem Modul MÜSSEN nach QEDm die Rolle der **Data Source** einnehmen können (für mehr Informationen siehe [Basismodul - Abschnitt QEDm](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/KompatibilitaetDerGematikSpezifikation)).

## Festlegungen zu lesendem Zugriff

Es gelten die Festlegungen für Observations des [Basismoduls](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Lebenszustand)

