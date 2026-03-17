
### Akteure
Alle bestätigungsrelevanten Systeme für dieses Modul nehmen die Rolle des Servers im Sinne eines patientenführenden Systems ein (eine Vitalparameter und Stammdaten exponierende Rolle), an das ein Client Suchabfragen richten und (bei erfolgter Autorisierung) Schreiboperationen durchführen kann

In Bezug auf den Lesenden Zugriff gilt daher: Alle bestätigungsrelevanten Systeme in diesem Modul MÜSSEN nach QEDm die Rolle der *Data Source* einnehmen können (für mehr Informationen siehe [Basismodul - Abschnitt QEDm](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/KompatibilitaetDerGematikSpezifikation_IHE.html)).


### Festlegungen zu lesendem Zugriff

Es gelten die Festlegungen für Observations des [Basismoduls](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/StructureDefinition-ISiKLebensZustand.html#LebensZustand-Interaktionen)