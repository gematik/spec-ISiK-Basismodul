Profile: ISiKBerichtSubSysteme
Parent: Composition
Id: ISiKBerichtSubSysteme
Description: 
"Dieses Profil ermöglicht die krankenhaus-interne Übermittlung eines Berichtes bestehend aus beliebigen strukturierten FHIR-Ressourcen 
sowie einer textuellen HTML-Repräsentation (Narrative) an einen ISiK-Basis-kompatiblen Server.
### Motivation
In der heterogenen Systemlandschaft im Krankenhaus sind eine Vielzahl spezialisierter Subsysteme im Einsatz. Die Ergebnisse aus diesen Subsystemen sind aktuell jedoch häufig nicht in den Primärsystemen des Krankenhauses verfügbar, denn es bestehen folgende Herausforderungen:

Die Daten in Subsystemen sind sehr heterogen und können hochspezialisiert sein.
Bei der Nutzung dieser Subsysteme besteht häufig ein Interesse, auf die menschenlesbare Repräsentation der strukturierten Daten einwirken zu können.
Künftig ist mit Szenarien zu rechnen, bei denen Befunde aus Subsystemen in eine elektronische Patientenakte übertragen werden sollen.
Aktuell werden Befunde, obwohl diese in den Subsystemen in hochstrukturierter Form vorliegen, nur als PDF an das Primärsystem übermittelt. Oft weil kein strukturiertes Format spezifiziert ist, das sowohl versendendes Subsystem als auch empfangendes Primärsystem implementiert haben.
Der Umfang, in dem eine Datenübernahme in ein Primärsystem möglich ist, variiert stark zwischen den Systemen oder Installationen, z.B. abhängig davon, ob ein Modul für Vitalparameter installiert ist.
Die ISiK-Spezifikation begegnet diesen Herausforderungen, indem sie die Übermittlung von Ergebnissen aus Subsystemen an die Primärsysteme in Form von strukturierten Dokumenten erfordert, die über eine menschenlesbare Repräsentation verfügen. Diese strukturierten Dokumente werden im ISiK-Kontext als Berichte bezeichnet. Dabei sind die strukturierten Inhalte der Berichte harmonisiert mit den verbreiteten Formaten für Primärsysteme.

(Semi-)Strukturierte Dokumente werden in FHIR mit der `Composition`-Ressource repräsentiert, 
die die Dokumentenmetadaten sowie die textuelle Repräsentation des Dokumentes enthält.
Die Composition referenziert auf beliebige weiter FHIR-Ressourcen, die die strukturierten Komponenten des Dokumentes darstellen.

Für den Transport wird die Composition zusammen mit allen direkt oder indirekt referenzierten Ressourcen in eine `Bundle`-Ressource
 vom Typ `document` aggregiert. 
Das Document-Bundle trägt alle Eigenschaften eines Dokumentes: Abgeschlossenheit, Unveränderbarkeit, Signierbarkeit.  

Es obliegt dem empfangenden System, ob dieses Dokument lediglich in seiner Gesamtheit persistiert wird, oder ob darüber hinaus einzelne Bestandteile (Ressourcen) 
als strukturierte Daten automatisch oder auf Veranlassung eines Benutzers in die Patientenakte übernommen werden. 

In der aktuellen Ausbaustufe von ISiK ist lediglich die Übernahme und Anzeige der Dokument-Metadaten (z.B. Dokumenttyp, Dokumentdatum, Quelle) und der menschenlesbaren HTML-Repräsentation in die Primärsysteme erforderlich.  

In weiteren Ausbaustufen von ISiK soll darüber hinaus eine Übernahme der strukturierten Anteile der Dokumente möglich sein, die den ISiK-Spezifikationen entsprechen, z.B. Diagnosen und Prozeduren.  

### Kompatibilität  
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden."

