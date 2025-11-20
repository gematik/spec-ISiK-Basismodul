Profile: ISiKMedikament
Parent: Medication
Id: ISiKMedikament
Description: "Dieses Profil ermöglicht die Abbildung von patientenunabhängigen Informationen zu Medikamenten in ISiK Szenarien."
* insert Meta
* insert CommonElements
* obeys isik-med-1
* code MS
  * ^short = "Medikament in codierter Form oder ggf. als Freitext"
  * ^comment = "Begründung des Must-Support: grundlegende Information"
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      PZN 0..* MS and
      ATC-DE 0..* MS and
      SCT 0..1 MS
    * ^comment = "Begründung des Must-Support: Medikamente MÜSSEN kodiert werden, hierfür kann eine PZN, ATC-Code oder SnomedCT Code verwendet werden"
  * coding[PZN] only ISiKPZNCoding
    * ^patternCoding.system = $cs-pzn
    * ^comment = "Merfachcodierung ist zulässig, da für ein abstraktes Medikament auch mehrere PZN-Codes existieren können, bspw. existieren für Aspirin 3 verschiedene Packungsgrößen."
  * coding[ATC-DE] only ISiKATCCoding
    * ^patternCoding.system = $cs-atc-de
    * ^comment = "Merfachcodierung ist zulässig, da für ein abstraktes Medikament auch mehrere ATC-Codes existieren können, bspw. existieren für Aspirin 4 verschiedene Codes, je nachdem wofür das Medikament angewendet wird."
  * coding[SCT] only ISiKSnomedCTCoding
  * coding[SCT] from $vs-ti-medication-snomed-ct (extensible)
    * ^patternCoding.system = $cs-sct
  * text MS
    * ^comment = "Begründung des Must-Support: Falls eine Kodierung nicht möglich ist kann das Medikament alternativ per Freitext erfasst werden"
* status 1..1 MS
  * ^short = "Status der Medikamenteninformation"
  * ^comment = "Begründung des Must-Support: Erforderliche Angabe im FHIR-Standard"
* manufacturer MS
  * ^short = "Hersteller des Medikaments"
  * ^comment = "Begründung des Must-Support: Alignment mit KBV-Profilen

  Hinweis: Hier kann der tatsächliche Hersteller des Medikaments benannt werden, vornehmlich im Fall von Wirkstoffmischungen (Rezepturen), beispielsweise die Krankenhausapotheke. Zu beachten ist, dass die zulassende Organisation, wie sie z.B. in den Daten zur PZN benannt ist, nicht als Hersteller gilt."
  * display 1..1 MS
* form MS
  * ^short = "Abgabeform"
  * ^comment = "Begründung des Must-Support: Basis-Information eines Medikaments"
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      EDQM 0..1 MS
    * ^comment = "Begründung des Must-Support: EDQM definiert eine einheitliche DoseForm auf europäischer Ebene"
  * coding[EDQM] from $vs-edqm-doseform (required)
  * coding[EDQM] only ISiKCoding
* amount MS
  * ^comment = "Begründung des Must-Support: Bei einer Medikation MUSS die Menge dokumentierbar sein"
  * ^short = "Menge"
  * numerator 1.. MS
    * ^comment = "Begründung des Must-Support: Bei einer Medikation MUSS die Menge dokumentierbar sein"
  * numerator only MedicationQuantity
  * denominator 1.. MS
    * ^comment = "Begründung des Must-Support: Bei einer Medikation MUSS die Menge dokumentierbar sein"
  * denominator only MedicationQuantity
