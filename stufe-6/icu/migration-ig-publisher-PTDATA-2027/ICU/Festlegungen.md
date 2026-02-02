# Festlegungen - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* **Festlegungen**

## Festlegungen

### Übergreifende Festlegungen

Es gelten alle übergreifenden Festlegungen entsprechend dem [ISiK Basismodul](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen).

Zudem gelten die Festlegungen gemäß dem Abschnitt zu den .

#### Normativer Status

Bestätigungsrelevante Systeme für dieses Modul SOLLEN unter geeigneter Konfiguration die geschilderten Use Cases unterstützen können.

Für alle Observation-Profile, die im Rahmen dieser Festlegung implementiert werden, MÜSSEN die Suchparameter entsprechend der [Observation-Seite aus der Basis](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Lebenszustand) implementiert werden.

#### Herstellung von Patienten- und Encounterkontext

Vor der Abfrage von Vitalparameter-Ressourcen muss ein Client (VitalSign Standard Consumer bzw VitalSign ICU Consumer) einen entsprechenden Patienten und ggf. auch einen Fallkontakt (Encounter) identifizieren, dem die Vitalparameter zugeordnet sind.

In diesem Zusammenhang sind insbesondere die Vorgaben zur [Herstellung des Patienten- und Encounter-Kontextes](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/Patient-Besuch-Kontext.md) zu beachten.

Zur Herstellung des Patienten- und Encounterkontextes MÜSSEN daher Systeme, die als VitalSign Standard Source und VitalSign ICU Consumer agieren, auch Interaktionen auf die genannten Ressourcen aus dem ISiK Basismodul unterstützen (Minimal Administrative Data Source). Die Liste der zu unterstützenden Interaktionen auf diese Ressourcen (Festlegung für diese Modul) ist dem CapabilityStatement zur Minimal Administrative Data Source zu entnehmen.

