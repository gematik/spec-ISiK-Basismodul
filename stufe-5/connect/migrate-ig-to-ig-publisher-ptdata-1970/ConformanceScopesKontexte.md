# Conformance Scopes und Kontexte - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Conformance Scopes und Kontexte**

## Conformance Scopes und Kontexte

# Conformance: Scopes und Kontexte

-------

### Normativ

-------

Die Vorgaben von ISiK-Connect betreffen aktuell ausschließlich Systeme in der Rolle eines ISiK-Ressourcenservers. Diese Systeme MÜSSEN die auf dieser Seite beschriebenen Autorisierungsinformationen bei jedem Zugriffsversuch auf FHIR-Ressourcen verarbeiten können ().

## Kontexte

Bestätigungsrelevante Systeme in der Rolle eines ISiK-Ressourcenservers DÜRFEN im [“patient”-Level Scope](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#patient-specific-scopes) (s.u.) KEINE Zugriffstoken (**Access Token**) akzeptieren, in denen kein Kontext als Bezugspunkt für die gewährten Zugriffsrechte angegeben ist bzw. per **Introspection** ermittelt werden kann ().

Es MÜSSEN mindestens die Kontexte “patient” und “encounter” unterstützt werden ().

Beispiele:

`"patient": "87a339d0-8cae-418e-89c7-8651e6aab3c6"`

`"encounter": "dd345a12-ed67-e451-3422-9813d3a400bc"`

## Compartments

ISiK-Ressourcenservers MÜSSEN bei der Durchsetzungen von Autorisierungen die Festlegungen zum [**Compartment Patient**](https://hl7.org/fhir/R4/compartmentdefinition-patient.html) unterstützen (). Sie KÖNNEN weitere der von HL7 definierten **CompartmentDefinitionen** unterstützen.

ISiK-Ressourcen-Server DÜRFEN KEINE eigenen **CompartmentDefinitionen** definieren, da eine Definition von **Compartments** alleinig durch HL7 erfolgen darf ().

Die Unterstützung eines **Compartments** umfasst, dass die Festlegungen in der **CompartmentDefinition** die Gruppierung von über **Scopes** angegebenen Berechtigungen zu der als Kontext angegebenen Ressource bestimmen. Im **“patient”-Level Scope** (s.u.) bestimmt das [**Patient Compartment**](https://hl7.org/fhir/R4/compartmentdefinition-patient.html) die maximal zulässigen Berechtigungen eines Zugriffs auf die den angegebenen Kontext darstellende Ressource.

Beispiel: Der gegebene Kontext ist der Patient “123”. Die über einen **Scope** angegebene Autorisierung ist ‘patient/Observation.r’. Der ISiK-Ressourcen-Server darf nur Anfragen ausführen, die lesend auf **Observation**-Ressourcen zugreifen, die über ‘Observation.subject’ oder ‘Observation.performer’ dem Patienten “123” zugeordnet sind.

## Berechtigungen auf Ressourcentypen

Berechtigungen auf Ressourcentypen MÜSSEN sowohl in der **SMART Capabilities** Datei als auch in den gegenüber dem ISiK-Ressourcen-Server bestätigten **Scopes** in der folgenden Syntax kodiert werden ():

`(patient | user | system) \/ (_Ressourcetyp_ | \*) \. c?r?u?d?s? (\? (_param_\=_value_) (\& _param_\=_value_)* )?`

### Scope-Level

SMART-on-FHIR-Berechtigungen auf Ressourcen lassen sich in drei Kategorien einteilen, die alle durch ISiK-konforme Ressourcen-Server unterstützt werden MÜSSEN ():

* [“patient”-Level Scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#patient-specific-scopes) geben an, welche verfügbaren Nutzerberechtigungen auf allen Ressourcen im gewählten **Patient Compartment** an den Client delegiert werden bzw. werden sollen.
* [“user”-Level Scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#user-level-scopes) geben an, welche verfügbaren Nutzerberechtigungen auf allen Ressourcen durch den Benutzer an den Client delegiert werden bzw. werden sollen.
* [“system”-Level Scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#system-level-scopes) geben an, welche verfügbaren Nutzerberechtigungen auf allen Ressourcen an einen (technischen) Client delegiert werden bzw. werden sollen, unabhängig davon welcher Benutzer hiermit interagiert.

Autorisierungen in einem **SMART on FHIR** **Launch Kontext**, für den keine Compartment-Definition existiert (z. B. ‘launch/location’), SOLLEN in einem **“user”**- oder **“system”-Level Scope** erfolgen (z. B. ‘user/Location.rs’) ().

### Ressourcetyp und Operationen

Es MÜSSEN alle in weiteren ISiK-Modulen profilierten Ressourcentypen unterstützt werden. Sofern in ISiK ein Ressourcentyp als zulässig definiert wird, MÜSSEN alle in FHIR definierten lesenden und modifizierenden Operationen unterstützt werden ():

| | | | |
| :--- | :--- | :--- | :--- |
| c |   | create |   |
| r |   |   | read, vread, history |
| u |   |   | update, patch |
| d |   |   | delete |
| s | search, history | search, history |   |

Berechtigungen werden im **Scope** in der dargestellten Reihenfolge (‘cruds’) angegeben (vgl. https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#clinical-scope-syntax). Bei einer falschen Reihenfolge SOLL der ISiK-Ressourcen-Server einen Zugriffsfehler auslösen ().

Die Möglichkeit von [**Wildcard-Scopes**](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#wildcard-scopes) MUSS unterstützt werden ().

### Filter

Alle in ISiK für den Ressourcetyp unterstützten Suchparameter inkl. **Modifier** und Kombinationsmöglichkeiten MÜSSEN als Teil eines **Scopes** unterstützt werden ().

### Beispiele

Die folgende Beispiele geben gültige **Scopes** wieder:

* `patient/Patient.rs`
* `patient/Observation.cruds`
* `patient/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`