* ingredient MS
  * ^short = "Informationen zu Bestandteilen (Rezeptur)"
  * ^comment = "Begründung des Must-Support: Wirkstoff-Rezepturen müssen dokumentierbar sein"
  * extension MS
  * extension contains $ext-wirkstofftyp named wirkstofftyp 0..1 MS
    * ^short = "Wirkstofftyp"
    * ^comment = "Begründung des Must-Support: Alignment mit den MII-Profilen

    Hinweis: Hiermit kann geklärt werden, ob es sich um eine Angabe zum Wirkstoff oder zum exakten Inhaltsstoff (z.B. Salze) handelt."
  * itemCodeableConcept MS
    * ^short = "Bestandteil in codierter Form oder ggf. als Freitext"
    * ^comment = "Begründung des Must-Support: Der Bestandteil muss eindeutig benannt sein"
    * coding MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains
        ASK 0..1 MS and
        ATC-DE 0..1 MS and
        PZN 0..1 MS and
        SCT 0..1 MS
    * coding[ASK] only ISiKASKCoding
      * ^patternCoding.system = $cs-ask
    * coding[ATC-DE] only ISiKATCCoding
      * ^patternCoding.system = $cs-atc-de
      * insert ISiKMedikament-CodingATCComment
    * coding[PZN] only ISiKPZNCoding
      * ^patternCoding.system = $cs-pzn
      * insert ISiKMedikament-CodingPZNComment
    * coding[SCT] only ISiKSnomedCTCoding
      * ^patternCoding.system = $cs-sct
    * text MS
  * itemReference MS
    * reference 1..1 MS
    * ^short = "Bestandteil (Referenz auf ein anderes Medikament)"
    * ^comment = "Begründung des Must-Support: Der Bestandteil muss eindeutig benannt sein"
  * isActive MS
    * ^short = "handelt es sich um einen aktiven Bestandteil?"
    * ^comment = "Begründung des Must-Support: Wird eine vollständige Rezeptur dokumentiert, muss erkennbar sein, welches die Wirkstoffe sind"
  * strength MS
    * ^short = "Stärke"
    * ^comment = "Begründung des Must-Support: Basisinformation in Rezepturen"
    * numerator 1.. MS
    * numerator only MedicationQuantity
    * denominator 1.. MS
    * denominator only MedicationQuantity
