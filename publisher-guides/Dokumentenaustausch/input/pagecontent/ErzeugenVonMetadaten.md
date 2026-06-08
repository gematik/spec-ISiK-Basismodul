
### Hinweise und Anmerkungen zur Implementierung von IHE MHD ITI-106 (Generate Metadata)
Für die Implementierung der Interaktion "Erzeugen von Dokumentenmetadaten" gelten die in IHE MHD festgelegten Vereinbarungen zu [ITI-106](https://profiles.ihe.net/ITI/MHD/ITI-106.html) (Generate Metadata) gemäß der unten aufgelisteten Kapitel. Abweichungen bzw. zusätzliche Festlegungen im Kontext von ISiK sind im Folgenden zu den einzelnen Kapiteln vermerkt. Die verlinkte Webseite bietet weiterführende Informationen zur "Generate Metadata" Interaktion, einschließlich grafischer Darstellungen der Interaktionen.
Für Informationen zu einem historischen Breaking Change zwischen ISiK Stufe 2 und 3, siehe [Hinweis] (https://simplifier.net/guide/isik-dokumentenaustausch-stufe-5/Einfuehrung/Festlegungen/ErzeugenVonMetadaten?version=5.1.2).

#### [2:3.106.4.1 Generate Metadata Request Message](https://profiles.ihe.net/ITI/MHD/ITI-106.html#2310641-generate-metadata-request-message)

##### [2:3.106.4.1.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106411-trigger-events)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.106.4.1.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106412-message-semantics)
Die Vereinbarungen gelten uneingeschränkt.
##### [2:3.106.4.1.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-106.html#23106413-expected-actions)

Der Fokus für die Implementierung der Operation im ISiK-Kontext sollte auf dem Persistieren und Erzeugen von Metadaten für ISiK-konforme Bundles gemäß [Interaktion ISiK Modul Basis: Bericht aus Subsystem](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/StructureDefinition-ISiKBerichtSubSysteme.html) liegen. Für die Implementierung kann das unten angegeben ISiK-Spezifische Mapping Composition -> DocumentReference als Anhaltspunkt verwendet werden.


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
Es gelten die Vereinbarungen gemäß [dem CapabilityStatement](CapabilityStatement-ISiKCapabilityStatementDokumentenServerAkteur-expanded.html).

#### [2:3.106.5 Security Considerations](https://profiles.ihe.net/ITI/MHD/ITI-106.html#231065-security-considerations)

Für Hinweise zur Implementierung von Autorisation und Authentifikation im ISiK-Kontext, siehe [Modul ISiK-Connect](https://gemspec.gematik.de/ig/fhir/isik/connect/6.0.0-rc/index.html)



### ISiK-Spezifisches Mapping Composition -> DocumentReference
{% include composition-mapping-data.html %}

<table class="lines">
  <thead>
    <tr>
      <th>Path</th>
      <th>Map</th>
      <th>Comment</th>
    </tr>
  </thead>
  <tbody>
    {% for row in site.data.composition_mapping %}
    <tr>
      <td>{{ row.Path }}</td>
      <td>{{ row.Map }}</td>
      <td>{{ row.Comment | markdownify }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>



