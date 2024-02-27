# Patient merge und Notification
Im Rahmen von Krankenhausbesuchen umfassen u.a. die Aufnahme-Workflows regelmäßig die manuelle Bearbeitung von Patientenstammdaten. Daher ist hier das Risiko redundant persistierter Patientendaten stets vorhanden. Dies hat auch zur Folge, dass Zusammenführungen von Patientendaten in Krankenhäusern an der Tagesordnung stehen. 
Die Patientendatenzusammenführung (Patient merge) bezeichnet den Workflow der Bereinigung redundanter Patienten-Instanzen innerhalb eines KIS oder einer KH-IT-Umgebung. Die Bereinigung geschieht erfahrungsgemäß als halbautomatisierter Prozess, für den dedizierte Komponenten eingesetzt werden können.

Ziel dieses Spezifikations-Abschnitts ist es, dass externe Clients Patient-merge-Vorgänge nachvollziehen und entsprechend verarbeiten können.
Entsprechend wird hier eine Festlegung zur Kommunikation eines stattgefundenen Patient merges (Patient merge Notification) gegenüber einem Subsystem oder einem externen Service - u.a. mittels FHIR Subscriptions - festgelegt.


## Patient merge
Mergen von Patienten ist Aufgabe des bestätigungsrelevanten Systems (d.h. hier des patientenführenden Systems - in der Regel des KIS). 
Ein externes Starten eines Patient merge - bspw. durch die [$patient-merge Operation aus R5](https://hl7.org/fhir/R5/patient-operation-merge.html) - ist nicht gefordert.

**Hinweis**: Die Patienten-Ressource, die nicht weiter verwendet werden soll, nennen wir im Folgenden die "obsolete Ressource". Die Ressource, die erhalten bleiben soll, nennen wir "resultierende Ressource".

## Gemergte Patienten Instanz
Wenn ein Patient merge geschieht, gelten für das patientenführende System folgende Anforderungen:

**REQ_BAS_PAT-MER-010**: Das patientenführende System MUSS sicherstellen, dass alle auf die obsolete Ressource referenzierenden FHIR-Ressourcen nach dem merge auf die resultierende Ressource referenzieren. 

### Die obsolete Patienten-Ressource

**REQ_BAS_PAT-MER-011**: Das patientenführende System KANN die obsolete Patienten-Ressource weiter vorhalten. Ein Entfernen der obsoleten Ressource ist ebenfalls erlaubt.

Soll die obsolete Ressource nach einem merge weiter vorgehalten werden MÜSSEN die Elemente der obsoleten Ressource folgendermaßen befüllt werden, um sicherzustellen, dass die obsolete Ressource auf die resultieren Ressource verweist und das die obsolete Ressource als inaktiv gekennzeichnet ist:
- .active = false
- .link.other = Reference(auf “resultierenden” Patient)
- .link.type = “replaced-by”

## Beispiele
Die Patient merge Notification kann folgendermaßen illustriert werden: es existieren fälschlicherweise zwei Instanzen, die sich lediglich hinsichtlich der organisationsspezifischen Patienten-ID unterscheiden.
Diese sind:

"Quell" Patienten-Ressource:  
{{json:DorisQuelle}}

und

"Ziel" Patienten-Ressource:  
{{json:DorisZiel}}

Mittels eines Patient-merge-Vorgangs wird die "Ziel" Patienten-Ressource ausgewählt und beide Ressourcen entsprechend modifiziert:

Resultierende Patientin:
{{json:DorisResultat}}

### Datenelemente der resultierenden Patienten-Ressource

**REQ_BAS_PAT-MER-012**: Das patientenführende System MUSS nach einem merge die Elemente der resultierenden Ressource folgendermaßen befüllen, um sicherzustellen, dass die resultierende Ressource auf die obsolete Ressource verweist:
- .link.other = Reference.identifier (logische Referenz mittels Patientennummer Identifier auf “obsoleten” Patient)
- .link.type = “replaces”

## Patient merge Notification
**REQ_BAS_PAT-MER-020**: Das patientenführende System MUSS einen Client mittels FHIR Subscription über einen erfolgten Patienten merge informieren können. Dieser Mechanismus basiert auf dem [Subscriptions R5 Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/channels.html) und nutzt das Konzept der "Topic-Based Subscription" aus FHIR R5.  

Hierfür wurde das Subscription Topic: *https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge* definiert.

Das patientenführende System MUSS den Support dieser Subscription inneralb des CapabilityStatements bekannt geben.

## Client-System
**REQ_BAS_PAT-MER-021**: Client-Systeme MÜSSEN den Status einer gecachten Patienteninstanz vor der Interaktion mit einem patientenführenden System per READ auf das Patientenobjekt überprüfen.
Sollte das Patientenobjekt nicht mehr bereitstehen, oder hat den status `active=false` muss das Patientenobjekt mittels Suche auf einen bekannten & stabilen Identifier neu geladen werden.

## Datensicherheit

Die patient-merge Subscription-Notification kann personenbezogene Daten versenden falls man full-resource als content-code gewählt hat. Für den REST-Hook sollte daher stets ein https Endpunkt genutzt werden. Zusätzlich kann `Subscription.channel.header` genutzt werden um einen Authorization-Header an den Enpunkt zu übertragen.   
Siehe auch: [Safety and Security, Subscription Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/safety_security.html)

### Websocket

Hier muss sich der Client per [`$get-ws-binding-token` Operation](https://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition-backport-subscription-get-ws-binding-token.html) einen Token zum Zugriff auf den Websocket-Endpunkt des patientenführenden Systems holen. In der Operation-Response sind zusätzlich die expiration-Dauer, sowie der Websocketendpunkt enthalten.  
Siehe auch: [Subscriptions R5 Backport IG, Websocket](https://hl7.org/fhir/uv/subscriptions-backport/channels.html#websockets)