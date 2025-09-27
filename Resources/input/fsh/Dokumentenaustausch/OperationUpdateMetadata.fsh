Instance: UpdateMetadata
InstanceOf: OperationDefinition
Usage: #example
Title: "update-metadata"
* insert MetaInstance
* url = "https://gematik.de/fhir/isik/OperationDefinition/UpdateMetadata"
* title = "Update document metadata"
* kind = #operation
* name = "UpdateMetadata"
* description = "
## Interaktion: Update von Metadaten, Löschen von Dokumenten

Die Operation ``UpdateMetadata`` ermöglicht es, unkritische Metadaten gezielt und kontrolliert zu aktualisieren oder vorläufige Dokumente durch Setzen des Status entered-in-error zuverlässig zu löschen, ohne ein neues Dokument anlegen zu müssen.

### Herstellung von Dokumentenkontext
Der Client muss zunächst die URL der DocumentReference ermitteln, auf die das Update angewendet werden soll. Hierzu kann die Interaktion {{pagelink:Dokumentenabfrage, text:Dokumentenabfrage}} verwendet werden.

### Metadatenupdate
Das Update der Metadaten erfolgt mittels der `$update-metadata` Operation.
Hinweis: Der zum Zeitpunkt der Erstellung dieser Spezifikation vorliegende IHE-MHD-Implementierungsleitfaden sieht kein Metadatenupdate vor. Hier müsste stets ein neues Dokument übermittelt werden.

Für den ISiK Use Case als maßgeblich relevant und unkritisch in Bezug auf die Versionierung hat sich jedoch das Element `docStatus`erwiesen, welches im IHE-Kontext keine Berücksichtigung findet. Im einrichtungsinternen Dokumentenaustausch kommt es häufig vor, dass sich der Status eines Dokumentes ändert (z.b. `preliminary` -> `final`), ohne dass dies Auswirkungen auf den Inhalt hat. Die Anlage eines neuen Dokumentes wäre in diesem Kontext nicht effizient.

Ebenso erlaubt diese Operation, vorläufige Dokumente durch ein Update von docStatus zu *löschen* (`preliminary` -> `entered-in-error` ). 

Wenn Dokumenten-Server $update-metadata unterstützen, dann MÜSSEN Dokumenten-Server das *Löschen* von vorläufigen Dokumenten unterstützen, d.h. dann MÜSSEN Server bei einem Update auf den Status `entered-in-error` auch den Code in `DocumentReference.status` auf  `entered-in-error` setzen und dafür Sorge tragen, dass diese Dokumente bei Suchanfragen nicht mehr als Ergebnisse zurückgegeben werden (siehe [Search Related Safety Checks](https://hl7.org/fhir/R4/safety.html)), es sei denn der Client sucht *explizit* nach gelöschten Dokumenten (z.B. `/DocumentReference?status=entered-in-error`). 

Sobald ein Dokument den Status `final` erreicht hat, MUSS ein Server  die Änderungen von Metadaten NICHT mehr zulassen (d.h. ein Server KANN in diesem Fall die Löschung finaler Dokumente erlauben, MUSS es aber nicht. Der Server KANN in diesem Fall auch eine Fehlermeldung ausgeben).

Finale Dokumente SOLLEN nur noch mit MHD-konformen Methoden aktualisiert bzw. gelöscht werden, indem sie durch eine neue bzw. leere Version ersetzt werden. 
Ein Client SOLL in diesem Fall eine erneute Dokumentenbereitstellung durchführen, mit Referenz auf das zu ersetzende Dokument in `DocumentReference.relatesTo.target` und dem Code `replaces` in `DocumentReference.relatesTo.code`.

| Hinweis | Experimentelle Funktion |
|---------|---------------------|
| <img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/>| Die Löschung vorläufiger Dokumente mittels $update-metadata ist experimentell. Entwickler, die diese Funktionalität nutzen, sind gebeten, im [Chat](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.5D.20Integration.20mittels.20MHD.20und.20ISiK.20-.20L.C3.B6schen.20von.20Doks/with/502563788) ein Feedback zu hinterlassen, ob sich diese Funktion implementierbar/nützlich oder komplex/problematisch erwiesen hat. Abhängig von der Rückmeldung kann dieses Feature in späteren Releases entweder verbindlich gemacht oder entfernt werden. |"
* code = #update-metadata
* affectsState = true
* comment = "
    Expected behaviour:
* Servers SHALL update the DocumentReference.docStatus with the submitted values
* Servers SHALL ensure that DocumentReference.text reflects this change
"
* resource = #DocumentReference
* system = false
* type = false
* instance = true
//* inputProfile = Canonical(UpdateMetadata)
//* outputProfile = Canonical(SubmitDocumentOutput)
* parameter[+]
  * name = #docStatus
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "new value for element `docStatus`"
  * type = #code
  * binding 
    * strength = #required 
    * valueSet = "http://hl7.org/fhir/ValueSet/composition-status"


Instance: ParametersExampleUpdateMetadata
InstanceOf: Parameters
Usage: #example
Description: "Example of an input parameter for the request body for the update-metadata operation" 
* parameter.name = "docStatus"
* parameter.valueCode = #final