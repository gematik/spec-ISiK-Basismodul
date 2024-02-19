# Interaktionen und Search Types

## Dokumentenserver
Das bestätigungsrelevante System nimmt die Rolle des Dokumentenservers ein. Ein Dokumentenserver nimmt Dokumente von Clients zur Speicherung/Archivierung/Verwaltung entgegen und erlaubt Clients die Suche nach und den Abruf von Dokumenten.

## (Webbasierter/Mobiler) Client
Clients können Dokumente von einem Dokumentenserver abfragen, um sie z.B. einem Anwender anzuzeigen. Dabei können sie die für die Server verpflichtend festgelegten Suchkriterien beliebig kombinieren.
Clients sind nicht verpflichtet, alle von den Servern geforderten Suchkriterien zu unterstützen.

# Search Includes and Reverse Includes

Damit diese Akteure sinnvoll miteinander kommunizieren, wird im Folgenden ein grafischer Überblick über die in diesem Modul zu inlduierenden Suchparameter und Operationen gegeben.
Da es sich um eine Zusammenfassung handelt, gelten Bedingungen für die gezeigten Inhalte:
* Alle Must-Support Elemente einer Componente müssen von den entsprechenden Systemen suchbar sein. Diese sind hier nicht erneut aufgezählt.
* Ein Doppelpunkt meint den Zugriff auf ein Element des beinhaltenden Profils.
* Das Elemente hinter einem Doppelpunkt besitzt wiederum die Sucharameter (alle Must-Support Elemente!), die hier in die Suchsyntax zu inkludieren sind.

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/rc/main-stufe-4/Material/images/diagrams/search_includes.svg" class="center" alt="Searchtypes" width="90%"/>