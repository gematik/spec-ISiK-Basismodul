# ADR-ICU-002: Organspende in ISiK


Datum: 18.03.2026  

Status: Angenommen 

[//]: #  (Status: <Vorgeschlagen | Angenommen | Abgelehnt | Verworfen | Ersetzt durch ADR-…)

Ticket: PTDATA-2117

## Kontext
[//]: #  (
<Kurzbeschreibung des Problems / der Ausgangssituation.  
Warum ist eine Entscheidung notwendig?  
Relevante Anforderungen, Randbedingungen, Annahmen.>
) 
Es besteht ein IG zur Organspendeerkennung, allerdings fehlen hierfür die erforderlichen Profile.
Einige Profile sollen aus dem Modul KDS ICu der MII übernommen werden.
Eine Entscheidung ist notwendig, weil die Profile auch für das gesamte ISiK Modul ICU nutzbar sind - jenseits des Use Case Organspendeerkennung.
Für die Umsetzung des Use Cases Organspendeerkennung soll eine möglichst schlanke Rolle entwickelt werden.
Die definierten Profile sollten verpflichtend in allen Vitalparameter-Server (z. B. PDMS) implementiert werden, da die Profile i.d.R. in diesen Systemen vorhanden sind und für zahlreiche weitere Use Cases relevant sind.

## Optionen
1. Optionale Übernahme der Profile für die Organspendeerkennung als  Profile in das ISiK Modul ICU
    - Verworfen - die Profile sind auch für andere Use Cases relevant und sollten daher verpflichtend implementiert werden.
2. Verpflichtende Übernahme der Profile für die Organspendeerkennung als  Profile in das ISiK Modul ICU
    - Vorgeschlagen - Details siehe Entscheidung

## Entscheidung
[//]: # (
<Konzise Beschreibung der getroffenen Entscheidung.  
Was wird getan / wie wird es gelöst?>
)
Profile zur Organspendeerkennung werden verpflichtend in das ISiK Modul ICU aufgenommen.
Großteils (nahezu alle Observations - Ausnahme z. B. Serumnatrium) werden Profile aus den MII Profilen übernommen, um die Interoperabilität mit Bestandslösungen der MII zu gewährleisten und die Implementierung zu erleichtern.

Dieselben Profile werden im Kontext der Organspendeerkennung in einer dedizierten Rolle vorgehalten und dort teils als verpflichtend und teils als optional definiert. Dies dient der Ermöglichung einer möglichst zugeschnitten Rolle und einer vereinfachten Implementierung des genannten Use Cases, jenseits einer vollumfänglichen Implementierung aller Profile in der Rolle ICU extended.

Es besteht *kein wesentliches* Risiko, dass die Rolle ICU extended durch die Profile zur Organspendeerkennung  überfrachtet wird, da es sich explizit um ein möglichst umfassende Rolle handelt, die für zahlreiche Use Cases relevant ist.


## Konsequenzen
[//]: # (
<Positive und negative Auswirkungen der Entscheidung.  
Auswirkungen auf Qualitätseigenschaften, Kosten, Risiken, Betrieb, Wartung.>
)
Alle ICU Profile müssen in allen Vitalparameter-Servern (z. B. PDMS) implementiert und zertifiziert werden, da die Profile i.d.R. in diesen Systemen vorhanden sind und für zahlreiche Use Cases relevant sind.

Für die Organspendeerkennung wird eine dedizierte Rolle mit einem Mix aus verpflichtenden und optionalen Profilen definiert, um die Implementierung für den Produktiveinsatz des Use Cases zu erleichtern und eine möglichst schlanke Rolle zu ermöglichen. 


## Anhänge (optional)
[//]: # (
<Verweise auf Dokumente, Prototypen o.Ä.>

