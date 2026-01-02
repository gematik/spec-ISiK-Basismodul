# Akteure - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Akteure**

## Akteure

# Stakeholder, User und weitere Systeme

Die Spezifikation richtet sich insbesondere an SW-Hersteller von 1) KIS, 2) zugehörigen Submodulen und Subsystemen, die von Stationsapothekern genutzt werden sowie 3) eigenständigen aber im Ökosystem integrierten Systemen, die in der Krankenhausapotheke zum Einsatz kommen. Alle anderen Hersteller von ISiK-nahen Systemen sind auch eingeladen sich zu beteiligen, da Aufrufe und Ergebnisse potenziell propagiert werden müssen.

Es handelt sich um eine technische Spezifikation, zu der keine weiteren medizinischen Fachexperten zu Rate gezogen werden müssen. Die sogenannten ‘AMTS-Checks’ - zur medizinischen und pharmakologischen Bewertung von AMTS - müssen durch die IS weiterhin selbst durchgeführt werden.

## User und Systeme im Fokus

Primär zu berücksichtigende User sind

* Krankenhausmitarbeiter (MFAs, Ärzte etc.)
* Pharmazeutisches Personal (Apotheker, PTAs etc.)
* Patienten (bei Aufnahme, Entlassung, stationärer Medikation usw.)

Beteiligte Systeme sind prinzipiell alle [bestätigungsrelevanten Systeme](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_BestaetigungsrelevanteSysteme). Primär hervorzuheben sind dabei:

* KIS, auch fokussierte KIS der Dentalklinik oder der Mund-, Kiefer- und Gesichtschirurgie
* KIS-Submodule der Medikation
* Eigenständige Systeme der Krankenhausapotheke (AVS)

Zudem sind hervorzuheben als mögliche Clients oder Subsysteme auch Datenbanken oder Services außerhalb der Krankenhauslandschaft, die Informationen bereitstellen über:

* Wirkstoffe und Wechselwirkungen
* Indikationen, Kontraindikationen und Nebenwirkungen
* Substitutionsmöglichkeiten und Generika

## Einordnung in die ISiK Landschaft

Als übergreifender Use Case ist AMTS grundsätzlich im Modul Medikation verankert. Dennoch werden AMTS-relevante Informationen aus weiteren ISiK-Modulen benötigt, die aus verschiedenen Gründen dort fachlich zugeordnet werden und verbleiben:

* **ISiK Modul Medikation: Mit Informationen zur Medikation und Verordnung** - In dem vorliegenden Modul finden sich Informationen zur aktuellen Medikation (z.B. Blutdruck-Senker) und patienten-spezifischen Verordnung. Ziel der hier verorteten Profile ist es vor allem, Wechselwirkungen mit weiteren Verordnungen oder Behandlungen zu identifizieren und ihr Risiko zu bewerten. Auch die Bewertung von akzeptierten Risiken findet sich hier. Da ISiK aktuell noch einen stark patientenzentrierten Ansatz verfolgt, sei darauf hingewiesen, dass es keine MedicationKnowledge-Profile gibt (also keine Arzneimittel- oder Wissensdatenbank im weiteren Sinne).
* **ISiK Basismodul: Mit Informationen zum Patienten und Diagnosen** - Hier sind Profile im Zusammenhang mit Allergien und Unverträglichkeiten verortet. Es gehören aber auch chronische Erkrankungen (z.B. Niereninsuffizienz), Lebensumstände (z.B. Schwangerschaft) und Lebensgewohnheiten (z.B. Raucher) dazu. [ISiK Basismodul](https://simplifier.net/guide/isik-basis-stufe-5)
* **ISiK Support Modul Labor: Mit Informationen aus der Labor Diagnostik** - In diesem Modul finden sich vor allem AMTS-relevante Beobachtungen und Messwerte, die als Ergebnis eines diagnostischen Prozesses oder einer Probe zugeordnet werden können. [ISiK Modul Labor](https://simplifier.net/guide/isik-labor-stufe-5)

## Weitere zu berücksichtigende Systeme und Standards

Die Kompatibilitäten zu den [gelisteten Spezifikationen](https://simplifier.net/guide/isik-medikation-stufe-5/Einfuehrung/UebergreifendeFestlegungen/Kompatibilitaet) sollen weiterhin gewahrt bleiben.

Da mit dem [ePA Medication Service](https://gemspec.gematik.de/ig/fhir/epa-medication/1.2.0-ballot.1/index.html) eine FHIR-basierte Lösung zur Verwendung in der ePA für Alle erstellt wird, sollte die Kompatibilität sowohl organisatorisch als auch in der Umsetzung der Spezifikation angestrebt werden.

Neben den allgemein geltenden Festlegungen in FHIR und HL7v2 können auch folgende Festlegungen in die Entwicklung mit eingehen:

* Das Allergie Profil aus der Patientenkurzakte, [Allergy Intolerance (IPS)](https://build.fhir.org/ig/HL7/fhir-ips/StructureDefinition-AllergyIntolerance-uv-ips.html)
* Die Bereiche **CAVE**, **Interaktionen** sowie **Indikationen und Nebenwirkungen** des AMTS-Modul der [ABDADatenbank²](https://abdata.de/produkte/abdadatenbank2/amts-modul/)
* Das AllergyIntolerance-Profil der KBV-Basisprofile [KBV_PR_Base_AllergyIntolerance](https://simplifier.net/base1x0/kbv_pr_base_allergyintolerance)
* Das AllergyIntolerance-Profil von GEVKO eMDAF [eMDAF Allergien und Unverträglichkeiten](https://simplifier.net/emdaf/emdafprallergyintolerance)

