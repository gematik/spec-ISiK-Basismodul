---
topic: AkteureUndInteraktionen-AkteureUndInteraktionen-ErzeugenVonMetadaten
---
----

## Erzeugen von Metadaten (IHE MHD ITI-106 Generate Metadata)

| Hinweis | Breaking Change!|
|---------|---------------------|
| <img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/piktogramme/Ampel%20auf%20Rot_Blau_gematik.svg" width="40"/>  | Die in der Stufe 3 erfolgte Umstellung der Definition von $generate-metadata von der in ISiK Stufe 2 spezifizierten OperationDefinition auf die in [IHE MHD ITI-106](https://profiles.ihe.net/ITI/MHD/ITI-106.html) spezifizierte Fassung ist nicht kompatibel zu den Festlegungen dieses Moduls in Stufe 2! Die Änderung dient dem Zweck der Harmonisierung mit der IHE-MHD-Interaktion ITI-106 (Generate Metadata), die zum Zeitpunkt des Releases von Stufe 2 noch nicht zur Verfügung stand.  |

### Hinweise und Anmerkungen zur Implementierung von IHE MHD ITI-106 (Generate Metadata)
Für die Implementierung der Interaktion "Erzeugen von Dokumentenmetadaten" gelten die in IHE MHD festgelegten Vereinbarungen zu [ITI-106](https://profiles.ihe.net/ITI/MHD/ITI-106.html) (Generate Metadata) gemäß der unten aufgelisteten Kapitel. Abweichungen bzw. zusätzliche Festlegungen im Kontext von ISiK sind im Folgenden zu den einzelnen Kapiteln vermerkt. Die verlinkte Webseite bietet weiterführende Informationen zur "Generate Metadata" Interaktion, einschließlich grafischer Darstellungen der Interaktionen.

#### [2:3.106.4.1 Generate Metadata Request Message](https://profiles.ihe.net/ITI/MHD/ITI-106.html#2310641-generate-metadata-request-message)

##### [2:3.106.4.1.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106411-trigger-events)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.106.4.1.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106412-message-semantics)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.106.4.1.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106413-expected-actions)

Der Fokus für die Implementierung der Operation ISiK-Kontext sollte auf dem Persistieren und Erzeugen von Metadaten für ISiK-konforme Bundles gemäß [Interaktion ISiK Modul Basis: Bericht aus Subsystem](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_BerichtSubsystem) liegen. Für die Implementierung kann das unten angegeben ISiK-Spezifische Mapping Composition -> DocumentReference als Anhaltspunkt verwendet werden.


Die Unterstützung weiterer Input-Formate (z.B. CDA oder andere FHIR-Dokumente, wie MIOs, eRezept, eAU etc.) ist optional.

Alle weiteren Unterkapitel von 2:3.106.4.1.3 Expected Actions sind für den ISiK-Kontext nicht relevant.

#### [2:3.106.4.2 Generate Metadata Response Message](https://profiles.ihe.net/ITI/MHD/ITI-106.html#2310642-generate-metadata-response-message)

##### [2:3.106.4.2.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106421-trigger-events)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.106.4.2.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106422-message-semantics)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.106.4.2.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106423-expected-actions)
Die Vereinbarungen gelten uneingeschränkt.

#### [2:3.106.4.3 CapabilityStatement Resource](https://profiles.ihe.net/ITI/MHD/ITI-106.html#2310643-capabilitystatement-resource)
Es gelten die Vereinbarungen gemäß {{pagelink:/Einfuehrung/Artefakte/CapabilityStatements}}

#### [2:3.106.5 Security Considerations](https://profiles.ihe.net/ITI/MHD/ITI-106.html#231065-security-considerations)

Für Hinweise zur Implementierung von Autorisation und Authentifikation im ISiK-Kontext, siehe [Modul ISiK-Connect](https://simplifier.net/guide/isik-connect-stufe-5)



### ISiK-Spezifisches Mapping Composition -> DocumentReference
<fql>
      from StructureDefinition
      where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenMetadaten'
      for differential.element
      select
        Path: id,
        join mapping.where(identity = 'CompositionDocumentReferenceMapping') { map, comment }
</fql>



