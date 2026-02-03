
### SMART Backend Services

Die SMART Backend Services spezifizieren ein standardisiertes Autorisierungsverfahren für serverseitige Anwendungen, die autonom oder semi-autonom auf FHIR-APIs zugreifen müssen. Diese Anwendungen agieren ohne direkten Endnutzer-Context und sind für den sicheren, regelmäßigen oder ereignisgesteuerten Datenaustausch mit FHIR-Servern ausgelegt.

| Beispiel                         | Funktion / Beschreibung                                                                                                   | Typischer Zugriff                          |
|----------------------------------|---------------------------------------------------------------------------------------------------------------------------|--------------------------------------------|
| **Analytik-Plattform / Data Warehouse** | Periodischer Bulk-Import von Patientendaten zur Populationsanalyse                                                        | FHIR Bulk Data Export (NDJSON)             |
| **Monitoring- und Alert-System** | Überwachung von Echtzeit-Daten (z. B. Labordaten) mit automatischer Alarmierung bei Trigger-Ereignissen                    | FHIR API (Polling oder Event-Streaming)    |
| **Datenintegrations- / Synchronisationsdienst** | Abgleich neuer Patientendaten zwischen EHR und externen Systemen                                                           | FHIR API-Queries                           |

