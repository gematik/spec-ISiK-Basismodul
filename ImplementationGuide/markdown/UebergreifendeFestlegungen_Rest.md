# REST-API

## Read-Interaktionen
Instanzen von Datenobjekten, die die REST-Interaktion "READ" fordern MÜSSEN per HTTP GET auf ```[BASE_URL]/[resourceType]/[ID]``` abgerufen werden können. 
Siehe: https://www.hl7.org/fhir/http.html#read 

## Search-Interaktionen
Die Suche MUSS sowohl mittels HTTP GET als auch HTTP POST (vgl. [FHIR RESTful Search - Introduction](https://www.hl7.org/fhir/search.html#Introduction)) unterstützt werden. Die URL-Parameter komplexer Suchanfragen können personenbezogene Merkmale enthalten, daher ist im Echtbetrieb die Suche mittels HTTP POST in Verbindung mit TLS-Verschlüsselung vorzuziehen. 

## Sicherheitsaspekte
Alle REST-Interaktionen müssen sowohl mittels HTTP als auch HTTPS (TLS-Verschlüsselung) unterstützt werden. Vorgaben zur TLS-Verschlüsselung sind dem nachfolgenden Link für die FHIR Security Check List zu entnehmen.
Im Echtbetrieb MUSS die Kommunikation ausschließlich per HTTPS erfolgen.
Weiterhin sind geeignete Maßnahmen zur Risiko-Minimierung (z.B. Benutzerautorisierung / -authentifikation) zu treffen, siehe https://build.fhir.org/security.html#6.1.0. 
Diese sind in Stufe 1 des ISiK Basismoduls jedoch nicht bestätigungsrelevant.