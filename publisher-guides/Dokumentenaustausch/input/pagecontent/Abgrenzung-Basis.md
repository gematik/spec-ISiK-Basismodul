### Interaktion ISiK Modul Basis: Bericht aus Subsystem
* UseCase: Client übermittelt diverse strukturierte Informationen in Form eines Dokumentes an einen Empfänger. Der Empfänger (oder ggf. dessen Benutzer) kann selbst entscheiden, welche Informationen übernommen und ggf. weiterverarbeitet werden können/sollen. Als Minimum muss die Narrative (die HTML-Repräsentation des gesamten Dokumentes) übernommen werden.
* HTTP-verb: POST auf [base]
* Content: Bundle vom Typ `document`
* erforderliches Verhalten: der Empfänger verarbeitet den Inhalt des Dokumentes (HTML + Ressourcen soweit möglich), das Original muss nicht zwingend persistiert werden. Es besteht kein zwingendes Erfordernis, dass das Dokument oder seine Inhalte über die API wieder bereitgestellt werden können. 

### Interaktion ISiK Modul Dokumentenaustausch: Dokumentenbereitstellung
* Use Case: Client übermittelt ein strukturiertes Dokument zur inhaltsagnostischen, dauerhaften, ggf. rechtssicheren Archivierung
* HTTP-verb: POST auf [base]/DocumentReference
* Content: DocumentReference mit Base64-codiertem Bundle vom Typ `document` (eingebettet in DocumentReference.content.attachment.data)
* erforderliches Verhalten: das Dokument sowie seine Metadaten werden persistiert und über die API mittels der Interaktionen "Dokumentenabfrage" und "Dokumentenzugriff" bereitgestellt.

### Typische Szenarien mit Koexistenz beider Interaktionen:
Der Empfänger eines Subsystem-Berichtes gem. Modul "Basis" möchte vor der Verarbeitung des Dokumenteninhalts das Original zur Archivierung an einen Dokumentenserver gem. Modul "Dokumentenaustausch" übermitteln und die Herkunft der extrahierten Daten aus dem Dokument nachvollziehbar machen.

Empfohlenes Vorgehen:
1. Erzeugen einer DocumentReference-Ressource (siehe dazu $generate-metadata) 
2. Übermittlung der DocumentReference sowie des Base64-codierten Bundles gemäß [Interaktion ISiK Modul Dokumentenaustausch: Dokumentenbereitstellung](Interaktion-Dokumentenbereitstellung.html)
3. Extraktion der verarbeitbaren Ressourcen aus dem Bundle
4. Verlinkung zwischen den extrahierten Ressourcen und dem Original-Dokument mittels einer [`Provenance`-Ressource](https://hl7.org/fhir/R4/provenance.html).

Der Sender eines Subsystem-Berichtes gem. Modul "Basis" möchte parallel zur Übermittlung an z.B. ein KIS zur Weiterverarbeitung der Informationen das Dokument ebenfalls im Original archivieren lassen.

Empfohlenes Vorgehen:
1. Erzeugen einer DocumentReference-Ressource (siehe dazu $generate-metadata) 
2. Übermittlung der DocumentReference sowie des Base64-codierten Bundles gemäß [Interaktion ISiK Modul Dokumentenaustausch: Dokumentenbereitstellung](Interaktion-Dokumentenbereitstellung.html)
3. Übermittlung des Dokumentes zur Verarbeitung gemäß [Interaktion ISiK Modul Basis: Bericht aus Subsystem](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/StructureDefinition-ISiKBerichtSubSysteme.html)


Der Empfänger eines Dokumentes gem. Modul "Dokumentenaustausch" möchte neben der Archivierung des Dokumentes auch dessen Inhalte weiterverarbeiten.

Empfohlenes Vorgehen:
1. Entgegennahme und Persistierung des Original-Dokumentes gemäß {{pagelink:Dokumentenbereitstellung, text:Interaktion ISiK Modul Dokumentenaustausch: Dokumentenbereitstellung}}
1. Extraktion des Bundles aus den eingebetteten Binärdaten
2. Extraktion der verarbeitbaren Ressourcen aus dem Bundle
3. Verlinkung zwischen den extrahierten Ressourcen und dem Original-Dokument mittels einer [`Provenance`-Ressource](https://hl7.org/fhir/R4/provenance.html).