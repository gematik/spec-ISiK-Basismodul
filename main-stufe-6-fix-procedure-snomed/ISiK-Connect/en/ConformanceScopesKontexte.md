# Conformance: Scopes und Kontexte - ISiK Connect Implementierungsleitfaden v6.0.0

ISiK Connect Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Conformance: Scopes und Kontexte**

## Conformance: Scopes und Kontexte

**Normativ**

Die Vorgaben von ISiK-Connect betreffen aktuell ausschließlich Systeme in der Rolle eines ISiK-Ressourcenservers. Diese Systeme MÜSSEN die auf dieser Seite beschriebenen Autorisierungsinformationen bei jedem Zugriffsversuch auf FHIR-Ressourcen verarbeiten können ([ANF-CON-029](Anforderungsuebersicht.md)).

### Kontexte

Bestätigungsrelevante Systeme in der Rolle eines ISiK-Ressourcenservers DÜRFEN im ["patient"-Level Scope](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#patient-specific-scopes) (s.u.) KEINE Zugriffstoken (**Access Token**) akzeptieren, in denen kein Kontext als Bezugspunkt für die gewährten Zugriffsrechte angegeben ist bzw. per **Introspection** ermittelt werden kann ([ANF-CON-030](Anforderungsuebersicht.md)).

Es MÜSSEN mindestens die Kontexte "patient" und "encounter" unterstützt werden ([ANF-CON-031](Anforderungsuebersicht.md)).

Beispiele:

`"patient": "87a339d0-8cae-418e-89c7-8651e6aab3c6"`

`"encounter": "dd345a12-ed67-e451-3422-9813d3a400bc"`

### Compartments

ISiK-Ressourcenservers MÜSSEN bei der Durchsetzungen von Autorisierungen die Festlegungen zum [**Compartment Patient**](https://hl7.org/fhir/R4/compartmentdefinition-patient.html) unterstützen ([ANF-CON-032](Anforderungsuebersicht.md)). Sie KÖNNEN weitere der von HL7 definierten **CompartmentDefinitionen** unterstützen.

ISiK-Ressourcen-Server DÜRFEN KEINE eigenen **CompartmentDefinitionen** definieren, da eine Definition von **Compartments** alleinig durch HL7 erfolgen darf ([ANF-CON-052](Anforderungsuebersicht.md)).

Die Unterstützung eines **Compartments** umfasst, dass die Festlegungen in der **CompartmentDefinition** die Gruppierung von über **Scopes** angegebenen Berechtigungen zu der als Kontext angegebenen Ressource bestimmen. Im **"patient"-Level Scope** (s.u.) bestimmt das [**Patient Compartment**](https://hl7.org/fhir/R4/compartmentdefinition-patient.html) die maximal zulässigen Berechtigungen eines Zugriffs auf die den angegebenen Kontext darstellende Ressource.

Beispiel: Der gegebene Kontext ist der Patient "123". Die über einen **Scope** angegebene Autorisierung ist 'patient/Observation.r'. Der ISiK-Ressourcen-Server darf nur Anfragen ausführen, die lesend auf **Observation**-Ressourcen zugreifen, die über 'Observation.subject' oder 'Observation.performer' dem Patienten "123" zugeordnet sind.

### Berechtigungen auf Ressourcentypen

Berechtigungen auf Ressourcentypen MÜSSEN sowohl in der **SMART Capabilities** Datei als auch in den gegenüber dem ISiK-Ressourcen-Server bestätigten **Scopes** in der folgenden Syntax kodiert werden ([ANF-CON-033](Anforderungsuebersicht.md)):

`(patient | user | system) \/ (_Ressourcetyp_ | \*) \. c?r?u?d?s? (\? (_param_\=_value_) (\& _param_\=_value_)* )?`

#### Scope-Level

SMART-on-FHIR-Berechtigungen auf Ressourcen lassen sich in drei Kategorien einteilen, die alle durch ISiK-konforme Ressourcen-Server unterstützt werden MÜSSEN ([ANF-CON-034](Anforderungsuebersicht.md)):

* ["patient"-Level Scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#patient-specific-scopes) geben an, welche verfügbaren Nutzerberechtigungen auf allen Ressourcen im gewählten **Patient Compartment** an den Client delegiert werden bzw. werden sollen.
* ["user"-Level Scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#user-level-scopes) geben an, welche verfügbaren Nutzerberechtigungen auf allen Ressourcen durch den Benutzer an den Client delegiert werden bzw. werden sollen.
* ["system"-Level Scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#system-level-scopes) geben an, welche verfügbaren Nutzerberechtigungen auf allen Ressourcen an einen (technischen) Client delegiert werden bzw. werden sollen, unabhängig davon welcher Benutzer hiermit interagiert.

Autorisierungen in einem **SMART on FHIR** **Launch Kontext**, für den keine Compartment-Definition existiert (z. B. 'launch/location'), SOLLEN in einem **"user"**- oder **"system"-Level Scope** erfolgen (z. B. 'user/Location.rs') ([ANF-CON-035](Anforderungsuebersicht.md)).

#### Ressourcetyp und Operationen

Es MÜSSEN alle in weiteren ISiK-Modulen profilierten Ressourcentypen unterstützt werden. Sofern in ISiK ein Ressourcentyp als zulässig definiert wird, MÜSSEN alle in FHIR definierten lesenden und modifizierenden Operationen unterstützt werden ([ANF-CON-036](Anforderungsuebersicht.md)):

| | | | |
| :--- | :--- | :--- | :--- |
| c |   | create |   |
| r |   |   | read, vread, history |
| u |   |   | update, patch |
| d |   |   | delete |
| s | search, history | search, history |   |

Berechtigungen werden im **Scope** in der dargestellten Reihenfolge ('cruds') angegeben (vgl. https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#clinical-scope-syntax). Bei einer falschen Reihenfolge SOLL der ISiK-Ressourcen-Server einen Zugriffsfehler auslösen ([ANF-CON-037](Anforderungsuebersicht.md)).

Die Möglichkeit von [**Wildcard-Scopes**](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#wildcard-scopes) MUSS unterstützt werden ([ANF-CON-038](Anforderungsuebersicht.md)).

#### Filter

Alle in ISiK für den Ressourcetyp unterstützten Suchparameter inkl. **Modifier** und Kombinationsmöglichkeiten MÜSSEN als Teil eines **Scopes** unterstützt werden ([ANF-CON-039](Anforderungsuebersicht.md)).

#### Beispiele

Die folgende Beispiele geben gültige **Scopes** wieder:

* `patient/Patient.rs`
* `patient/Observation.cruds`
* `patient/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`

