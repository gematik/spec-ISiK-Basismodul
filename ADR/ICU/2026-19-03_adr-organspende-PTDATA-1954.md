
# ADR-Organspende-PTDATA-1954: Aufruf der Stationen für Vitalparameter-Server

Datum: 20.03.2026  

Status: Vorgeschlagen

[//]: #  (Status: <Vorgeschlagen | Angenommen | Verworfen | Ersetzt durch ADR-…)

Ticket: PTDATA-1954

## Kontext
[//]: #  (
<Kurzbeschreibung des Problems / der Ausgangssituation.  
Warum ist eine Entscheidung notwendig?  
Relevante Anforderungen, Randbedingungen, Annahmen.>
) 

Aktuell werden die beiden Profile Organization und Location nicht verpflichtend durch Basis-Server oder andere ISiK-Systeme unterstützt. Spätestens für den Organspende Use-Case werden Abfragen auf die Profile aber benötigt - insbesondere Abfragen auf Vitalparameter-Server (z. B. PDMS).

Anforderungen: 
    - Für den Use Case Organspendeerkennung MUSS ein Client eine Liste aller Stationen aus einem Vitalparameter-Server abfragen können, um Client-Seitig die Zuweisung von Leistungserbringern zu Stationen zu ermöglichen (Annahme: Eine Server-Seitige Zuweisung wird nicht benötigt).
    - Für den Use Case Organspendeerkennung MUSS in einem Vitalparameter-Server die Zuordnung von Patienten zu einer Station möglich sein, um die Abfrage von Patienten auf einer Station zu ermöglichen. 

Annahmen: 
    - Eine Station ist sowohl eine Organisationseinheit als auch ein Standort eines Krankenhauses.
    - Die Zuordnung von Patienten zur Station ist in ISiK Über die Rereference Patient -> Encounter -> Organization oder auch Patient -> Encounter.location.identifier (inkl. Display) bereits gegeben.

Eine Festlegung wie Stationen in ISIK Ressourcen abgebildet werden, ist für die Umsetzung des Use Cases notwendig, aber derzeit noch nicht gegeben.

## Optionen für die Abbildung von Stationen in ISIK Ressourcen
- als Location allein
    - Contra:
        - trägt zwar nicht der Tatsache Rechnung, dass eine Station als Organisationseinheit abgebildet werden kann (z. B. zur Personal-zuweisung); zugleich erscheint dies z. Z. kein dringender BEdarf zu sein, so kann Personal auch direkt einer Location zugewiesen werden (siehe PractitionerROle.location).
    - zusätzlicher Custom-Suchparameter auf Location.physicalType notwendig ; dafür aber einfach mit Location.physicalType = wa | "Ward"
        - alternativ auch Suche auf Location.type - wobei hier Gefahr bei REcall (falsch-negativ), da Kodierung unklar (könnte "hospital unit", "intensive care unit" , "pediactric care intensive care unit" et. sein)
    - Pro
        - klare Zuweisung, dass eine Station immer eine Location ist und eine Fachabteilung immer eine Location; d.h. auch besserer Recall (alle Stationen werden gefunden bei der Suche) und hohe Precision (keine FA wir als Location ausgegeben).
        - Location-Zuweisung bereits im Encounter.location.identifier selbst gegeben
- Station sowohl als Organization als auch Location, mit Verlinkung zwischen beiden Ressourcen
    - Pro: 
        - ermöglicht die Nutzung der bereits vorhandenen Ressourcen und deren Verlinkung (optional auch: Patient -> Organization - für diesen UC aber nicht benötigt), um die Stationen abzubilden - ggf. Verknüpft mit anderen Organisationseinheiten.
        - ermöglicht bestehende Suchmöglichkeiten auf Organization zu nutzen, ohne neue Custom-Suchparameter zu definieren.
    - Contra:
        - erfordert ggf. die Pflege von zwei Ressourcen (Organization und Location) für jede Station
        - Die Abbildung einer Station als Organization schafft unnötige Komplexität und zusätzlich Probleme in der Suche, da eine klare Abgrenzung (mittels Kodierung) zwischen einer Station (als Organization) und einer Fachabteilung nicht möglich ist; Konsequenz wäre auch eine niedrige Precision (viele Fachabteilungen bei einer Suche nach Stationen inkludiert)
    - Besonders die fehlende Abgrenzung und ihre Konsequenzen ist problematischer als die Einführung eines Custom-Suchparameters (s.o.); daher verworfen.
- als Organization allein
    - Contra: widerspricht der bisherigen Annahme, dass eine Station grundlegend auch als ein Standort (physicalType = ward) abgebildet werden können muss (siehe Encounter.location-Slice "Station").
    - Daher verworfen

## Entscheidung
[//]: # (
<Konzise Beschreibung der getroffenen Entscheidung.  
Was wird getan / wie wird es gelöst?>
)
- Stationen werden als Locarion mit dem `physicalType`-Code `ward` abgebildet.
- Die Suche nach Stationen erfolgt über den `physicalTypetype`-Code `department` in der Ressource Location.
    - hierfür Custom-Suchparameter definieren und
    - im entsprechenden CapabilityStatement festlegen, damit die Suche nach Stationen möglich ist.
        - für Basis-Server und für die Rolle Organspendeerkennung - bzw. zusätzlich für ICU-expanded
- Patienten werden über die Ressource Patient mit der entsprechenden Station (Location) verknüpft. 
    - Die geschieht vermittelt über den Encounter
- Die Location (ggf. Station als Standort) wird  verpflichtend für die Abbildung von Stationen genutzt, sondern kann optional ergänzend verwendet werden, wenn weitere Informationen zum Standort der Station erforderlich sind.
- Ressource ISiKStandort (Location) wird allgemein verpflichtend (MUSS).

Offene Fragen: 
- Die Zuordnung zwischen Location und Organization (ggf. FA) sollte weiter geklärt werden.
- Für die weitere Konsolidierung innerhalb der gematik (i. e. mit VZD) kann die Profilierung eines Sub-Organization Profils (mit Parent ISiKOrganization) sinnvoll sein.
- Encounter.serviceProvider: hier Suchabfrage per Referenz möglich oder nur .identifier? Was ist hier sinnvoll?
- Ggf. Location.type als MS entfernen?

## Konsequenzen
[//]: # (
<Positive und negative Auswirkungen der Entscheidung.  
Auswirkungen auf Qualitätseigenschaften, Kosten, Risiken, Betrieb, Wartung.>
)
- Basis-Server müssen mindestens den gleichen Funktionsumfang bezüglich der Organization, Location und Patient vorweisen, wie Vitalparameter-Server.


## Anhänge (optional)
[//]: # (
<Verweise auf Dokumente, Prototypen o.Ä.>
)

- Siehe Update zum Sequenzdiagramm mit Organisationsbezug: Material\Organspendeerkennung\diagrams\sequenzdiagramm-abfragen-org-based.mermaid
    - 
