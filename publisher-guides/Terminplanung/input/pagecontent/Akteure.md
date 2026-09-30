Innerhalb des ISiK Moduls Terminplanung kann ein beteiligtes System verschiedene Rollen einnehmen und somit unterschiedliche Aufgaben innerhalb der im Abschnitt [Interaktionen](Interaktionen.html) definierten Arbeitsabläufe übernehmen. Im Weiteren werden diese Rollen mithilfe der Definition von Akteuren formalisiert, sodass eine Zuordnung von relevanten Interaktionen zum jeweiligen Akteur erfolgen kann. Ein System kann dabei auch mehrere Rollen gleichzeitig einnehmen; die Festlegungen einer Akteursdefinition gelten in diesem Fall jeweils nur für die entsprechende Rolle.

Allein für den Akteur Termin-Repository gelten normative Festlegungen für die Implementierung einer Schnittstelle.

Grundsätzlich wird als Terminblock eine für einen Termin buchbare Zeiteinheit verstanden, in der bestimmte Ressourcen (z.B. Fachabteilungen, Personen im Gesundheitswesen, Geräte, Räume) zur Verfügung stehen. Übergreifend über ein oder mehrere Terminblöcke hinweg kann für diese Ressourcen anschließend ein Termin vereinbart werden.

### Termin-Repository

**Definition:**

Als Termin-Repository werden alle Systeme definiert, die Informationen zu verfügbaren Termineinheiten von Ressourcen (vgl. zuvor genannte Definition) vorhalten und die dafür vereinbarten Termine als führendes System verwalten. In diesem Sinne ist ein Termin-Repository als ein zentraler Terminplanungs-Server zu verstehen.

Termin-Repositories sind somit die terminführenden Systeme: In ihnen werden die Kalender (Schedules) und die darin buchbaren Terminblöcke (Slots) sowie die zugehörigen Akteure (z.B. Personen im Gesundheitswesen, Räume, Geräte) verwaltet. Ein Termin-Repository ist damit die maßgebliche Quelle ("Source of Truth") für Kalender, Terminblöcke und Termine und besitzt die Hoheit über die Verfügbarkeit der relevanten Ressourcen. Ob ein System die Rolle eines Termin-Repositorys einnimmt, lässt sich im Wesentlichen daran erkennen, wo die Kalender, die Terminblöcke und die zugehörigen Akteure verwaltet werden (vgl. [Architekturoptionen](Architekturoptionen.html)).

Das Termin-Repository kann intern in ein Repository für die Termine und ein separates Repository für die buchbaren Terminblöcke (Terminblock Repository) geteilt werden.

**Beispielsysteme:**

* Patientenportal im Falle, dass das System selbst terminführend ist
* KIS / KAS inkl. Terminverwaltung 

**Festlegungen'**
In diesem Modul gilt für den Akteur Termin-Repository das entsprechende [CapabilityStatement](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur-expanded.html).

### Termin-Requestor / Termin Source

**Definition:**

Als Termin-Requestor (in Anlehnung an die IHE Terminologie auch als Termin Source zu bezeichnen) werden alle Systeme definiert, die zur Erhebung, Erfassung, Anpassung oder Veränderung von Termininformationen dienen. In seiner Funktion als Termin-Requestor persistiert ein System die verarbeiteten Termininformationen nicht permanent als führendes System; die Hoheit über die Termine verbleibt beim adressierten Termin-Repository. Ein reiner Termin-Requestor (d.h. ein System, das keine weitere Rolle einnimmt) verfügt über keine permanente Persistierung der verarbeiteten Informationen. Der Termin-Requestor übernimmt die Koordination der Schnittstellenaufrufe, um einen Termin zu buchen. 

Auch ein Termin-Repository kann gegenüber einem weiteren Termin-Repository die Rolle des Termin-Requestors einnehmen, z.B. um die bei ihm gebuchten Termine in das weitere Termin-Repository zu spiegeln (vgl. [Interaktionen - Termin neu buchen](Interaktionen.html) sowie [Architekturoptionen](Architekturoptionen.html)). Die dauerhafte Persistierung der eigenen Termine erfolgt dabei in seiner Rolle als Termin-Repository; in seiner Rolle als Termin-Requestor gegenüber dem weiteren Termin-Repository gilt es für die dort geführten Termine nicht als führendes System.

**Beispielsysteme:**

* Patientenportal im Falle, dass ein externes System das terminführende System ist

### Termin-Consumer

**Definition:**

Als Termin-Consumer werden alle Systeme definiert, die Termininformationen abfragen, um diese einem Benutzer zu präsentieren. Ein Termin-Consumer verfügt über keine permanente Persistierung der abgefragten Informationen. Durch den Termin-Consumer erfolgt explizit nur die Aufbereitung und Präsentation der Termininformationen. Eine anderweitige Verarbeitung der Termininformationen fällt in die Kategorie der anderen Akteure.

**Beispielsysteme:**

* Apps zum Anzeigen eines Kalenders
* Backendsysteme zum Versenden von Benachrichtigungen im Kontext eines Termins
* Ressourcenmanagementsoftware

