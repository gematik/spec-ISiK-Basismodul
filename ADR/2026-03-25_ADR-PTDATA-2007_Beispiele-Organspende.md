# ADR-PTDATA-2007: Beispielinstanzen für Organspendeerkennung 

Datum: 2026-03-25 

Status: Vorgeschlagen

[//]: #  (Status: <Vorgeschlagen | Angenommen | Abgelehnt | Verworfen | Ersetzt durch ADR-…)

Ticket: PTDATA-XYZ

## Kontext
[//]: #  (
<Kurzbeschreibung des Problems / der Ausgangssituation.  
Warum ist eine Entscheidung notwendig?  
Relevante Anforderungen, Randbedingungen, Annahmen.>
) 
Für die Profile zur Organspendeerkennung sollen Beispielinstanzen erstellt werden, um die Profile zu härten, die Implementierung zu erleichtern und die Anwendbarkeit zu validieren. Es sollen Beispielinstanzen für die relevanten Ressourcen (z.B. Encounter, Patient, Station, Observation etc.) erstellt werden, die beschriebene Anwendungsfälle der Organspendeerkennung abbilden. Die Beispielinstanzen sollen auf realistischen (aber synthetischen) Daten basieren, die vom UKD bereitgestellt wurden (es wurden 100 Instanzen geliefert, aber es ist fraglich, ob alle sinvvoll sind)

Design-Entscheidungen bezüglich der Erstellung der Beispielinstanzen müssen getroffen werden, um sicherzustellen, dass die Instanzen konsistent, verständlich und repräsentativ für die Anwendungsfälle sind. Es müssen Entscheidungen getroffen werden bezüglich der Auswahl der Ressourcen und der abzubildenden Parameter-Ausprägungen.

Es gelten folgende Anforderungen:
- Es werden nur positive Beispiele erstellt, die die erwarteten Werte und Szenarien abbilden; d.h. KEINE Negativ-Beispiele mit falschen oder unvollständigen Daten.
- Für jeden angegebenen Parameter in der Excel MUSS mindestens eine Beispiel-Instanz erstellt werden.



## Optionen
- <Alternative 1 – kurz + warum verworfen>
- Auswahl einer Abdeckung entlang bestimmter Parameter-Kombinationen
    - Vollständige Abdeckung reicht für einzelne Parameter.
- Alle Instanzen auf Grundlage der 100 gelieferten Beispiele generieren
    - Kontra: Produziert Overhead (ohne, dass systematische Abdeckung unbdeingt gewährleistet wäre).

## Entscheidung
[//]: # (
<Konzise Beschreibung der getroffenen Entscheidung.  
Was wird getan / wie wird es gelöst?>
)

Es gelten die Anforderungen oben.
Zusätzlich gilt für zwei Parameter:
- Für die Pupillen-Reaktion MÜSSEN alle Parameter abgedeckt werden (aber es reicht für eine Seite - z.B. links oder rechts).
- Die Beatmungsmodus Parameter-Ausprägungen MÜSSEN alle abgedeckt werden, aber es muss KEIN Patientenfall konstruiert werden

## Konsequenzen
[//]: # (
<Positive und negative Auswirkungen der Entscheidung.  
Auswirkungen auf Qualitätseigenschaften, Kosten, Risiken, Betrieb, Wartung.>
)

## Anhänge (optional)
[//]: # (
<Verweise auf Dokumente, Prototypen o.Ä.>
)