* insert Meta
* insert CommonElements
* text 1.. MS
  * ^short = "Narrativ"
  * ^comment = "HTML-Repräsentation des Dokumenten-Headers.   
    Bitte Hinweise unter [Document Presentation](https://hl7.org/fhir/documents.html#presentation) beachten.  
    Der DokumentenHeader muss mindestens die folgenden Informationen enthalten:
* `Composition.subject:Patient.name.family`
* `Composition.subject:Patient.birthDate`
* `Composition.subject:Patient.identifier:pid`
* `Composition.status`
* `Composition.type.text`
* `Composition.date`
* `Composition.title`
* `Composition.author.display`"
  * status = #extensions (exactly)
  * status MS
  * div MS
* identifier 1.. MS
  * ^short = "Eindeutige Dokumenten-ID"
  * ^comment = """Eine vom erzeugenden Subsystem vergebene, eindeutige DokumentenID.  
  Wenn es sich bei dem verwendeten Identifier um eine OID oder UUID handelt, so ist hier der Wert `urn:ietf:rfc:3986` anzugeben und in `Identifier.value` das jeweilige Präfix `urn:uuid:` bzw. `urn:oid:` zu verwenden.  
  Beispiel:
```xml  
<identifier> 
    <system value="urn:ietf:rfc:3986">  
    <value value="urn:oid:2.16.840.1.113883.6.96"> 
</identifier>
```
"""
  * system MS
    * ^short = "Namensraum des Identifiers"
    * ^comment = "Hier ist stets der eindeutige Name (URL) des Namensraums anzugeben, 
    aus dem der Identifier stammt. 
    Hinweise zur Festlegung der URLs für lokale Namensräume sind in den 
    [Deutschen Basisprofilen](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Terminologie-Namensraeume?version=current) beschrieben.  
    **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher."
  * value MS
    * ^comment = "Enthält den eigentlichen Wert des Identifiers.  
    **Begründung Pflichtfeld:** Ist der Wert nicht bekannt, sollte der gesamte Slice weggelassen werden."
* status = #final (exactly)
  * ^short = "Status des Dokumentes"
  * ^comment = "Im Kontext diese Moduls ist nur der Austausch finaler Berichte vorgesehen. 
  Ein Mechanismus zur Änderung oder Ersetzung bereits übermittelter Daten ist derzeit nicht spezifiziert. 
  Hier ist stets der Wert `final` anzugeben."
* status MS
* type MS
  * ^short = "Dokumenttyp"
  * ^comment = "Begründung zu Must Support: Der Dokumenttyp ist für die Identifikation des Berichtes und die Zuordnung zu einem Subsystem für die weitere Verarbeitung erforderlich.

  *Hinweis für Implementierer:* 
  Der zu übermittelnde Bericht repräsentiert eine Zusammenfassung der strukturierten Daten aus dem Subsystem. Das Dokument KANN z.B. mittels KDL oder IHE-D-XDS-Typecodes klassifiziert werden.  
  Es KANN derzeit jedoch auch eine rein textuelle Beschreibung des Dokumenttyps angegeben werden.
  
  Während KDL-Codes eine feingranulare Dokumentenklassifikation für die gezielte Suche nach medizinischen und Administrativen Dokumenten ermöglichen,
  sind IHE-XDS-Type-Codes für den einrichtungsübergreifenden Dokumentenaustausch maßgeblich.
  Der XDS-Type-Code kann mit Hilfe der bereitgestellten [ConceptMaps](https://simplifier.net/kdl/~resources?category=ConceptMap)
  aus dem KDL-Code ermittelt werden.
  Weitere Typisierungen (z.B. nach SNOMED oder LOINC) sind uneingeschränkt erlaubt. [Konsens der Arbeitsgruppe vom 18.02.2022]. Im Falle, dass der Code 'UNK' entsprechend der ConceptMap verwendet werden soll, MUSS das System 'http://terminology.hl7.org/CodeSystem/v3-NullFlavor' verwendet werden.  
  "
  * text MS
    * ^short = "Dokumenttyp (Freitext)"
    * ^comment = "Freitextliche Beschreibung oder assoziierter Displaywert der primären Codierung des Dokumenttyps."
* type.coding 0.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains
    KDL 0..1 MS and
    XDS 0..1 MS
  * system 1..
  * code 1..
* type.coding[KDL] ^patternCoding.system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * system 1..
  * code 1..
    * obeys kdl-1
* type.coding[XDS] ^patternCoding.system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode"
  * system 1..
  * code 1..
* category MS
  * ^short = "Dokument-Kategorie"
  * ^comment = "Begründung zu Must Support: Die Klassifizierung kann zur Strukturierung der Berichte genutzt werden, in dem Fall, dass das Narrative des Berichts dem Benutzer angezeigt wird. Das Dokument KANN z.B. mittels LOINC oder IHE-D-XDS-Classcodes klassifiziert werden." 
* category.coding MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category.coding contains
    LOINC 0..1 MS and
    IHE 0..1 MS
* category.coding[LOINC] ^patternCoding.system = $loinc
  * system 1..
  * code 1..
* category.coding[IHE] ^patternCoding.system = "http://ihe-d.de/CodeSystems/IHEXDSclassCode"
  * system 1..
  * code 1..
* subject 1.. MS
  * ^short = "Patientenbezug"
  * ^comment = "**Begründung Must-Support:** Ein Patientenbezug des Dokument MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen."
  * reference 1.. MS
    * ^short = "Patienten-Link"
    * insert Comment-Reference-Subject(Begründung Pflichtfeld)
* encounter MS
  * ^short = "Aufenthaltsbezug"
  * ^comment = "**Begründung Must-Support:** Ein Aufenthaltsbezug des Dokument MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen."
  * reference 1.. MS
    * ^short = "Encounter-Link"
    * insert Comment-Reference-Encounter-with-hint(Begründung Pflichtfeld)
* date MS
  * ^short = "Dokumentendatum"
  * ^comment = "Datum der letzten Änderung des Dokumentes"
* author MS
  * ^short = "Verfasser/Ersteller des Dokumentes (Person oder Subsystem/Gerät)"
  * ^comment = "In der aktuellen Ausbaustufe von ISiK ist die Verwendung der textuellen Repräsentation (display) 
  von Autor und Subsystem ausreichend. 
  Die darüber hinausgehende Verlinkung auf Practitioner bzw. Device-Ressourcen 
  KANN implementiert werden."
* author only Reference(PractitionerRole or Device or Organization or RelatedPerson or Patient or Practitioner)
  * display 1.. MS
    * ^short = "Bezeichnung des Verfassers (Freitext)"
    * ^comment = "Freitextliche Bezeichnung des Verfassers (Person oder Subsystem/Gerät)"
* title MS
  * ^short = "Dokumentenbezeichnung"
  * ^comment = "Die Dokumentenbezeichnung dient der Darstellung des Dokumentes in einer Übersicht, 
  z.B. in einer Patientenakte, und KANN der schnellen Auffindbarkeit 
  eines gesuchten Dokumentes dienen. 
  Geeignete Bezeichnungen sind zum Beispiel:  
* 'Kleines Blutbild vom 13.10.2020'
* 'Pathologiebefund (Abstrich) vom 13.10.2020'
* 'Blutgasmessung vom 13.10.2020 14:14h'"
* section 1.. MS
  * ^short = "Kapitel"
  * ^comment = "Das Dokument kann in mehrere Kapitel und Unterkapitel gegliedert werden."
  * title 1.. MS
    * ^short = "Kapitelbezeichnung"
  * text 1.. MS 
    * ^short = "Narrativ"
    * ^comment = "menschenlesbare HTML-Repräsentation des Inhalts dieses Kapitels.  
    Hinweise: Für Aggregation einer vollständigen menschenlesbaren Repräsentation 
    MÜSSEN die Repräsentationen der einzelnen Kapitel an die Repräsentation 
    der Metadaten (Composition.text) angehängt werden. 
    Für die Separierung KÖNNEN einfache <div>-Tags verwendet werden. 
    Es ist zu beachten, dass Kapitel auch Unterkapitel enthalten KÖNNEN 
    (Composition.section.section), die bei der Aggregation entsprechend 
    berücksichtigt werden MÜSSEN.  
Die Mindestanforderungen an den Inhalt der menschenlesbaren Repräsentation umfasst folgende Informationen:
* `section.title` + Freitext oder
* `section.title` + `Resource.text` der referenzierten Ressource oder
* `section.title` + eine aggregierte Repräsentation von `Resource.text`,
    wenn in einer Section mehrere Ressourcen referenziert werden 
    (z.B. eine tabellarische Auflistung mehrere Blutdruckmesswerte, Diagnosen oder Allergien)."
  * section MS
    * ^short = "Unterkapitel"

Instance: CompositionExampleBlutdruck
InstanceOf: ISiKBerichtSubSysteme
Usage: #example
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">  <p> Familienname:Fürstin von Musterfrau</p>   <p> Geburtsdatum:1964-08-12</p>   <p> PID:TestPID</p>   <p> Bericht-Status:final</p>   <p> Bericht-Typ:Berichtzusammenfassung / Document Summary</p>   <p> Datum:03.05.2022</p>   <p> Titel:Blutdruckmessung vom 3.5.2022</p>   <p> Autor:Gerät XY, Fa. Z, Modell T</p></div>"
* identifier[0].type = $v2-0203#FILL
* identifier[=].system = "https://fhir.krankenhaus.example/sid/system-a/berichtnummer"
* identifier[=].value = "0123456789"
* status = #final
* type = $loinc#55112-7 
* type.text = "Kurzbericht"
* subject.reference = "urn:uuid:3bada18a-6fd2-11ed-a1eb-0242ac112345"
* encounter.reference = "urn:uuid:74b46c1a-6fc9-11ed-a1eb-0242ac198765"
* date = "2022-05-03"
* author.type = "Device"
* author.display = "Gerät XY, Fa. Z, Modell T"
* title = "Blutdruckmessung vom 3.5.2022"
* section[0].title = "Messung"
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b> Systolisch</b></td><td><b> Diastolisch</b></td><td><b> Einheit</b></td><td><b> Uhrzeit</b></td></tr><tr><td> \r\n\t\t\t\t\t\t\t140\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\t110\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\tmmHG\r\n\t\t\t\t\t\t</td><td> \r\n\t\t\t\t\t\t\t17:15h\r\n\t\t\t\t\t\t</td></tr></table></div>"

Invariant: kdl-1
Description: "KDL-Code ungültig"
Severity: #warning
Expression: "matches('^[A-Z]{2}[0-9]{6}$')"

Instance: CriticalPatient
InstanceOf: ISiKPatient
Title: "Patient Thomas Müller"
Description: "Patient mit hypertensivem Notfall, vorbereitet zur Verlegung auf die ICU"
Usage: #inline
* id = "11c3de2f-d461-4063-a0c2-fde122e76a79"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h3>Patient</h3>  <div><strong>ID:</strong><span>Patient/urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>  <div><strong>Patienten-Identifikator:</strong><ul><li><span><span>MR</span>: </span><span>1234567890</span><span> (https://example.org/fhir/sid/pid)</span></li></ul></div>  <div><strong>Name:</strong><span> Thomas <b>MÜLLER </b></span></div>  <div><strong>Geschlecht:</strong><span>male</span></div>  <div><strong>Geburtsdatum:</strong><span>11.04.1965</span></div>    </div>"
* meta.profile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
* identifier[Patientennummer].system = "https://example.org/fhir/sid/pid"
* identifier[Patientennummer].value = "1234567890"
* name[Name].family = "Müller"
* name[Name].given = "Thomas"
* gender = #male
* birthDate = "1965-04-11"

Instance: BloodPressureObservation
InstanceOf: ISiKBlutdruckSystemischArteriell
Usage: #inline
Title: "Hypertensiver Blutdruck - ICU-Aufnahme"
Description: "Kritischer Blutdruckwert (Systole 210 / Diastole 115 / MAP 140) vor Verlegung auf Intensivstation."
* id = "880d8c69-fc05-4e1f-8203-a8ff40007f84"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h3>Observation</h3>  <div><strong>Typ:</strong><span><span>85354-9</span><span> (http://loinc.org)</span></span></div>  <div><strong>Status:</strong><span>FINAL</span></div>  <div><strong>Kategorie:</strong><ul><li><span><span><span>vital-signs</span><span> (http://terminology.hl7.org/CodeSystem/observation-category)</span></span></span></li></ul></div>  <div><strong>Patient:</strong><span>urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>  <div><strong>Zeitpunkt:</strong><span>2025-07-22T14:10:00+02:00</span></div>    <div><strong>Messwerte:</strong><table style=\"border-collapse: collapse; width: 100%;\"><thead><tr style=\"background-color: #f2f2f2;\"><th style=\"border: 1px solid #ddd; padding: 8px;\">Parameter</th><th style=\"border: 1px solid #ddd; padding: 8px;\">Wert</th><th style=\"border: 1px solid #ddd; padding: 8px;\">Einheit</th></tr></thead><tbody><tr><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>  <span>Systolisch</span></span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>210</span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>mmHg</span></td></tr><tr><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>  <span>Diastolisch</span></span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>115</span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>mmHg</span></td></tr><tr><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>  <span>Mittlerer arterieller Druck</span></span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>140</span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>mmHg</span></td></tr></tbody></table></div>    </div>"
* status = #final
* subject = Reference(urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79)
* effectiveDateTime = "2025-07-22T14:10:00+02:00"
* component[SystolicBP]
  * valueQuantity = 210 'mm[Hg]' "mmHg"
* component[DiastolicBP]
  * valueQuantity = 115 'mm[Hg]' "mmHg"
* component[meanBP]
  * valueQuantity = 140 'mm[Hg]' "mmHg"

Instance: VentilationProcedure
InstanceOf: Procedure
Usage: #inline
Title: "Beatmung - ICU-Aufnahme"
* id = "61a2e9af-88f9-4ee2-a97f-c136530aadba"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h3>Prozedur</h3>    <div><strong>Typ:</strong><ul><li><span>Jet ventilation procedure (procedure)</span><span> (http://snomed.info/sct)</span></li></ul></div>  <div><strong>Status:</strong><span>COMPLETED</span></div>  <div><strong>Kategorie:</strong><span><ul><li><span>Artificial ventilation (regime/therapy)</span><span> (http://snomed.info/sct)</span></li></ul></span></div>  <div><strong>Patient:</strong><span>urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>    <div><strong>Durchführungszeitraum:</strong><span>21.07.2025 00:00</span><span> (laufend)</span></div>            </div>"
* category = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code = $sct#4764004 "Jet ventilation procedure (procedure)"
* status = #completed
* subject = Reference(urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79)
* performedPeriod
  * start = "2025-07-21"

Instance: VentilationPressureObservation
InstanceOf: Observation
Usage: #inline
Title: "Unterstützungsdruck Beatmung - ICU-Aufnahme"
* id = "32bb8c8a-418c-4fc2-b1c7-c33f1a99a464"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h3>Observation</h3>  <div><strong>Typ:</strong><span><span>Pressure support setting Ventilator</span><span> (http://loinc.org)</span></span></div>  <div><strong>Status:</strong><span>FINAL</span></div>  <div><strong>Kategorie:</strong><ul><li><span><span><span>Artificial ventilation (regime/therapy)</span><span> (http://snomed.info/sct)</span></span></span></li></ul></div>  <div><strong>Patient:</strong><span>urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>  <div><strong>Zeitpunkt:</strong><span>2025-07-21T00:00:00+02:00</span></div>  <div><strong>Wert:</strong><span>6</span><span>cm[H2O]</span></div>    <div><strong>Teil von:</strong><ul><li><span>urn:uuid:61a2e9af-88f9-4ee2-a97f-c136530aadba</span></li></ul></div>  </div>"
* partOf = Reference(urn:uuid:61a2e9af-88f9-4ee2-a97f-c136530aadba)
* status = #final
* category = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code = $loinc#20079-0 "Pressure support setting Ventilator"
* subject = Reference(urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79)
* effectiveDateTime = "2025-07-21T00:00:00+02:00"
* valueQuantity = 6 'cm[H2O]' "cm[H2O]"

Instance: CompositionExampleIntensivstation
InstanceOf: ISiKBerichtSubSysteme
Usage: #inline
* id = "54d0804f-c770-4b61-a175-28fa1875b2a9"
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2>Verlegungsbericht für Patient Herrn Thomas Müller (1234567890) - Intensivstation 0100</h2>  <div><strong>Dokument-ID:</strong><span>urn:uuid:54d0804f-c770-4b61-a175-28fa1875b2a9</span><span> (urn:ietf:rfc:3986)</span></div>  <div><strong>Status:</strong><span>final</span></div>  <div><strong>Dokumenttyp:</strong><span><span>Verlegungsbericht</span><span> (http://dvmd.de/fhir/CodeSystem/kdl)</span></span></div>  <div><strong>Erstellt am:</strong><span>21.07.2025 00:00</span></div>  <div><strong>Autor:</strong><ul><li><span>Dr. Alenia Vogt</span></li></ul></div>  <div><strong>Patient:</strong><span>urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>  <div><strong>Fall:</strong><span>urn:uuid:88bdd3e7-fbd1-42b8-bd9f-9afdf1e31d41</span></div> </div>"
* identifier[0].type = $v2-0203#FILL
* identifier[=].system = "urn:ietf:rfc:3986"
* identifier[=].value = "urn:uuid:54d0804f-c770-4b61-a175-28fa1875b2a9"
* type = $kdl#AD010116 "Verlegungsbericht"
* subject = Reference(urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79)
* encounter = Reference(urn:uuid:88bdd3e7-fbd1-42b8-bd9f-9afdf1e31d41)
* date = "2025-07-21T00:00:00+02:00"
* author
  * display = "Dr. Alenia Vogt"
* title = "Verlegungsbericht für Patient Herrn Thomas Müller (1234567890) - Intensivstation 0100"
* section[0]
  * title = "Beatmungswerte (Unterstützungsdruck) vom 22.07.2025 - #1"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div><h3>Observation</h3>    <div><strong>Typ:</strong><span><span>Pressure support setting Ventilator</span><span> (http://loinc.org)</span></span></div>    <div><strong>Status:</strong><span>FINAL</span></div>    <div><strong>Kategorie:</strong><ul><li><span><span><span>Artificial ventilation (regime/therapy)</span><span> (http://snomed.info/sct)</span></span></span></li></ul></div>    <div><strong>Patient:</strong><span>urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>    <div><strong>Zeitpunkt:</strong><span>2025-07-21T00:00:00+02:00</span></div>    <div><strong>Wert:</strong><span>6</span><span>cm[H2O]</span></div>        <div><strong>Teil von:</strong><ul><li><span>urn:uuid:61a2e9af-88f9-4ee2-a97f-c136530aadba</span></li></ul></div>    </div></div>"
  * entry[0] = Reference(urn:uuid:32bb8c8a-418c-4fc2-b1c7-c33f1a99a464)
* section[+]
  * title = "Patient"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h3>Patient</h3>    <div><strong>ID:</strong><span>Patient/urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>    <div><strong>Patienten-Identifikator:</strong><ul><li><span><span>MR</span>: </span><span>1234567890</span><span> (https://example.org/fhir/sid/pid)</span></li></ul></div>    <div><strong>Name:</strong><span> Thomas <b>MÜLLER </b></span></div>    <div><strong>Geschlecht:</strong><span>male</span></div>    <div><strong>Geburtsdatum:</strong><span>11.04.1965</span></div>        </div>"
  * entry[0] = Reference(urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79)
* section[+]
  * title = "Encounter"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2>Encounter</h2>    <div><strong>Fallnummer:</strong><span><span>ICU-2025-001</span><span> (https://example.org/fhir/sid/encounter-id)</span></span></div>    <div><strong>Status:</strong><span>in-progress</span></div>    <div><strong>Kontaktart:</strong><span>inpatient encounter</span></div>    <div><strong>Typ:</strong><ul><li><span><span><span>Abteilungskontakt</span><span> (http://fhir.de/CodeSystem/Kontaktebene)</span></span></span></li></ul></div>    <div><strong>Abteilung:</strong><span><span>Innere Medizin</span><span> (Code: 0100)</span></span></div>    <div><strong>Einrichtung:</strong><span>Intensivstation - Innere Medizin</span></div>    <div><strong>Patient:</strong><span>urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>    <div><strong>Zeitraum:</strong><span>21.07.2025 00:00</span><span> (laufend)</span></div>        </div>"
  * entry[0] = Reference(urn:uuid:88bdd3e7-fbd1-42b8-bd9f-9afdf1e31d41)
* section[+]
  * title = "Observation"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h3>Observation</h3>    <div><strong>Typ:</strong><span><span>85354-9</span><span> (http://loinc.org)</span></span></div>    <div><strong>Status:</strong><span>FINAL</span></div>    <div><strong>Kategorie:</strong><ul><li><span><span><span>vital-signs</span><span> (http://terminology.hl7.org/CodeSystem/observation-category)</span></span></span></li></ul></div>    <div><strong>Patient:</strong><span>urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>    <div><strong>Zeitpunkt:</strong><span>2025-07-22T14:10:00+02:00</span></div>        <div><strong>Messwerte:</strong><table style=\"border-collapse: collapse; width: 100%;\"><thead><tr style=\"background-color: #f2f2f2;\"><th style=\"border: 1px solid #ddd; padding: 8px;\">Parameter</th><th style=\"border: 1px solid #ddd; padding: 8px;\">Wert</th><th style=\"border: 1px solid #ddd; padding: 8px;\">Einheit</th></tr></thead><tbody><tr><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>    <span>Systolisch</span></span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>210</span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>mmHg</span></td></tr><tr><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>    <span>Diastolisch</span></span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>115</span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>mmHg</span></td></tr><tr><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>    <span>Mittlerer arterieller Druck</span></span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>140</span></td><td style=\"border: 1px solid #ddd; padding: 8px;\"><span>mmHg</span></td></tr></tbody></table></div>        </div>"
  * entry[0] = Reference(urn:uuid:880d8c69-fc05-4e1f-8203-a8ff40007f84)
* section[+]
  * title = "Procedure"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h3>Prozedur</h3>        <div><strong>Typ:</strong><ul><li><span>Jet ventilation procedure (procedure)</span><span> (http://snomed.info/sct)</span></li></ul></div>    <div><strong>Status:</strong><span>COMPLETED</span></div>    <div><strong>Kategorie:</strong><span><ul><li><span>Artificial ventilation (regime/therapy)</span><span> (http://snomed.info/sct)</span></li></ul></span></div>    <div><strong>Patient:</strong><span>urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>        <div><strong>Durchführungszeitraum:</strong><span>21.07.2025 00:00</span><span> (laufend)</span></div>                        </div>"
  * entry[0] = Reference(urn:uuid:61a2e9af-88f9-4ee2-a97f-c136530aadba)

Instance: ICUEncounter
InstanceOf: ISiKKontaktGesundheitseinrichtung
Usage: #inline
Title: "ICU Aufenthalt - Thomas Müller"
Description: "Intensivstations-Aufenthalt für Patient Thomas Müller mit hypertensivem Notfall"
* id = "88bdd3e7-fbd1-42b8-bd9f-9afdf1e31d41"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2>Encounter</h2>  <div><strong>Fallnummer:</strong><span><span>ICU-2025-001</span><span> (https://example.org/fhir/sid/encounter-id)</span></span></div>  <div><strong>Status:</strong><span>in-progress</span></div>  <div><strong>Kontaktart:</strong><span>inpatient encounter</span></div>  <div><strong>Typ:</strong><ul><li><span><span><span>Abteilungskontakt</span><span> (http://fhir.de/CodeSystem/Kontaktebene)</span></span></span></li></ul></div>  <div><strong>Abteilung:</strong><span><span>Innere Medizin</span><span> (Code: 0100)</span></span></div>  <div><strong>Einrichtung:</strong><span>Intensivstation - Innere Medizin</span></div>  <div><strong>Patient:</strong><span>urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79</span></div>  <div><strong>Zeitraum:</strong><span>21.07.2025 00:00</span><span> (laufend)</span></div>    </div>"
* identifier.type = $v2-0203#VN
* identifier.system = "https://example.org/fhir/sid/encounter-id"
* identifier.value = "ICU-2025-001"
* status = #in-progress
* class = $v3-ActCode#IMP "inpatient encounter"
* type[Kontaktebene] = $Kontaktebene#abteilungskontakt "Abteilungskontakt"
* serviceType = $FachabteilungsschluesselCS#0100 "Innere Medizin"
* subject = Reference(urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79)
* period.start = "2025-07-21T00:00:00+02:00"
* serviceProvider.identifier.system = "https://example.org/fhir/sid/abteilungsid"
* serviceProvider.identifier.value = "ICU-001"
* serviceProvider.display = "Intensivstation - Innere Medizin"

Instance: BundleExampleIntensivstation
InstanceOf: ISiKBerichtBundle
Usage: #example
Title: "Bundle Intensivstations-Verlegungsbericht"
Description: "Beispiel für ein Bundle mit Intensivstations-Verlegungsbericht für Patient Thomas Müller inklusive kritischer Vitalparameter und Beatmungsparameter"
* identifier
  * type = $v2-0203#FILL
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:a8f12c45-8e61-4f32-b123-456789abcdef"
* timestamp = "2025-07-21T00:00:00+02:00"
* entry[+]
  * resource = CompositionExampleIntensivstation
  * fullUrl = "urn:uuid:54d0804f-c770-4b61-a175-28fa1875b2a9"
* entry[+]
  * resource = CriticalPatient
  * fullUrl = "urn:uuid:11c3de2f-d461-4063-a0c2-fde122e76a79"
* entry[+]
  * resource = ICUEncounter
  * fullUrl = "urn:uuid:88bdd3e7-fbd1-42b8-bd9f-9afdf1e31d41"
* entry[+]
  * resource = BloodPressureObservation
  * fullUrl = "urn:uuid:880d8c69-fc05-4e1f-8203-a8ff40007f84"
* entry[+]
  * resource = VentilationProcedure
  * fullUrl = "urn:uuid:61a2e9af-88f9-4ee2-a97f-c136530aadba"
* entry[+]
  * resource = VentilationPressureObservation
  * fullUrl = "urn:uuid:32bb8c8a-418c-4fc2-b1c7-c33f1a99a464"