* batch MS
  * ^short = "Angaben zur Charge"
  * ^comment = "Begründung des Must-Support: erforderlich zur Dokumentation der Chargennummer

  Hinweis: Bitte beachten Sie gegebenenfalls die Regelungen der zwischen GKV-SV und DAV: https://www.gkv-datenaustausch.de/leistungserbringer/apotheken/apotheken.jsp . Insbesondere den Technischen Anhang 7 (TA7) zur Arzneimittelabrechnungsvereinbarung gemäß § 300 Absatz 3 SGB V in der aktuellsten Fassung."
  * lotNumber MS
    * ^short = "Chargennummer"
    * ^comment = "Begründung des Must-Support: Therapiesicherheit und Nachvollziehbarkeit

    Hinweis: Gemäß Anlage 1 der TA7 kann hier übergangsweise bis zum 30. Juni 2025 eine Musterchargennummer (\"STELLEN\") eingetragen werden. Wenn die Übermittlung der Chargenbezeichnung beim Stellen von Arzneimitteln technisch nicht möglich ist, z.B. beim Verblistern, wird von der Verpflichtung zur Chargendokumentation abgesehen. Dementsprechend kann anstatt der tatsächlichen Chargenbezeichnungen \"STELLEN\" in das hierbeschirebene Datenfeld eingetragen werden."

Invariant: isik-med-1
Description: "Medikamenten-Code, -Bezeichnung oder Inhaltsstoffe müssen angegeben werden."
Severity: #error
Expression: "code.exists() or ingredient.exists()"

Instance: ExampleISiKMedikament1
InstanceOf: ISiKMedikament
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Medikament codiert (Wirkstoff)</div>"""
* code.coding
  * system = $cs-atc-de
  * code = #V03AB23
  * display = "Acetylcystein"
  * version = "2024"
* status = #active

Instance: ExampleISiKMedikament2
InstanceOf: ISiKMedikament
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Beispiel für eine Infusionslösung</div>"""
* code.text = "Infusion bestehend aus 85mg Doxorubicin aufgelöst zur Verabreichung in 250ml 5-%iger (50 mg/ml) Glucose-Infusionslösung"
* status = #active
* form.coding
  * system = $cs-edqm
  * code = #11210000
  * display = "Solution for infusion"
* ingredient[0]
  * extension[wirkstofftyp]
    * valueCoding
      * system = "http://fhir.de/CodeSystem/WirkstofftypCS"
      * code = #IN
  * itemCodeableConcept.coding
    * system = $cs-atc-de
    * code = #L01DB01
    * version = "2024"
    * display = "Doxorubicin"
  * isActive = true
  * strength
    * numerator
      * value = 85
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 250
      * unit = "Milliliter"
      * system = $cs-ucum
      * code = #mL
* ingredient[1]
  * itemReference.reference = "Medication/7f27cb8d-940b-43fd-ab8b-fee5b7a9b060"
  * isActive = true

Instance: ExampleISiKMedikament3
InstanceOf: ISiKMedikament
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Medikament codiert (mit PZN)</div>"""
* code.coding
  * system = $cs-pzn
  * code = #07265233
  * display = "Pantozol® 40 mg 98 St."
* status = #active

Instance: ExampleISiKMedikament4
InstanceOf: ISiKMedikament
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Medikamentenrezeptur aus Fertigarzneimitteln</div>"""
* status = #active
* form.text = "Tabletten"
* ingredient[0]
  * itemCodeableConcept.coding
    * system = $cs-pzn
    * code = #00266040
    * display = "IBU-ratiopharm® 400 mg akut Schmerztabletten 20 St."
  * isActive = true
  * strength
    * numerator
      * value = 400
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * unit = "Tablette"
      * value = 1
      * system = $cs-ucum
      * code = #1
* ingredient[1]
  * itemCodeableConcept.coding
    * system = $cs-pzn
    * code = #01126111
    * display = "Paracetamol-ratiopharm® 500 mg 20 St."
  * isActive = true
  * strength
    * numerator
      * value = 500
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * unit = "Tablette"
      * value = 1
      * system = $cs-ucum
      * code = #1

Instance: ExampleISiKMedikament5
InstanceOf: ISiKMedikament
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Medikamentenrezeptur aus Wirkstoffen</div>"""
* status = #active
* form.text = "Tabletten"
* ingredient[0]
  * itemCodeableConcept.coding
    * system = $cs-atc-de
    * code = #M02AA13
    * display = "Ibuprofen"
    * version = "2024"
  * isActive = true
  * strength
    * numerator
      * value = 400
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * unit = "Tablette"
      * value = 1
      * system = $cs-ucum
      * code = #1
* ingredient[1]
  * itemCodeableConcept.coding
    * system = $cs-atc-de
    * code = #N02BE01
    * display = "Paracetamol"
    * version = "2024"
  * isActive = true
  * strength
    * numerator
      * value = 500
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * unit = "Tablette"
      * value = 1
      * system = $cs-ucum
      * code = #1

Instance: ExampleISiKMedikament6
InstanceOf: ISiKMedikament
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Medikament als Freitext</div>"""
* code.text = "Enoxaparin-Natrium 40 mg"
* status = #active

Instance: ExampleISiKMedikament7
InstanceOf: ISiKMedikament
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Medikament (hier: Paracetamol) in Wasser aufgelöst</div>"""
* code.text = "Paracetamol gelöst in Wasser"
* status = #active
* ingredient[0]
  * itemCodeableConcept.coding
    * system = $cs-atc-de
    * code = #N02BE01
    * display = "Paracetamol"
    * version = "2024"
  * isActive = true
  * strength
    * numerator
      * value = 500
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 1
      * system = $cs-ucum
      * code = #1
* ingredient[1]
  * itemCodeableConcept.text = "Wasser"
  * isActive = false
  * strength
    * numerator
      * value = 1
      * unit = "Esslöffel"
      * system = $cs-ucum
      * code = #1
    * denominator
      * value = 1
      * system = $cs-ucum
      * code = #1

Instance: ExampleISiKMedikament8
InstanceOf: ISiKMedikament
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Zytostatikum mit absoluter Wirkstärken-Angabe:</div>"""
* code.text = "Infusion bestehend aus 80 mg/m² KOF Paclitaxel aufgelöst zur Verabreichung in 5-%iger (50 mg/ml) Glucose-Infusionslösung"
* status = #active
* form.coding
  * system = $cs-edqm
  * code = #11210000
  * display = "Solution for infusion"
* ingredient[0]
  * itemCodeableConcept.coding
    * system = $cs-atc-de
    * code = #L01CD01
    * display = "Paclitaxel"
    * version = "2024"
  * isActive = true
  * strength
    * numerator
      * value = 80
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 1
      * unit = "m² KOF"
      * system = $cs-ucum
      * code = #m2
* ingredient[1]
  * itemCodeableConcept.coding
    * system = $cs-atc-de
    * code = #B05BA11
    * display = "Glucose"
    * version = "2024"
  * isActive = false
  * strength
    * numerator
      * value = 50
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 1
      * unit = "Milliliter"
      * system = $cs-ucum
      * code = #mL

Instance: ExampleISiKMedikament9
InstanceOf: ISiKMedikament
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">Zytostatikum mit absoluter Wirkstärken-Angabe:</div>"""
* code.text = "Infusion bestehend aus 142 mg Paclitaxel aufgelöst zur Verabreichung in 500 ml 5-%iger (50 mg/ml) Glucose-Infusionslösung"
* status = #active
* form.coding
  * system = $cs-edqm
  * code = #11210000
  * display = "Solution for infusion"
* ingredient[0]
  * itemCodeableConcept.coding
    * system = $cs-atc-de
    * code = #L01CD01
    * display = "Paclitaxel"
    * version = "2024"
  * isActive = true
  * strength
    * numerator
      * value = 142
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 500
      * unit = "Milliliter"
      * system = $cs-ucum
      * code = #mL
* ingredient[1]
  * itemCodeableConcept.coding
    * system = $cs-atc-de
    * code = #B05BA11
    * display = "Glucose"
    * version = "2024"
  * isActive = false
  * strength
    * numerator
      * value = 50
      * unit = "mg"
      * system = $cs-ucum
      * code = #mg
    * denominator
      * value = 1
      * unit = "Milliliter"
      * system = $cs-ucum
      * code = #mL

Instance: ParacetamolInfusion
InstanceOf: ISiKMedikament
Usage: #example
* text
  * status = #additional
  * div = """<div xmlns="http://www.w3.org/1999/xhtml">
      <div>
      <p><b>Motivation:</b> Dieses Beispiel zeigt, wie Rezepturen als ISiK-Medikation in FHIR R4 abgebildet werden können. Es demonstriert die Kombination eines Wirkstoffs mit einer Trägerlösung.</p>
      <p><b>Medikament:</b> Paracetamol 10 mg/ml in Glukose 5 %</p>
      <p><b>Form:</b> Infusionslösung</p>
      <p><b>Wirkstoffe:</b></p>
      <ul>
        <li><b>Paracetamol:</b> 10 mg/ml (aktiv)</li>
        <li><b>Glukose 5 %:</b> Trägerlösung (inaktiv)</li>
      </ul>
      <p><b>Gesamtmenge:</b> 100 ml (entspricht 1000 mg Paracetamol)</p>
      <p><b>Hinweis:</b> Rezepturen bestehen aus mehreren Bestandteilen. Dieses Beispiel zeigt, wie man sie mit <code>Medication.ingredient</code> korrekt modelliert.</p>
    </div>"""
* status = #active
* code.text = "Paracetamol 10 mg/ml in Glukose 5 %"
* form
  * coding[EDQM]
    * system = $cs-edqm
    * code = #11210000
    * display = "Solution for infusion"
  * text = "Infusionslösung"
* ingredient[+]
  * extension[wirkstofftyp]
    * valueCoding
      * system = "http://fhir.de/CodeSystem/WirkstofftypCS"
      * code = #IN
  * itemCodeableConcept
    * coding[ATC-DE] = $cs-atc-de#N02BE01 "Paracetamol"
      * version = "2024"
    * text = "Paracetamol"
  * strength
    * numerator = 10 'mg' "mg"
    * denominator = 1 'mL' "mL"
  * isActive = true
* ingredient[+]
  * itemCodeableConcept = $cs-pzn#03710676 "Ecoflac® plus Glucose 5 % (100 ml)"
  * isActive = false
* amount.numerator = 100 'mL' "mL"
* amount.denominator
  * value = 1
  * unit = "Beutel"
  * system = $cs-ucum
  * code = #1