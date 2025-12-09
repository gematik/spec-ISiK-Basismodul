# Dokumentenabfrage - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Dokumentenabfrage**

## Dokumentenabfrage

## Dokumentenabfrage und -zugriff

### Dokumentenabfrage (IHE MHD ITI-67 (Find DocumentReferences))

Dokumente können anhand ihrer Metadaten gesucht werden. Im Rahmen der ISiK-Spezifikation müssen mindestens die im Kapitel mit `MUSS` gekennzeichneten Suchparameter unterstützt werden. Einzelnen Systemen steht es frei, darüber hinaus weitere FHIR-konforme Suchparameter zu implementieren.

Die Ergebnisse einer Suchanfrage werden in Form eines Bundles zurückgegeben:

Suchergebnisse können zahlreich sein. Server MÜSSEN daher [FHIR-konformes Paging](https://hl7.org/fhir/R4/http.html#paging) unterstützen. Server KÖNNEN im SearchSet-Bundle auch Ressourcen vom Typ [OperationOutcome](https://hl7.org/fhir/R4/operationoutcome.html) mit Informationen über die Suchergebnisse zurückgeben. Diese müssen in `Bundle.entry.search.mode` mit dem Wert `outcome` gekennzeichnet sein. Die Issues im OperationOutcome dürfen nur dem Schweregrad `information` oder `warning` entsprechen. Issues vom Schweregrad `error` oder `fatal` sind unzulässig.

### Hinweise und Anmerkungen zur Implementierung von IHE MHD ITI-67 (Find DocumentReferences)

Für die Implementierung der Interaktion “Dokumentenabfrage” gelten die in IHE MHD festgelegten Vereinbarungen zu [ITI-67 (Find DocumentReferences)](https://profiles.ihe.net/ITI/MHD/ITI-67.html) gemäß der unten aufgelisteten Kapitel. Abweichungen bzw. zusätzliche Festlegungen im Kontext von ISiK sind im Folgenden zu den einzelnen Kapiteln vermerkt.

#### 2:3.67.4.1 Find Document References Request Message

##### 2:3.67.4.1.1 Trigger Events

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.67.4.1.2 Message Semantics

Es gelten darüber hinaus die allgemeinen Festlegungen zu Suchparametern gemäß [ISiK Basisprofil Stufe](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/UebergreifendeFestlegungen_Suchparameter.page.md)

##### 2:3.67.4.1.2.1 Query Search Parameters

Im Rahmen der ISiK-Spezifikation müssen mindestens die im Kapitel mit `MUSS` gekennzeichneten Suchparameter unterstützt werden. Einzelnen Systemen steht es frei, darüber hinaus weitere FHIR-konforme bzw in IHE MHD geforderte Suchparameter zu implementieren.

Die in IHE bestehende Verpflichtung für Clients, bei jeder Query mindestens einen der Parameter `patient` oder `patient.identifier` verwenden zu müssen, besteht im ISiK-Kontext nicht. Patientenübergreifende Suchanfragen sind zulässig.

##### 2:3.67.4.1.2.2 Populating Expected Response Format

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.67.4.1.3 Expected Actions

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.67.4.1.3.1 XDS on FHIR Option

Die Implementierung der “XDS on FHIR”-Option ist im ISiK-Kontext nicht gefordert.

#### 2:3.67.4.2 Find Document References Response Message

##### 2:3.67.4.2.1 Trigger Events

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.67.4.2.2 Message Semantics

* Suchergebnisse können zahlreich sein. Server MÜSSEN daher [FHIR-konformes Paging](https://hl7.org/fhir/R4/http.html#paging) unterstützen. Server KÖNNEN im SearchSet-Bundle auch Ressourcen vom Typ [OperationOutcome](https://hl7.org/fhir/R4/operationoutcome.html) mit Informationen über die Suchergebnisse zurückgeben. Diese müssen in `Bundle.entry.search.mode` mit dem Wert `outcome` gekennzeichnet sein. Die Issues im OperationOutcome dürfen nur dem Schweregrad `information` oder `warning` entsprechen. Issues vom Schweregrad `error` oder `fatal` sind unzulässig.
* Das Ergebnis-Bundle der Suche muss konform sein zum Profil “ISiKDokumentenSuchergebnisse”

##### 2:3.67.4.2.2.1 DocumentReference Resource Contents

* Die DocumentReference-Ressoucen müssen im ISiK-Kontext auf Basis des Profils “ISiKDokumentenMetadaten” und den dort vereinbarten Kardinalitäten bzw. MustSupport-Flags erstellt werden.

##### 2:3.67.4.2.2.1.1 Document Location

Die Vereinbarungen gelten uneingeschränkt.

Alle weiteren Unterkapitel von [2:3.67.4.2.2.1 DocumentReference Resource Contents](https://profiles.ihe.net/ITI/MHD/ITI-67.html#23674221-documentreference-resource-contents) sind für den ISiK-Kontext nicht relevant.

#### 2:3.67.4.3 Expected Actions

Die Vereinbarungen gelten uneingeschränkt.

#### 2:3.67.4.4 CapabilityStatement Resource

Es gelten die Vereinbarungen gemäß

#### 2:3.67.5 Security Considerations

Für Hinweise zur Implementierung von Autorisation und Authentifikation im ISiK-Kontext, siehe [Modul ISiK-Sicherheit](https://simplifier.net/isik-sicherheit-v3).

#### Beispiele

* Suche anhand von Patientenkontext (PID) und Dokumentendatum: `[base]/DocumentReference?patient.identifier=1234&creation=gt2021-10-06`
* Suche nach vorläufigen Endoskopiebefunden (anhand KDL-Dokumenttyp und `docStatus`): `[base]/DocumentReference?type=http://dvmd.de/fhir/CodeSystem/kdl|DG02010&doc-status=preliminary`
* Suche von Dokumenten anhand der Nummer des Abrechnungsfalles: `[base]/DocumentReference?encounter.account:identifier=56789`

### Dokumentenzugriff (IHE MHD ITI-68 (Retrieve Document))

Das den Metadaten zugeordnete Dokument kann jeweils unter `DocumentReference.content.attachment.url` vom Server abgerufen werden.

### Hinweise und Anmerkungen zur Implementierung von IHE MHD ITI-68 (Retrieve Document)

Für die Implementierung der Interaktion “Dokumentenzugriff” gelten die in IHE MHD festgelegten Vereinbarungen zu [ITI-68 (Retrieve Document)](https://profiles.ihe.net/ITI/MHD/ITI-68.html) gemäß der unten aufgelisteten Kapitel. Abweichungen bzw. zusätzliche Festlegungen im Kontext von ISiK sind im Folgenden zu den einzelnen Kapiteln vermerkt. Die verlinkte Webseite bietet weiterführende Informationen zur “Retrieve Document” Interaktion, einschließlich grafischer Darstellungen der Interaktionen.

#### 2:3.68.4.1 Retrieve Document Request Message

##### 2:3.68.4.1.1 Trigger Events

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.68.4.1.2 Message Semantics

Der einzige MIME-Type, den alle Dokumentenserver verpflichtend zurückgeben können MÜSSEN, ist der MIME Type, der dem `DocumentReference.content.attachment.contentType` entspricht. Das bedeutet: Wenn das Dokument auf dem Server z. B. als PDF gespeichert ist, muss der Server nur dann antworten, wenn der Client explizit PDF akzeptiert. Der Server ist nicht verpflichtet, das Dokument in ein anderes Format wie z. B. JPEG zu konvertieren, nur weil der Client diesen Typ bevorzugen würde.

Im ISiK-Kontext SOLLEN Dokumentenserver das Dokument darüber hinaus über einen [Binary-Endpunkt](https://hl7.org/fhir/R4/binary.html) bereitstellen können. Dieser verfügt über folgende Besonderheit:

* Wenn der Zugriff mit dem Accept-Header `application/fhir+xml` oder `application/fhir+json` erfolgt, müssen die Daten als [Binary-Ressource im angeforderten Format](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Binary) zurückgegeben werden.
* Wenn der Zugriff mit einem **anderen** Accept-Header als `application/fhir+xml` oder `application/fhir+json` erfolgt, so soll das Dokument im angeforderten Format zurückgegeben werden, z.B. MUSS bei Zugriffen mit Accept-Header `application/pdf` das Dokument unmittelbar als PDF zurückgegeben werden, sofern dies dem Content-Type der Binary-Ressource entspricht.

##### 2:3.68.4.1.3 Expected Actions

Die Vereinbarungen gelten uneingeschränkt.

#### 2:3.68.4.2 Retrieve Document Response Message

Die Vereinbarungen dieses Kapitels und aller Unterkapitel gelten uneingeschränkt.

##### 2:3.68.4.2.1 Trigger Events

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.68.4.2.2 Message Semantics

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.68.4.3 Expected Actions

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.68.4.4 CapabilityStatement Resource

Es gelten die Vereinbarungen gemäß

#### 2:3.68.5 Security Considerations

Für Hinweise zur Implementierung von Autorisation und Authentifikation im ISiK-Kontext, siehe [Modul ISiK-Sicherheit](https://simplifier.net/isik-sicherheit-v3)

