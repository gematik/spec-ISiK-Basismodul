### Motivation

Informationen über die Kontakte des Patienten entlang seines Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil des einrichtungsinternen Datenaustausches.
Sie ermöglichen die Unterscheidung von stationären und ambulanten sowie aufgenommenen und entlassenen Patienten.
Weiterhin ist aus den Kontaktinformationen der aktuelle Aufenthaltsort des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar.
Klinische Ressourcen werden in FHIR durch Verlinkung auf die Encounter-Ressource in einen Kontext zum Einrichtungskontakt gestellt. Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen und Abrechnungsprozessen.

Am Beginn der meisten klinischen Workflows steht die Auswahl des Fallkontextes. Dies geschieht bspw. durch Suchen der Encounter-Ressource anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. Daraufhin werden die zutreffenden Suchergebnisse angezeigt und der gewünschte Einrichtungskontakt ausgewählt.

---
