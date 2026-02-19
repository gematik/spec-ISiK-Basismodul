---
topic: Festlegungen
---

### Übergreifende Festlegungen

Es gelten alle übergreifenden Festlegungen entsprechend dem [ISiK Basismodul](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen).

Zudem gelten die Festlegungen gemäß dem Abschnitt zu den [Akteuren](Akteure.html).


### Normativer Status
Bestätigungsrelevante Systeme für dieses Modul SOLLEN unter geeigneter Konfiguration die geschilderten Use Cases unterstützen können.

Für alle Observation-Profile, die im Rahmen dieser Festlegung implementiert werden, MÜSSEN die Suchparameter entsprechend der [Observation-Seite aus der Basis](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Lebenszustand) implementiert werden.

### Datenübernahme - Zusammenspiel von KIS & Patientendatenmanagementsystem (PDMS)

Jedes System ist für seine eigenen Daten verantwortlich, ein aktives Pushen per `POST` Interaktion ist nicht vorgesehen. Im Falle einer gewollten Datenübernahme zwischen Systemen greifen diese gegenseitig mittels `GET` Interaktion aufeinander zu und fragen die zu übernehmenden Daten selbstständig ab.

**Beispiel:** Bei der Überleitung eines Patienten von Intensiv- auf Normalstation sollen die letzten Blutdrücke, Sauerstoffsättigungen sowie das Körpergewicht in die Kurvenansicht des KIS übernommen werden. Hierzu wird das KIS zu einem FHIR-Client welcher die benötigten Werte vom FHIR-Endpunkt des PDMS abruft.