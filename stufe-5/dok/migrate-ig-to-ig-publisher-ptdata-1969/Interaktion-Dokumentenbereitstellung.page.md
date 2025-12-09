# Interaktion Dokumentenbereitstellung - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Interaktion Dokumentenbereitstellung**

## Interaktion Dokumentenbereitstellung

-------

## Interaktion: Dokumentenbereitstellung

### Dokumentenbereitstellung (IHE MHD ITI-105 (Simplified Publish))

Die Dokumentenbereitstellung erfolgt mittels [IHE MHD ITI-105 (Simplified Publish)](https://profiles.ihe.net/ITI/MHD/ITI-105.html). Die verlinkte Webseite bietet weiterführende Informationen zum Simplified Push, einschließlich grafischer Darstellungen der Interaktionen.

Die Bereitstellung des Dokumentes vom Client an den Server erfolgt mittels einer [CREATE-Interaktion](https://hl7.org/fhir/R4/http.html#create) auf dem Ressourcentyp DocumentReference. Das anzulegende Dokument wird im Body der Interaktion übermittelt. Es gelten die Vorgaben der FHIR-Kernspezifikation für den Rückgabewert der Create-Interaktion, siehe [Managing Return Content](https://www.hl7.org/fhir/R4/http.html#return).

### Hinweise und Anmerkungen zur Implementierung von ITI-105 (Simplified Publish) im Kontext von ISiK

Für die Implementierung der Interaktion “Dokumentenbereitstellung” gelten die in IHE MHD festgelegten Vereinbarungen zu [ITI-105](https://profiles.ihe.net/ITI/MHD/ITI-105.html) gemäß der unten aufgelisteten Kapitel. Abweichungen bzw. zusätzliche Festlegungen im Kontext von ISiK sind im Folgenden zu den einzelnen Kapiteln vermerkt.

#### 2:3.105.4.1 Simplified Publish Request Message

##### 2:3.105.4.1.1 Trigger Events

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.105.4.1.2 Message Semantics

* Die übermittelte Ressource muss nur gegen das Profil “ISiKDokumentenMetadaten” valide sein, nicht gegen die IHE-DocumentReference-Profile, da die Bereitstellung des Elementes `DocumentReference.docStatus` im ISiK-Kontext erlaubt, im IHE-Kontext jedoch verboten ist.
* Für Clients ist es ausreichend, das Dokument mit Hilfe eines KDL-Codes in DocumentReference.type zu klassifizieren. Die entsprechenden XDS-Class- und -Type-Codes müssen vom Server bei der Verarbeitung ergänzt werden. DocumentReference.category kann bei der Dokumentenbereitstellung leer bleiben.

##### 2:3.105.4.1.2.1 DocumentReference Resources

* Die DocumentReference-Ressoucen müssen im ISiK-Kontext auf Basis des Profils “ISiKDokumentenMetadaten” und den dort vereinbarten Kardinalitäten bzw. MustSupport-Flags erstellt werden.
* Die Verwendung von Contained-Ressourcen ist im ISiK-Kontext nicht erlaubt

##### 2:3.105.4.1.2.2 Patient Identity

* Der Client KANN eine der im Kapitel “Herstellung von Patient- und Encounterkontext” beschriebenen Optionen verwenden, um den Patienten- und Encounter-Kontext zu etablieren.
* Die Vereinbarungen gelten uneingeschränkt.

**Hinweis**: Dies bedeutet, dass inhaltliche Updates von Dokumenten, in Abgrenzung zu Updates von Dokumentenmetadaten, durch den Client als neue Create-Interaktion durchgeführt werden muss. Update-Interaktionen sind in diesem Kontext undefiniert. Das Dokument, welches das Update repräsentiert, muss eine entsprechende relatesTo-Relation zum vorherigen Dokument aufweisen. Der Status des vorherigen Dokumentes MUSS durch den Server auf `superseded` gesetzt werden.

##### 2:3.105.4.1.3 Expected Actions

* Die Erzeugung einer SubmissionSet Ressource durch den Server ist im ISiK-Kontext nicht erforderlich.
* Der Server muss ggf. fehlende XDS-Class- und -Type-Codes anhand des übermittelten KDL-Codes ergänzen und in DocumentReference.type bzw. DocumentReference.category zurückliefern. Die XDS-Codes können über die im Rahmen der [KDL-Spezifikation](https://simplifier.net/kdl) publizierten [ConceptMaps](https://simplifier.net/kdl/~resources?category=ConceptMap) aus dem KDL-Code ermittelt werden. Die XDS-Codes werden für den einrichtungsübergreifenden Dokumentenaustausch über IHE XDS, bzw. MHD oder für die Bereitstellung der Dokumente an die ePA des Patienten benötigt.

##### 2:3.105.4.1.3.1 Grouping with Actors in other Document Sharing Profiles

Das Kapitel ist für den ISiK-Kontext nicht relevant.

#### 2:3.105.4.2 Simplified Publish Response Message

##### 2:3.105.4.2.1 Trigger Events

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.105.4.2.2 Message Semantics

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.105.4.2.3 Expected Actions

Die Vereinbarungen gelten uneingeschränkt.

#### 2:3.105.4.3 CapabilityStatement Resource

Es gelten die Vereinbarungen gemäß

### 2:3.105.5 Security Considerations

Für Hinweise zur Implementierung von Autorisation und Authentifikation im ISiK-Kontext, siehe [Modul ISiK-Connect](https://simplifier.net/guide/isik-connect-stufe-5)

### Herstellung von Patient- und Encounterkontext

Vor der Bereitstellung von Dokumenten muss ein Client einen Patienten- und Encounterkontext herstellen, damit das Dokument serverseitig anhand der Patient- und Encounter-Verlinkungen in der DocumentReference korrekt zugeordnet werden kann. Zur Herstellung des Kontextes sind die in ISiK Basis beschriebenen Verfahren möglich: https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/UebergreifendeFestlegungen/Patient-Besuch-Kontext

Zusätzlich kann der Bezug mit Hilfe einer Logischen Referenz hergestellt werden. Dieses Verfahren ist experimentell und derzeit nur auf die Herstellung des Patientenkontextes begrenzt:

Der Client übermittelt in `DocumentReference.subject.identifier` einen Identifier, über den im Dokumentensystem ein eindeutiger Bezug hergestellt werden kann (z.B. eine einrichtungsinterne PID oder eine Krankenversichertenummer). Das Dokumentensystem (Server) muss dann bei der Verarbeitung den Identifier (unter Berücksichtigung von `system` und `value`) auflösen und durch eine Referenz auf die entsprechende lokale Patienten-Ressource substituieren. Typische UseCases hierfür sind u.A.:

* die Konvertierung von HL7 V2 MDM-Nachrichten in eine FHIR-REST-Interaktion
* die Übernahme von Patienten über die kommende REST-basierte Möglichkeit, Dokumente aus der ePA eines Patienten abzurufen (auch hier werden voraussichtlich ausschließlich DocumentReference-Ressourcen mit der Versichertennummer als logischer Referenz auf den Patienten bereitgestellt)

Server, die eine Zuordnung von Dokumenten mittels logischer Referenz erlauben, MÜSSEN dies im `CapabilityStatement` für den Ressourcentyp `DocumentReference` unter CapabilityStatement.rest.resource.referencePolicy` kenntlich machen:

* Der Code `resolves` ist zu verwenden wenn logical Identifier erlaubt sind, aber stets auflösbar sein müssen (Trifft ein Identifier aus einen oder mehrere Patienten zu, stellt dies einen Fehlerzustand dar.)
* Der Code `logical` ist **zusätzlich** anzugeben, wenn der Server auch DocumentReferences akzeptiert, denen kein Patient zugeordnet werden kann (z.B. in Erwartung, dass dieser zu einem späteren Zeitpunkt ergänzt wird).
* Clients sind verpflichtet **vor** der Verwendung von DocumentReferences mit logischen Referenzen anhand des CapabilityStatements zu überprüfen, ob ein konkreter Server diese Funktionalität unterstützt.

Weitere Hinweise siehe https://hl7.org/fhir/R4/references.html#logical

| | |
| :--- | :--- |
| ![](https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg) | Die Zuordnung mittels logischer Identifier ist bisher nicht erprobt. Entwickler, die diese Funktionalität nutzen, sind gebeten, im[Chat](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.2C.20VITAL.2C.20MED.5D.20Herstellung.20von.20Patienten-.20und.20Fallkontext)ein Feedback zu hinterlassen, ob sich diese Funktion implementierbar/nützlich oder komplex/problematisch erwiesen hat. Abhängig von der Rückmeldung kann dieses Feature in späteren Releases entweder verbindlich gemacht oder entfernt werden. |

### Beispiel

`POST [base]/DocumentReference`

**Hinweis:** Die Binary-Ressourcen sind der Lesbarkeit halber verkürzt dargestellt!

