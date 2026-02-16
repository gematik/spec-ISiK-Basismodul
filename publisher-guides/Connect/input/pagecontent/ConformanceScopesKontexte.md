
**Normativ**

Die Vorgaben von ISiK-Connect betreffen aktuell ausschließlich Systeme in der Rolle eines ISiK-Ressourcenservers. Diese Systeme MÜSSEN die auf dieser Seite beschriebenen Autorisierungsinformationen bei jedem Zugriffsversuch auf FHIR-Ressourcen verarbeiten können ([ANF-CON-029](Anforderungsuebersicht.html)).

### Kontexte 

Bestätigungsrelevante Systeme in der Rolle eines ISiK-Ressourcenservers DÜRFEN im ["patient"-Level Scope](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#patient-specific-scopes) (s.u.) KEINE Zugriffstoken (_Access Token_) akzeptieren, in denen kein Kontext als Bezugspunkt für die gewährten Zugriffsrechte angegeben ist bzw. per _Introspection_ ermittelt werden kann ([ANF-CON-030](Anforderungsuebersicht.html)). 

Es MÜSSEN mindestens die Kontexte "patient" und "encounter" unterstützt werden ([ANF-CON-031](Anforderungsuebersicht.html)).  

Beispiele: 

```"patient": "87a339d0-8cae-418e-89c7-8651e6aab3c6"```

```"encounter": "dd345a12-ed67-e451-3422-9813d3a400bc"```

### Compartments

ISiK-Ressourcenservers MÜSSEN bei der Durchsetzungen von Autorisierungen die Festlegungen zum [_Compartment Patient_](https://hl7.org/fhir/R4/compartmentdefinition-patient.html) unterstützen ([ANF-CON-032](Anforderungsuebersicht.html)). Sie KÖNNEN weitere der von HL7 definierten _CompartmentDefinitionen_ unterstützen.

ISiK-Ressourcen-Server DÜRFEN KEINE eigenen _CompartmentDefinitionen_ definieren, da eine Definition von _Compartments_ alleinig durch HL7 erfolgen darf ([ANF-CON-052](Anforderungsuebersicht.html)). 

Die Unterstützung eines _Compartments_ umfasst, dass die Festlegungen in der _CompartmentDefinition_ die Gruppierung von über _Scopes_ angegebenen Berechtigungen zu der als Kontext angegebenen Ressource bestimmen. Im _"patient"-Level Scope_ (s.u.) bestimmt das [_Patient Compartment_](https://hl7.org/fhir/R4/compartmentdefinition-patient.html) die maximal zulässigen Berechtigungen eines Zugriffs auf die den angegebenen Kontext darstellende Ressource.

Beispiel: Der gegebene Kontext ist der Patient "123". Die über einen _Scope_ angegebene Autorisierung ist 'patient/Observation.r'. Der ISiK-Ressourcen-Server darf nur Anfragen ausführen, die lesend auf _Observation_-Ressourcen zugreifen, die über 'Observation.subject' oder 'Observation.performer' dem Patienten "123" zugeordnet sind.

### Berechtigungen auf Ressourcentypen

Berechtigungen auf Ressourcentypen MÜSSEN sowohl in der _SMART Capabilities_ Datei als auch in den gegenüber dem ISiK-Ressourcen-Server bestätigten _Scopes_ in der folgenden Syntax kodiert werden ([ANF-CON-033](Anforderungsuebersicht.html)):

```(patient | user | system) \/ (_Ressourcetyp_ | \*) \. c?r?u?d?s? (\? (_param_\=_value_) (\& _param_\=_value_)* )?```

#### Scope-Level
SMART-on-FHIR-Berechtigungen auf Ressourcen lassen sich in drei Kategorien einteilen, die alle durch ISiK-konforme Ressourcen-Server unterstützt werden MÜSSEN ([ANF-CON-034](Anforderungsuebersicht.html)):

* ["patient"-Level Scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#patient-specific-scopes) geben an, welche verfügbaren Nutzerberechtigungen auf allen Ressourcen im gewählten _Patient Compartment_ an den Client delegiert werden bzw. werden sollen.  
* ["user"-Level Scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#user-level-scopes) geben an, welche verfügbaren Nutzerberechtigungen auf allen Ressourcen durch den Benutzer an den Client delegiert werden bzw. werden sollen.
* ["system"-Level Scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#system-level-scopes) geben an, welche verfügbaren Nutzerberechtigungen auf allen Ressourcen an einen (technischen) Client delegiert werden bzw. werden sollen, unabhängig davon welcher Benutzer hiermit interagiert.

Autorisierungen in einem _SMART on FHIR_ _Launch Kontext_, für den keine Compartment-Definition existiert (z. B. 'launch/location'), SOLLEN in einem _"user"_- oder _"system"-Level Scope_ erfolgen (z. B. 'user/Location.rs') ([ANF-CON-035](Anforderungsuebersicht.html)).

#### Ressourcetyp und Operationen
Es MÜSSEN alle in weiteren ISiK-Modulen profilierten Ressourcentypen unterstützt werden. Sofern in ISiK ein Ressourcentyp als zulässig definiert wird, MÜSSEN alle in FHIR definierten lesenden und modifizierenden Operationen unterstützt werden ([ANF-CON-036](Anforderungsuebersicht.html)):

|Berechtigung|FHIR-Operation auf System-Ebene|FHIR-Operation auf Typ-Ebene|FHIR-Operation auf Instanz-Ebene|
|:-----------|:------------------------------|:---------------------------|--------------------------------|
|c           |                               |create                      |                                |
|r           |                               |                            |read, vread, history            |
|u           |                               |                            |update, patch                   |
|d           |                               |                            |delete                          |
|s           |search, history                |search, history             |                                |

Berechtigungen werden im _Scope_ in der dargestellten Reihenfolge ('cruds') angegeben (vgl. https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#clinical-scope-syntax). Bei einer falschen Reihenfolge SOLL der ISiK-Ressourcen-Server einen Zugriffsfehler auslösen ([ANF-CON-037](Anforderungsuebersicht.html)).

Die Möglichkeit von [_Wildcard-Scopes_](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#wildcard-scopes) MUSS unterstützt werden ([ANF-CON-038](Anforderungsuebersicht.html)).

#### Filter
Alle in ISiK für den Ressourcetyp unterstützten Suchparameter inkl. _Modifier_ und Kombinationsmöglichkeiten MÜSSEN als Teil eines _Scopes_ unterstützt werden ([ANF-CON-039](Anforderungsuebersicht.html)).

#### Beispiele

Die folgende Beispiele geben gültige _Scopes_ wieder:

* ```patient/Patient.rs```
* ```patient/Observation.cruds```
* ```patient/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory```

