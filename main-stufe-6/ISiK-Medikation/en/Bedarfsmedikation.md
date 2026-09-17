# Bedarfsmedikation - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Bedarfsmedikation**

## Bedarfsmedikation

# Bedarfsmedikation

Die Abbildung und fachliche Spezifikation von Bedarfsmedikation wird derzeit im Implementierungsleitfaden [FHIR Medication IG Deutschland](https://ig.fhir.de/igs/medication/) erarbeitet. Die dort beschriebenen Konzepte und Festlegungen können als fachliche und technische Guidance für die Umsetzung von Bedarfsmedikation im Kontext dieses Implementierungsleitfadens herangezogen werden.

ISiK-Medikation verwendet bereits die R5-Backport-Extension `Dosage.asNeededFor` zur Abbildung von Bedarfsindikationen. Dies entspricht der aktuellen fachlichen und technischen Ausrichtung des FHIR Medication IG Deutschland und stellt eine Vorabübernahme („Pre-Adaption“) dieser Festlegung dar, da die entsprechende Version des Implementierungsleitfadens zum Zeitpunkt der Veröffentlichung von ISiK noch nicht offiziell veröffentlicht war.

Im Unterschied zu `asNeeded[x]` aus FHIR R4 ermöglicht die Extension:

* die Angabe mehrerer Indikationen für eine Bedarfsmedikation,
* die gleichzeitige Verwendung von `asNeededBoolean` und kodierten Indikationsangaben.

