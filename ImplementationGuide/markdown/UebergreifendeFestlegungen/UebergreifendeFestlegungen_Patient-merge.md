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

**REQ_BAS_PAT-MER-010**: Das patientenführende System MUSS sicherstellen, dass ein externer Client, dem ein lesender Zugriff auf eine Patienten-Ressource erteilt wurde, auch nach einem Patient merge auf diese obsolete Ressource zugreifen kann, um eine Abfrage auf die resultierende Ressource mittels .link-Elements zu ermöglichen. Dies MUSS solange gelten, bis das patientenführende System sicherstellen kann - z.B. mittels eines vereinbarten Workflows -, dass alle Abfragen des Clients, die potentiell auf die obsolete Ressource zielen könnten, in Zukunft auf die resultierende Ressource zielen.

### Datenelemente der obsoleten Patienten-Ressource

**REQ_BAS_PAT-MER-011**: Das patientenführende System MUSS nach einem merge die Elemente der obsoleten Ressource folgendermaßen befüllen, um sicherzustellen, dass die obsolete Ressource auf die resultieren Ressource verweist und das die obsolete Ressource als inaktiv gekennzeichnet ist:
- .active = false
- .link.other = Reference(auf “resultierenden” Patient)
- .link.type = “replaced-by”

### Datenelemente der resultierenden Patienten-Ressource

**REQ_BAS_PAT-MER-012**: Das patientenführende System MUSS nach einem merge die Elemente der resultierende Ressource folgendermaßen befüllen, um sicherzustellen, dass die resultierende Ressource auf die obsolete Ressource verweist:
- .link.other = Reference(auf “obsoleten” Patient)
- .link.type = “replaced-by”

## Beispiele
Die Patient merge Notification kann folgendermaßen illustriert werden: ex existieren fälschlicherweise zwei Instanzen, die sich lediglich hinsichtlich der organisationsspezfischen Patiente-ID unterscheiden.
Diese sind: 

"Quell" Patienten-Ressource:
{{json:DorisQuelle}}

und

"Ziel" Patienten-Ressource:
{{json:DorisZiel}}

Mittel eines Patient merge vorgangs wird die "Ziel" Patienten-Ressource ausgewählt und beide Ressourcen entsprechend modifiziert:

Obsolete Patienten-Ressource:
{{json:DorisObsolet}}

Resultierende Patientin:
{{json:DorisResultat}}

## Patient merge Notification
**REQ_BAS_PAT-MER-020**: Das patientenführende System MUSS einen Client mittels FHIR Subscription über einen erfolgten Patienten merge informieren können.

Hier wird aktuell geklärt ob dies mittels r4 Subscription oder R5 backport topic-based Subscription erfolgen soll.


