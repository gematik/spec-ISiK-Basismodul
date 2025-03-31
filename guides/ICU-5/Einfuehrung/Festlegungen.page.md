---
topic: Festlegungen
---

# Übergreifende Festlegungen

Es gelten alle übergreifenden Festlegungen entsprechend dem [ISiK Basismodul](https://simplifier.net/guide/isik-basis-403/Einfuehrung/UebergreifendeFestlegungen).

Zudem gelten die Festlegungen gemäß dem Abschnitt zu den {{pagelink:Akteure, text: Akteuren}}.


## Normativer Status
Bestätigungsrelevante Systeme für dieses Modul SOLLEN unter geeigneter Konfiguration die geschilderten Use Cases unterstützen können.

Für alle Observation-Profile, die im Rahmen dieser Festlegung implementiert werden, MÜSSEN die Suchparameter entsprechend der [Observation-Seite aus der Basis](https://simplifier.net/guide/isik-basis-v4/ImplementationGuide-markdown-Datenobjekte-Datenobjekte_Observation?version=current) implementiert werden.

## Herstellung von Patienten- und Encounterkontext

Vor der Abfrage von Vitalparameter-Ressourcen muss ein Client (VitalSign Standard Consumer bzw VitalSign ICU Consumer) einen entsprechenden Patienten und ggf. auch einen Fallkontakt (Encounter) identifizieren, dem die Vitalparameter zugeordnet sind.

Dies KANN z.B. einer **Manuelle Auswahl** gemäß erfolgen: Nach dem Start des Clients verwendet der Benutzer eine Suchmaske, in der anhand von Patientennummer oder anderer demografischer Daten gesucht werden kann. Der Client verwendet die [Patient-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/isik-basis-401/Einfuehrung/Datenobjekte/Datenobjekte_Patient?version=current#Patient_Interaktionen), um auf dem Server nach zutreffenden Patienten zu suchen. Der Anwender wählt den gesuchten Patienten aus der Liste der Suchtreffer aus. Im Anschluss listet ggf. der Client, mithilfe der [Encounter-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/isik-basis-401/Einfuehrung/Datenobjekte/Datenobjekte_Kontakt?version=current#Encounter_Interaktionen), die relevanten Besuche des ausgewählten Patienten auf. (Anm.: Welche Besuche als "relevant" erachtet werden, liegt im Ermessen des Clients. Es könnte z.B. anhand von `Encounter.period`, `Encounter.class` und/oder `Encounter.status` gefiltert werden). Der Anwender wählt den zutreffenden Encounter aus.

Zur Herstellung des Patienten- und Encounterkontextes MÜSSEN daher Systeme, die als VitalSign Standard Source und VitalSign ICU Consumer agieren, auch Interaktionen auf die genannten Ressourcen aus dem ISiK Basismodul unterstützen (Minimal Administrative Data Source). Die Liste der zu unterstützenden Interaktionen auf diese Ressourcen (Festlegung für diese Modul) ist dem CapabilityStatement zum Minimal Administrative Data Source zu entnehmen.