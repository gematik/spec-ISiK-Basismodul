
# ADR-Organspende-002: Aufruf der Stationen für Vitalparameter-Server

Datum: 18.03.2026  

Status: Vorgeschlagen

[//]: #  (Status: <Vorgeschlagen | Angenommen | Abgelehnt | Verworfen | Ersetzt durch ADR-…)

Ticket: PTDATA-1954

## Kontext
[//]: #  (
<Kurzbeschreibung des Problems / der Ausgangssituation.  
Warum ist eine Entscheidung notwendig?  
Relevante Anforderungen, Randbedingungen, Annahmen.>
) 

Aktuell werden die beiden Profile Organization und Location nicht verpflichtend durch Basis-Server unterstützt. Spätestens für den Organspende Use-Case werden Abfragen auf diese Profile aber benötigt.


Bedarf-01: Für den Use Case Organspendeerkennung MUSS eine Liste aller Stationen auffindbar sein, um die Zuweisung von Leistungserbringern zu Stationen zu ermöglichen.
Bedarf-02: Für den Use Case Organspendeerkennung MUSS die Zuordnung von Patienten zur einer Station möglich sein, um die Abfrage von Patienten auf einer Station zu ermöglichen.


Eine Festlegung wie Stationen in ISIK Ressourcen abgebildet werden, ist für die Umsetzung des Use Cases notwendig, aber derzeit noch nicht gegeben. 

Anforderung-02: Es muss sichergestellt werden, dass die Stationen in einer Form abgebildet werden, die eine eindeutige Identifikation und Zuordnung von Leistungserbringern ermöglicht.

Annahme zur Anforderung-02: Die FHIR Ressource Practitioner genügt allein nicht, sondern der Practitioner muss über eine PractitionerRole mit einer Organisationseinheit (z. B. Station) - bzw. kann auch mit einer Location - verknüpft werden, um die Zuordnung zu ermöglichen.

## Optionen für die Abbildung von Stationen in ISIK Ressourcen
- als Organization allein
    - Contra: wiederspricht der bisherigen Annahme, dass ein Station grundlegend auch als ein Standort (physicalType = ward) abgebildet werden kann.
- als Location allein
    - Verkompliziert die Lösung, da eine direkte Zuweisung von Patienten nicht möglich (im Gegensatz zur Location)
- sowohl als Organization als auch Location, mit Verlinkung zwischen beiden Ressourcen
    - Pro: 
        - ermöglicht die Nutzung der bereits vorhandenen Ressourcen und deren Verlinkung (Patient -> Organization) bzw. vorgesehener Ressource (PractitionerRole -> Organization), um die Stationen abzubilden - ggf. Verknüpft mit anderen Organisationseinheiten.
        - ermöglicht bestehende Suchmöglichkeiten auf Organization zu nutzen, ohne neue Custom-Suchparameter zu definieren.
    - Contra:
        - erfordert ggf. die Pflege von zwei Ressourcen (Organization und Location) für jede Station



## Optionen für die Suche und Liste der Stationen
- <Alternative 1 – kurz + warum verworfen>
- Suche der Organization nach dem `type`-Code - z. B. `department`
    - Pro: die Suche nach dem `type`-Code `hospital` oder `department` in der Ressource Organization ist bereits möglich, da es sich um den physical Type handelt.
- Suche der Location per type
    - Contra: der Suchparameter `type` kann NICHT genutzt werden, da es sich nicht um den physical Type handelt.
    - Die Definition eines eigenen Suchparameters `location-type` für die Ressource Location erscheint für den Use Case nicht angebracht.

## Entscheidung
[//]: # (
<Konzise Beschreibung der getroffenen Entscheidung.  
Was wird getan / wie wird es gelöst?>
)
Was: 
- Stationen werden als Organization mit dem `type`-Code `department` abgebildet.
- Die Suche nach Stationen erfolgt über den `type`-Code `department` in der Ressource Organization.
- Die Verknüpfung von Leistungserbringern mit Stationen erfolgt über die Ressource PractitionerRole, die mit der entsprechenden Organization (Station) verknüpft ist.
- Patienten werden über die Ressource Patient mit der entsprechenden Station (Organization) verknüpft.
- Die Location (ggf. Station als Standort) wird nicht verpflichtend für die Abbildung von Stationen genutzt, sondern kann optional ergänzend verwendet werden, wenn weitere Informationen zum Standort der Station erforderlich sind.


## Konsequenzen
[//]: # (
<Positive und negative Auswirkungen der Entscheidung.  
Auswirkungen auf Qualitätseigenschaften, Kosten, Risiken, Betrieb, Wartung.>
)

- Der Worfklow der Organspende muss angepasst werden - d.h. die Abfragen dort zur Stationsliste und zur Abfrage von Patienten
- Zumindest ein beispiel für die Station als Organization mit dem `type`-Code `department` muss definiert werden (ggf. sogar ein abgeleteites Profil?)
- PractitionerRole muss eingeführt werden (ohnehin geplant), um die Lesitungserbringer mit der Station zu verknüpfen
    -> MS auf PracitionerRole.organization muss definiert werden, um die Verknüpfung von Leistungserbringern mit Stationen zu ermöglichen
    -> MS auf PractitionerRole.practitioner muss definiert werden, um die Verknüpfung von Leistungserbringern mit Stationen zu ermöglichen
- MS auf Patient.managingOrganization muss definiert werden, um die Verknüpfung von Patienten mit Stationen zu ermöglichen

## Anhänge (optional)
[//]: # (
<Verweise auf Dokumente, Prototypen o.Ä.>
)

    - 
