# Interaktionen und Akteure - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Interaktionen und Akteure**

## Interaktionen und Akteure

# Interaktionen

## Akteure

Alle bestätigungsrelevanten Systeme für dieses Modul nehmen die Rolle des Servers im Sinne eines patientenführenden Systems ein (eine Vitalparameter und Stammdaten exponierende Rolle), an das ein Client Suchabfragen richten und (bei erfolgter Autorisierung) Schreiboperationen durchführen kann

In Bezug auf den Lesenden Zugriff gilt daher: Alle bestätigungsrelevanten Systeme in diesem Modul MÜSSEN nach QEDm die Rolle der **Data Source** einnehmen können (für mehr Informationen siehe [Basismodul - Abschnitt QEDm](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/KompatibilitaetDerGematikSpezifikation)).

## Festlegungen zu lesendem Zugriff

Es gelten die Festlegungen für Observations des [Basismoduls](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Lebenszustand#LebensZustand-Interaktionen)

