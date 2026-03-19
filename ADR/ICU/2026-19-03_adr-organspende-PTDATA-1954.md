
# ADR-Organspende-PTDATA-1954: Aufruf der Stationen für Vitalparameter-Server

Datum: 19.03.2026  

Status: Angenommen

[//]: #  (Status: <Vorgeschlagen | Angenommen | Abgelehnt | Verworfen | Ersetzt durch ADR-…)

Ticket: PTDATA-1954

## Kontext
[//]: #  (
<Kurzbeschreibung des Problems / der Ausgangssituation.  
Warum ist eine Entscheidung notwendig?  
Relevante Anforderungen, Randbedingungen, Annahmen.>
) 

Aktuell werden die beiden Profile Organization und Location nicht verpflichtend durch Basis-Server oder andere ISiK-Systeme unterstützt. Spätestens für den Organspende Use-Case werden Abfragen auf diese Profile aber benötigt - insbesondere Abfragen  auf Vitalparameter-Server (z. B. PDMS).

Anforderungen: 
    - Für den Use Case Organspendeerkennung MUSS ein Client eine Liste aller Stationen aus einem Vitalparameter-Server abfragen können, um Client-Seitig die Zuweisung von Leistungserbringern zu Stationen zu ermöglichen (Annahme: Eine Server-Seitige Zuweisung wird nicht benötigt).
    - Für den Use Case Organspendeerkennung MUSS in einem Vitalparameter-Server die Zuordnung von Patienten zu einer Station möglich sein, um die Abfrage von Patienten auf einer Station zu ermöglichen. 

Annahmen: 
    - Eine Station ist sowohl eine Organisationseinheit als auch ein Standort eines Krankenhauses.
    - Die Zuordnung von Patienten zur Station ist Über die Relation Patient -> Encounter -> Organization bereits gegeben.


Eine Festlegung wie Stationen in ISIK Ressourcen abgebildet werden, ist für die Umsetzung des Use Cases notwendig, aber derzeit noch nicht gegeben.

## Optionen für die Abbildung von Stationen in ISIK Ressourcen
- Station sowohl als Organization als auch Location, mit Verlinkung zwischen beiden Ressourcen
    - Pro: 
        - ermöglicht die Nutzung der bereits vorhandenen Ressourcen und deren Verlinkung (optional auch: Patient -> Organization - für diesen UC aber nicht benötigt), um die Stationen abzubilden - ggf. Verknüpft mit anderen Organisationseinheiten.
        - ermöglicht bestehende Suchmöglichkeiten auf Organization zu nutzen, ohne neue Custom-Suchparameter zu definieren.
    - Contra:
        - erfordert ggf. die Pflege von zwei Ressourcen (Organization und Location) für jede Station
- als Organization allein
    - Contra: widerspricht der bisherigen Annahme, dass eine Station grundlegend auch als ein Standort (physicalType = ward) abgebildet werden kann.
    - Daher verworfen
- als Location allein
    - Contra: Verkompliziert die Lösung, da eine direkte Zuweisung von Patienten nicht möglich (im Gegensatz zur Location)
        - trägt auch nicht der Tatsache Rechnung, dass eine Station als Organisationseinheit ggf. verschiedene Stationen (Location) beaufsichtigt.
    - Daher verworfen


## Optionen für die Suche und Liste der Stationen
- Suche der Organization nach dem `type`-Code - z. B. `department`
    - Pro: die Suche nach dem `type`-Code `hospital` oder `department` in der Ressource Organization ist bereits möglich, da es sich um den physicalType handelt.
- Suche der Location per type
    - Contra: der Suchparameter `type` kann NICHT genutzt werden, da es sich nicht um den physical Type handelt.
    - Die Definition eines eigenen Suchparameters `location-physicalType` für die Ressource Location erscheint für den Use Case nicht angebracht.
    - Daher Verworfen

## Entscheidung
[//]: # (
<Konzise Beschreibung der getroffenen Entscheidung.  
Was wird getan / wie wird es gelöst?>
)
- Stationen werden als Organization mit dem `type`-Code `department` abgebildet.
- Die Suche nach Stationen erfolgt über den `type`-Code `department` in der Ressource Organization.
    - z. B. https://hapi.fhir.org/baseR4/Organization?type=department
    - hierfür Suchparameter im entsprechenden CapabilityStatement definieren, damit die Suche nach Stationen möglich ist.
        - für Basis-Server und für die Rolle Organspendeerkennung - bzw. zusätzlich für ICU-expanded
- Patienten werden über die Ressource Patient mit der entsprechenden Station (Organization) verknüpft. 
    - Die geschieht vermittelt über den Encounter
- Die Location (ggf. Station als Standort) wird nicht verpflichtend für die Abbildung von Stationen genutzt, sondern kann optional ergänzend verwendet werden, wenn weitere Informationen zum Standort der Station erforderlich sind.
- Ressource ISiKStandort (Location) bleibt allgemein MAY.

Umgesetzt:
- Der Workflow der Organspende muss angepasst werden - d.h. die Abfragen dort zur Stationsliste und zur Abfrage von Patienten
- Zumindest ein beispiel für die Station als Organization mit dem `type`-Code `department` muss definiert werden (ggf. sogar ein abgeleitetes Profil?)

Offene Fragen: 
- Für die weitere Konsolidierung innerhalb der gematik (i. e. mit VZD) kann die Profilierung eines Sub-Organization Profils (mit Parent ISiKOrganization) sinnvoll sein.
- Encounter.serviceProvider: hier Suchabfrage per Referenz möglich oder nur .identifier? Was ist hier sinnvoll?
- Ggf. Location.type als MS entfernen?
- eine klare Abgrenzung zwischen fachbereich und Station als ORganization - z. B. über Kodierung eines Elements - derzeit nicht gegeben; ist das ein Problem?

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
