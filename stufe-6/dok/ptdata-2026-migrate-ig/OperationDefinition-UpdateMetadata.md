# Update document metadata - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0-rc

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Update document metadata**

## OperationDefinition: Update document metadata 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/OperationDefinition/UpdateMetadata | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:UpdateMetadata |

 

## Interaktion: Update von Metadaten, Löschen von Dokumenten

 
Die Operation `UpdateMetadata` ermöglicht es, unkritische Metadaten gezielt und kontrolliert zu aktualisieren oder vorläufige Dokumente durch Setzen des Status entered-in-error zuverlässig zu löschen, ohne ein neues Dokument anlegen zu müssen. 

### Herstellung von Dokumentenkontext

 
Der Client muss zunächst die URL der DocumentReference ermitteln, auf die das Update angewendet werden soll. Hierzu kann die Interaktion {{pagelink:Dokumentenabfrage, text:Dokumentenabfrage}} verwendet werden. 

### Metadatenupdate

 
Das Update der Metadaten erfolgt mittels der `$update-metadata` Operation. Hinweis: Der zum Zeitpunkt der Erstellung dieser Spezifikation vorliegende IHE-MHD-Implementierungsleitfaden sieht kein Metadatenupdate vor. Hier müsste stets ein neues Dokument übermittelt werden. 
Für den ISiK Use Case als maßgeblich relevant und unkritisch in Bezug auf die Versionierung hat sich jedoch das Element `docStatus`erwiesen, welches im IHE-Kontext keine Berücksichtigung findet. Im einrichtungsinternen Dokumentenaustausch kommt es häufig vor, dass sich der Status eines Dokumentes ändert (z.b. `preliminary` -> `final`), ohne dass dies Auswirkungen auf den Inhalt hat. Die Anlage eines neuen Dokumentes wäre in diesem Kontext nicht effizient. 
Ebenso erlaubt diese Operation, vorläufige Dokumente durch ein Update von docStatus zu **löschen** (`preliminary` -> `entered-in-error` ). 
Wenn Dokumenten-Server $update-metadata unterstützen, dann MÜSSEN Dokumenten-Server das **Löschen** von vorläufigen Dokumenten unterstützen, d.h. dann MÜSSEN Server bei einem Update auf den Status `entered-in-error` auch den Code in `DocumentReference.status` auf `entered-in-error` setzen und dafür Sorge tragen, dass diese Dokumente bei Suchanfragen nicht mehr als Ergebnisse zurückgegeben werden (siehe [Search Related Safety Checks](https://hl7.org/fhir/R4/safety.html)), es sei denn der Client sucht **explizit** nach gelöschten Dokumenten (z.B. `/DocumentReference?status=entered-in-error`). 
Sobald ein Dokument den Status `final` erreicht hat, MUSS ein Server die Änderungen von Metadaten NICHT mehr zulassen (d.h. ein Server KANN in diesem Fall die Löschung finaler Dokumente erlauben, MUSS es aber nicht. Der Server KANN in diesem Fall auch eine Fehlermeldung ausgeben). 
Finale Dokumente SOLLEN nur noch mit MHD-konformen Methoden aktualisiert bzw. gelöscht werden, indem sie durch eine neue bzw. leere Version ersetzt werden. Ein Client SOLL in diesem Fall eine erneute Dokumentenbereitstellung durchführen, mit Referenz auf das zu ersetzende Dokument in `DocumentReference.relatesTo.target` und dem Code `replaces` in `DocumentReference.relatesTo.code`. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "UpdateMetadata",
  "url" : "https://gematik.de/fhir/isik/OperationDefinition/UpdateMetadata",
  "version" : "6.0.0-rc",
  "name" : "UpdateMetadata",
  "title" : "Update document metadata",
  "status" : "active",
  "kind" : "operation",
  "experimental" : false,
  "date" : "2025-12-17",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.gematik.de"
        }
      ]
    }
  ],
  "description" : "\n## Interaktion: Update von Metadaten, Löschen von Dokumenten\n\nDie Operation ``UpdateMetadata`` ermöglicht es, unkritische Metadaten gezielt und kontrolliert zu aktualisieren oder vorläufige Dokumente durch Setzen des Status entered-in-error zuverlässig zu löschen, ohne ein neues Dokument anlegen zu müssen.\n\n### Herstellung von Dokumentenkontext\nDer Client muss zunächst die URL der DocumentReference ermitteln, auf die das Update angewendet werden soll. Hierzu kann die Interaktion {{pagelink:Dokumentenabfrage, text:Dokumentenabfrage}} verwendet werden.\n\n### Metadatenupdate\nDas Update der Metadaten erfolgt mittels der `$update-metadata` Operation.\nHinweis: Der zum Zeitpunkt der Erstellung dieser Spezifikation vorliegende IHE-MHD-Implementierungsleitfaden sieht kein Metadatenupdate vor. Hier müsste stets ein neues Dokument übermittelt werden.\n\nFür den ISiK Use Case als maßgeblich relevant und unkritisch in Bezug auf die Versionierung hat sich jedoch das Element `docStatus`erwiesen, welches im IHE-Kontext keine Berücksichtigung findet. Im einrichtungsinternen Dokumentenaustausch kommt es häufig vor, dass sich der Status eines Dokumentes ändert (z.b. `preliminary` -> `final`), ohne dass dies Auswirkungen auf den Inhalt hat. Die Anlage eines neuen Dokumentes wäre in diesem Kontext nicht effizient.\n\nEbenso erlaubt diese Operation, vorläufige Dokumente durch ein Update von docStatus zu *löschen* (`preliminary` -> `entered-in-error` ). \n\nWenn Dokumenten-Server $update-metadata unterstützen, dann MÜSSEN Dokumenten-Server das *Löschen* von vorläufigen Dokumenten unterstützen, d.h. dann MÜSSEN Server bei einem Update auf den Status `entered-in-error` auch den Code in `DocumentReference.status` auf  `entered-in-error` setzen und dafür Sorge tragen, dass diese Dokumente bei Suchanfragen nicht mehr als Ergebnisse zurückgegeben werden (siehe [Search Related Safety Checks](https://hl7.org/fhir/R4/safety.html)), es sei denn der Client sucht *explizit* nach gelöschten Dokumenten (z.B. `/DocumentReference?status=entered-in-error`). \n\nSobald ein Dokument den Status `final` erreicht hat, MUSS ein Server  die Änderungen von Metadaten NICHT mehr zulassen (d.h. ein Server KANN in diesem Fall die Löschung finaler Dokumente erlauben, MUSS es aber nicht. Der Server KANN in diesem Fall auch eine Fehlermeldung ausgeben).\n\nFinale Dokumente SOLLEN nur noch mit MHD-konformen Methoden aktualisiert bzw. gelöscht werden, indem sie durch eine neue bzw. leere Version ersetzt werden. \nEin Client SOLL in diesem Fall eine erneute Dokumentenbereitstellung durchführen, mit Referenz auf das zu ersetzende Dokument in `DocumentReference.relatesTo.target` und dem Code `replaces` in `DocumentReference.relatesTo.code`.\n",
  "affectsState" : true,
  "code" : "update-metadata",
  "comment" : "\n    Expected behaviour:\n* Servers SHALL update the DocumentReference.docStatus with the submitted values\n* Servers SHALL ensure that DocumentReference.text reflects this change\n",
  "resource" : ["DocumentReference"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "parameter" : [
    {
      "name" : "docStatus",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "documentation" : "new value for element `docStatus`",
      "type" : "code",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/composition-status"
      }
    }
  ]
}

```
