---
topic: AkteureUndInteraktionen-AkteureUndInteraktionen-Update
---


## Interaktion: Update von Metadaten, Löschen von Dokumenten

### Herstellung von Dokumentenkontext
Der Client muss zunächst die URL der DocumentReference ermitteln, auf die das Update angewendet werden soll. Hierzu kann die Interaktion {{pagelink:Dokumentenabfrage, text:Dokumentenabfrage}} verwendet werden.

### Metadatenupdate
Das Update der Metadaten erfolgt mittels der `$update-metadata` Operation.
Hinweis: Der zum Zeitpunkt der Erstellung dieser Spezifikation vorliegende IHE-MHD-Implementierungsleitfaden sieht kein Metadatenupdate vor. Hier müsste stets ein neues Dokument übermittelt werden.

Für den ISiK Use Case als maßgeblich relevant und unkritisch in Bezug auf die Versionierung hat sich jedoch das Element `docStatus`erwiesen, welches im IHE-Kontext keine Berücksichtigung findet. Im einrichtungsinternen Dokumentenaustausch kommt es häufig vor, dass sich der Status eines Dokumentes ändert (z.b. `preliminary` -> `final`), ohne dass dies Auswirkungen auf den Inhalt hat. Die Anlage eines neuen Dokumentes wäre in diesem Kontext nicht effizient.

Ebenso erlaubt diese Operation, vorläufige Dokumente durch ein Update von docStatus zu *löschen* (`preliminary` -> `entered-in-error` ). Server MÜSSEN bei einem Update auf den Status `entered-in-error` auch den Code in `DocumentReference.status` auf  `entered-in-error` setzen und dafür Sorge tragen, dass diese Dokumente bei Suchanfragen nicht mehr als Ergebnisse zurückgegeben werden (siehe [Search Related Safety Checks](https://hl7.org/fhir/R4/safety.html)), es sei denn der Client sucht *explizit* nach gelöschten Dokumenten (z.B. `/DocumentReference?status=entered-in-error`). 

Sobald ein Dokument den Status `final` erreicht hat, muss ein Server  keine Metadaten-Änderungen mehr zulassen. Finale Dokumente können nur noch mit MHD-konformen Methoden aktualisiert bzw. gelöscht werden, indem sie durch eine neue bzw. leere Version ersetzt werden. Konkret muss in diesem Fall eine erneute Dokumentenbereitstellung durchgeführt werden, mit Referenz auf das zu ersetzende Dokument in `DocumentReference.relatesTo.target` und dem Code `replaces` in `DocumentReference.relatesTo.code`.

| Hinweis | Experimentelle Funktion |
|---------|---------------------|
| {{render:Material/_commons/icons/dragon.png}} | Die Löschung vorläufiger Dokumente mittels $update Metadata ist experimentell. Entwickler, die diese Funktionalität nutzen, sind gebeten, im [Chat](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.5D.20Integration.20mittels.20MHD.20und.20ISiK.20-.20L.C3.B6schen.20von.20Doks/with/502563788) ein Feedback zu hinterlassen, ob sich diese Funktion implementierbar/nützlich oder komplex/problematisch erwiesen hat. Abhängig von der Rückmeldung kann dieses Feature in späteren Releases entweder verbindlich gemacht oder entfernt werden. |


### OperationDefinition `$update-metadata`

{{render:https://gematik.de/fhir/isik/OperationDefinition/UpdateMetadata}}

### Beispiel 

    [base]/DocumentReference/example/$update-metadata?docStatus=final


| Hinweis | Work in Progress!|
|---------|---------------------|
| {{render:Material/images/ig_bilder_Warning.jpg}} |  Die hier vorliegende Definition der Operation dient als Vorschlag, der auf Basis von Implementierungserfahrungen weiterentwickelt werden soll. Kritik, Feedback und Verbesserungsvorschläge, insbesondere Use Cases für das Update weiterer Metadaten-Elemente bitte im [ISiK-Community-Chat](https://chat.fhir.org/#narrow/stream/287581-german.2Fisik) diskutieren! |
