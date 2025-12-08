# Umgang mit fehlenden Daten - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Umgang mit fehlenden Daten**

## Umgang mit fehlenden Daten

## Allgemeine Hinweise zum Umgang mit fehlenden Daten

In bestimmten Situationen können Informationen zu einem Datenelement fehlen, ohne dass das Quellsystem den Grund dafür kennt. Wenn das betroffene Datenelement eine minimale Kardinalität von 0 hat, also optional ist, auch wenn es als Must Support gekennzeichnet ist, sollte es aus der Ressource weggelassen werden. Handelt es sich hingegen um ein obligatorisches Element mit einer minimalen Kardinalität größer als 0, muss es trotzdem in der Ressource enthalten sein, selbst wenn keine Werte vorliegen. Für solche Fälle wird nachfolgend ein einheitliches Vorgehen im Sinne einer Best Practice zusammengefasst:

1. Nicht-kodierte Datenelemente

* Verwende die [DataAbsentReason]((https://hl7.org/fhir/extensions/StructureDefinition-data-absent-reason.md)) Extension innerhalb des jeweiligen Datentyps.
* Nutze den Code `unknown`, wenn der Wert erwartet wird, aber nicht bekannt ist.

Beispiel: Eine Patient-Ressource, in der kein Name verfügbar ist:

```
{
  "resourceType": "Patient",
  ...
  "name": [
    {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
          "valueCode": "unknown"
        }
      ]
    }
  ],
  "telecom": ...
}

```

1. Kodierte Datenelemente

Bei Bindings mit „example“, „preferred“ oder „extensible“ (für CodeableConcept oder Coding) gilt:

* Wenn das Quellsystem nur Freitext, aber keinen Code kennt, wird lediglich das Textelement verwendet.
* Bei Coding-Typen wird der Text über das display-Element abgebildet.
* Liegt weder ein Code noch ein Text vor: 
* Verwende nach Möglichkeit einen geeigneten „unknown“-Code aus dem zugehörigen ValueSet.
* Falls das ValueSet keinen passenden Code enthält, verwende den Code unknown aus dem DataAbsentReason-CodeSystem.
 

Bei Bindings mit „required“ (für CodeableConcept, Coding oder code):

Verwende, wenn möglich, einen „unknown“-Code aus dem zugewiesenen ValueSet. Falls das ValueSet keinen solchen Code bietet, muss ein anderer gültiger Code aus dem ValueSet verwendet werden. Andernfalls ist die Ressource nicht konform zur Spezifikation.

