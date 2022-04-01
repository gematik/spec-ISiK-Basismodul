## Bestätigungsrelevante Systeme

Gemäß [§ 373 Abs. 2 SGB V](http://www.gesetze-im-internet.de/sgb_5/__373.html) definiert die Deutsche Krankenhausgesellschaft
Softwareprodukte eines informationstechnischen Systems im Krankenhaus, die eine offene und standardisierte Schnittstelle nach [§ 371 SGB V](http://www.gesetze-im-internet.de/sgb_5/__371.html)
integrieren müssen. 

### Definition
In die Definition einbezogen sind ausschließlich Softwareprodukte, die als zentrales
Informationssystem für ein Krankenhaus hergestellt und üblicherweise als
Krankenhausinformationssystem (KIS) oder Klinisches Arbeitsplatzsystem (KAS)
bezeichnet werden.
In diesen werden regelmäßig Patientendaten, Diagnosen und Prozeduren zum Zwecke der Abrechnung oder im Sinne einer elektronischen Patientenakte zusammengefasst.
Das definierte Softwareprodukt umfasst die an der
Bereitstellung der offenen und standardisierten Schnittstelle gemäß § 371 SGB V
beteiligten Systembestandteile und die Datenhaltung in dem Softwareprodukt (Persistenzebene).

Hinweise zu dieser Definition können an die [DKG-Geschäftsstelle](https://www.dkgev.de/dkg/verband-auf-einen-blick/geschaeftsstelle/) gerichtet werden.

### Umfang der Bestätigung
Ausschlaggebend für den Umfang der zu zertifizierenden Datenobjekte sind die Funktionalitäten der jeweiligen Systeme:

| Datenobjekt | verpflichtend für | 
|-
| CapabilityStatement | alle | 
| Patient/in (Patient) | alle |
| Kontakt/Fall (Encounter)| alle |
| Abrechnungsfall (Account)| alle |
| Katalog (CodeSystem)| alle |
| ValueSet (ValueSet)| alle |
| Diagnose (Condition) | Systeme, in denen Diagnosen (kodiert oder als Freitext) erfasst, verwaltet und angezeigt werden können|
| Prozedur (Procedure) | Systeme, in denen Prozeduren (kodiert oder als Freitext) erfasst, verwaltet und angezeigt werden können| 
| Versicherungsverhältnis (Coverage) | Systeme, in denen Versicherungsverhältnisse eines Patienten erfasst, verwaltet und angezeigt werden können | 
| Angehöriger (RelatedPerson) | optional* |
| Person im Gesundheitsberuf (Practitioner) | optional** |
| Bericht aus Subsystem (Bundle) | Systeme, in denen klinische Dokumente (strukturiert oder unstrukturiert) verwaltet und angezeigt werden können |

 \* kann in Verbindung mit dem Versicherungsverhältnis (Coverage) verwendet werden zur Abbildung von abweichenden Rechnungsempfängern oder Angaben zum/zur Hauptversicherten. Kontaktinformationen (z.B. Telefonnummer des Ehepartners) können in Patient.contact abgebildet werden
 
 \** kann in Verbindung mit Condition/Procedure verwendet werden um Angaben zur diagnostizierenden/behandelnden Person zu machen

### Kommunikationsserver und Fassaden
Herstellern bestätigungsrelevanter Systeme steht es frei, für die Umsetzung der ISiK-Vorgaben einen KOM-Server oder eine FHIR-Fassade eines Drittherstellers einzusetzen. Diese können die FHIR-konformen Anfragen in ein proprietäres Query-Format oder einen direkten Datenbankzugriff übersetzen. In diesem Fall bleibt jedoch der KIS-Hersteller für die Durchführung des Bestätigungsverfahrens verantwortlich und erhält die Bestätigung. Die eingesetzte Software des Drittherstellers wird hiermit – nur im Rahmen des Bestätigungsverfahrens – zu einem Bestandteil des Primärsystems.

### Freiwillige Bestätigung

#### Subsysteme
Hersteller von Systemen, welche in der Regel nicht als Primärsysteme eingesetzt werden ("Subsysteme"), die technischen Minimalvoraussetzungen aber dennoch erfüllen, können *auf freiwilliger Basis* an dem Bestätigungsverfahren teilnehmen. Dazu zählen beispielsweise Radiologieinformationssysteme (RIS), Laborinformationssysteme (LIS), Dokumentenverwaltungssysteme, Picture Archiving and Communication Systems (PACS) und Kommunikationsserver (KOM-Server) mit eigener Persistenz.


#### Kommunikationsserver mit eigener Persistenz
KOM-Server, die über eine eigene Persistenzebene verfügen und diese zum Beispiel aus HL7 Version 2-Nachrichten oder anderen Datenquellen befüllen, können *als eigenständiges System* auf freiwilliger Basis am Bestätigungsverfahren teilnehmen.

**Hinweis:** Obgleich die Menge der im Bestätigungsverfahren in Stufe 1 erforderlichen Datenobjekte und Attribute weitgehend mit den aus HL7 V2-Nachrichten verfügbaren Informationen überlappt, können in künftigen Ausbaustufen von ISiK weitere Datenobjekte und Attribute hinzukommen, die nicht üblicherweise per HL7 V2 kommuniziert werden (z.B. Vitalparameter, Terminplanung, Medikationsdaten), was dieser Architektur Grenzen setzt.

