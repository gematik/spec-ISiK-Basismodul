# ADR-PTDATA-2421: Abbildung von Unit-Dose-Pouch-IDs in der Medikationsverabreichung

Datum: 2026-11-18

Status: Vorgeschlagen

[//]: #  (Status: <Vorgeschlagen | Angenommen | Abgelehnt | Verworfen | Ersetzt durch ADR-…)

Ticket: PTDATA-2421

## Kontext
[//]:
Im Unit-Dose-Prozess stellt die Krankenhausapotheke die Medikation patientenindividuell in Einzeldosen zusammen. Jede Einzeldosis wird in einem eigenen Beutel (Pouch) verpackt. Jeder Pouch trägt eine eindeutige Pouch-ID, z.B. als Barcode, damit er bei der Verabreichung gescannt und dem Patienten zugeordnet werden kann.

Ein verordnetes Medikament wird dabei nicht immer genau einem Pouch entsprechen. Beispiel:

- Verordnet ist Ibuprofen 1200 mg.
- Im Haus wird standardmäßig die Stärke Ibuprofen 400 mg verblistert.
- Der Patient erhält also **3 Pouches mit je einer 400-mg-Tablette** und nimmt 3 Tabletten ein.

Das Krankenhaus möchte diesen Vorgang weiterhin als **eine** `MedicationAdministration` (ISiKMedikationsVerabreichung) abbilden, also als eine Verabreichung von 1200 mg Ibuprofen. Trotzdem soll nachvollziehbar sein, welche Pouches dafür verwendet wurden. Gründe dafür sind z.B. Closed-Loop-Medikation, die Rückverfolgbarkeit bis zur Apotheke und der Abgleich zwischen gescannten und dokumentierten Einheiten.

Vorschlag des Krankenhauses: Jede Pouch-ID wird als eigener Eintrag in `MedicationAdministration.identifier` geführt.

Ausgangslage im Profil ISiKMedikationsVerabreichung (Stufe 6):
- `identifier` ist nicht profiliert. Das Element hat kein MS, keine Slices und keine Vorgaben zu `system` oder `type`.
- `dosage.dose` beschreibt die Gesamtdosis der Verabreichung als ein einziges Quantity.
- `supportingInformation` (Reference(Any)) und `partOf` (Reference(MedicationAdministration | Procedure)) sind nicht profiliert.
- Eine ISiK-Profilierung von `MedicationDispense` gibt es nicht.

Zu entscheiden ist:
1. Soll ISiK die Abbildung von Pouch-IDs überhaupt vorgeben, oder bleibt das ein hausinternes Detail?
2. Falls ja: Wo und wie werden Pouch-IDs strukturiert abgebildet?

Annahmen:
- Eine Pouch-ID identifiziert eine physische Abgabeeinheit eindeutig, mindestens innerhalb eines Hauses bzw. des Unit-Dose-Systems.
- Pro Verabreichung können 1..n Pouches verwendet werden.
- Ein Pouch enthält immer genau eine Tablette. Mischpouches mit mehreren Tabletten gibt es nicht. Eine Tablette kann allerdings ein Kombinationspräparat mit mehreren Wirkstoffen sein. Das ist dann aber ein einzelnes Medikament und über die referenzierte `Medication` abbildbar.
- Alle Pouches einer Verabreichung enthalten dasselbe Medikament. Das Medikament wird über `medicationReference` als **eine** `Medication`-Instanz referenziert (`medication[x]` ist 1..1).
- Die Charge eines Pouches lässt sich über die Pouch-ID im Unit-Dose- bzw. Apothekensystem ermitteln. Sie muss deshalb nicht zwingend in der Verabreichung selbst stehen.

Nachvollziehbarkeit bei gemischten Chargen:
Die referenzierte `Medication` kann nur eine Charge abbilden (`Medication.batch` ist 0..1 mit genau einer `lotNumber`). Stammen die Pouches einer Verabreichung aus verschiedenen Chargen, etwa 2 Pouches aus einer älteren und 1 aus einer neueren Charge, lässt sich das über die `Medication` nicht korrekt darstellen. Tritt z.B. ein Chargenrückruf oder eine unerwünschte Wirkung auf, hängt die Nachvollziehbarkeit dann vollständig davon ab, dass jede Pouch-ID mitgeliefert wird und das Unit-Dose-System die Zuordnung von Pouch-ID zu Charge vorhält. Das ist ein zusätzliches Argument dafür, die Pouch-IDs strukturiert und vollständig an der Verabreichung zu führen. Es bleibt aber zu prüfen, ob die indirekte Auflösung über das Unit-Dose-System ausreicht (siehe offene Fragen).

## Optionen

### Option 1: Pouch-IDs als `MedicationAdministration.identifier` 
Für jeden Pouch wird ein `identifier` mit einem eigenen `system` (Namensraum des Unit-Dose-Systems) und der Pouch-ID als `value` eingetragen. Optional definiert ISiK dafür einen Slice (z.B. `UnitDosePouchId`) mit festem `type`.

```json
"identifier": [
  { "system": "https://example.org/fhir/sid/unit-dose-pouch", "value": "POUCH-0001" },
  { "system": "https://example.org/fhir/sid/unit-dose-pouch", "value": "POUCH-0002" },
  { "system": "https://example.org/fhir/sid/unit-dose-pouch", "value": "POUCH-0003" }
]
```

- PRO: Sehr einfach umzusetzen, es sind keine weiteren Ressourcen oder Profile nötig.
- PRO: Über den Standard-Suchparameter `identifier` direkt suchbar (`GET MedicationAdministration?identifier=<system>|POUCH-0002`). Die Frage "In welcher Verabreichung wurde dieser Pouch verwendet?" lässt sich damit direkt beantworten.
- PRO: Passt zum Wunsch, genau eine Verabreichung zu dokumentieren.
- CON: Die Semantik weicht vom FHIR-Core ab. `identifier` ist als Business-Identifier *der Verabreichung selbst* gedacht ("Identifiers associated with this Medication Administration"). Eine Pouch-ID identifiziert aber die abgegebene physische Einheit, nicht das Verabreichungsereignis. Mehrere Identifier wären so formal mehrere alternative Kennungen für dieselbe Verabreichung.
- CON: Fremdsysteme können Pouch-IDs nur über ein vereinbartes `system` bzw. `type` von "echten" Verabreichungs-IDs unterscheiden. Ohne ISiK-Vorgabe für `type` bleibt das hausspezifisch.
- CON: Die Pouch-ID lässt sich nicht mit weiteren Informationen zum Pouch verknüpfen, z.B. Charge, Verfall, enthaltene Stärke, Abgabezeitpunkt oder Status (verabreicht oder verworfen).
- CON: Für teilweise verabreichte Pouches (z.B. 2 von 3 eingenommen, einer verworfen) gibt es keinen Platz.
- CON: Die Charge ist nicht direkt ersichtlich und nur über das Unit-Dose-System auflösbar. Das gilt ebenso für Option 2.

#### Variante 1a: Unterscheidung über `identifier.use` (secondary)
Ergänzend zu `system` und `type` wird das Element `identifier.use` genutzt, um Pouch-IDs von der eigentlichen Verabreichungs-ID zu unterscheiden. Die ID der Verabreichung erhält `use = usual` (bzw. `official`), die Pouch-IDs erhalten `use = secondary`.

Prüfung gegen FHIR R4:
- `identifier.use` ist 0..1 und *required* an das ValueSet [IdentifierUse](https://hl7.org/fhir/R4/valueset-identifier-use.html) gebunden. Erlaubt sind nur `usual | official | temp | secondary | old`. Das ist in R5 unverändert.
- Einen Code **`primary` gibt es nicht**. Als Gegenstück zu `secondary` kommen nur `usual` ("the identifier recommended for display and use in real-world interactions") oder `official` ("the identifier considered to be most trusted") in Frage. Für die Verabreichungs-ID passt `usual` am besten.
- `secondary` ist definiert als: "An identifier that was assigned in secondary use – it serves to identify the object in a relative context, but cannot be consistently assigned to the same object again in a different context." Das passt grundsätzlich zum Unit-Dose-Fall. Die Pouch-ID ist im Kontext des Unit-Dose-Prozesses vergeben worden und identifiziert die Verabreichung nur relativ zu diesem Kontext.

```json
"identifier": [
  { "use": "usual",     "system": "https://example.org/fhir/sid/medication-administration", "value": "MA-4711" },
  { "use": "secondary", "system": "https://example.org/fhir/sid/unit-dose-pouch", "value": "POUCH-0001" },
  { "use": "secondary", "system": "https://example.org/fhir/sid/unit-dose-pouch", "value": "POUCH-0002" },
  { "use": "secondary", "system": "https://example.org/fhir/sid/unit-dose-pouch", "value": "POUCH-0003" }
]
```

Bewertung:
- PRO: Es wird ein Standard-Element mit Required-Binding verwendet, ohne Extension oder neuen Code.
- PRO: Die Verabreichungs-ID wird klar als führender Identifier gekennzeichnet. Die Pouch-IDs sind als nachrangig erkennbar, und Empfänger können `usual` z.B. für die Anzeige bevorzugen.
- PRO: Die Definition von `secondary` passt inhaltlich und mildert den semantischen Einwand gegen Option 1 ab.
- CON: `use` allein reicht zur Unterscheidung nicht. `secondary` kann auch für andere nachrangige Identifier verwendet werden. Für eine eindeutige Erkennung braucht es weiterhin ein festes `system` oder einen `type` (z.B. ein ISiK-Slice `UnitDosePouchId` mit `use = secondary` als Fixed Value).
- CON: Der Standard-Suchparameter `identifier` wertet `use` nicht aus. Die Suche funktioniert also weiterhin nur über `system|value`.
- CON: Der Grundeinwand bleibt bestehen. Formal ist auch ein `secondary`-Identifier ein Identifier der Verabreichung und nicht des Pouches.

### Option 2: Eigene Extension für Pouch-IDs an `MedicationAdministration`
ISiK definiert eine Extension (z.B. `ISiKUnitDosePouchIdentifier`, 0..*, Datentyp `Identifier`), die die verwendeten Pouches auflistet. `MedicationAdministration.identifier` bleibt den Business-Identifiern der Verabreichung vorbehalten.

- PRO: Die Semantik ist eindeutig, Pouch-ID und Verabreichungs-ID werden nicht vermischt.
- PRO: Bleibt in einer Ressource und ist damit ähnlich einfach wie Option 1.
- PRO: Die Extension kann bei Bedarf komplex angelegt werden, z.B. mit Pouch-ID, Anzahl und Status je Pouch.
- CON: Eine proprietäre Extension verringert die Interoperabilität außerhalb von ISiK.
- CON: Es gibt keine Standardsuche. Für die Suche nach Pouch-ID wäre ein eigener SearchParameter nötig, mit entsprechendem Aufwand für Hersteller.
- CON: Zusätzliche Artefakte (Extension, ggf. SearchParameter) müssen gepflegt werden.

### Option 3: Pouches als `MedicationDispense` modellieren, Referenz aus der Verabreichung
Jeder Pouch (oder die Abgabe aller Pouches eines Verabreichungszeitpunkts) wird als `MedicationDispense` abgebildet, mit der Pouch-ID in `MedicationDispense.identifier`. Die `MedicationAdministration` verweist über `supportingInformation` auf die zugehörigen Dispense-Ressourcen. Fachlich ist Unit-Dose eine patientenindividuelle Abgabe durch die Apotheke.

- PRO: Fachlich am saubersten. Die Pouch-ID ist Business-Identifier der Abgabe, die Verabreichung bleibt ein Ereignis.
- PRO: Je Pouch lassen sich weitere Informationen abbilden, z.B. Menge, Medikament bzw. Stärke, Abgabezeitpunkt, Status und `authorizingPrescription`.
- PRO: Anschlussfähig an spätere Anforderungen aus dem Apotheken- bzw. Closed-Loop-Prozess.
- CON: Deutlich mehr Aufwand. Es braucht ein neues ISiK-Profil (MedicationDispense), ggf. CapabilityStatement-Anpassungen und Beispiele.
- CON: `supportingInformation` ist Reference(Any) und semantisch unscharf. Die Verknüpfung müsste ISiK über Profilierung und Kommentare festlegen.
- CON: Für den einfachen Anwendungsfall "Welche Pouches gehören zu dieser Verabreichung?" sind mehr Ressourcen und Abfragen (`_include`) nötig.
- CON: Ob die Primärsysteme (Unit-Dose-Automat, Apothekensystem, KIS) Dispense-Informationen überhaupt liefern können, ist unklar.

### Option 4: Eine `MedicationAdministration` je Pouch
Jeder Pouch wird als eigene Verabreichung dokumentiert (3 × 400 mg). Die Pouch-ID ist dann tatsächlich der Business-Identifier der jeweiligen Verabreichung. Die Zusammengehörigkeit ergibt sich über die gemeinsame `request`-Referenz bzw. denselben Zeitpunkt.

- PRO: Konform zur FHIR-Semantik von `identifier`, ohne Extension oder neues Profil.
- PRO: Teilverabreichungen lassen sich je Pouch über `status` abbilden.
- CON: Widerspricht dem ausdrücklichen Wunsch des Krankenhauses, eine Verabreichung zu dokumentieren.
- CON: Die fachliche Sicht (1200 mg verabreicht) geht verloren und muss vom Empfänger rekonstruiert werden. Das birgt das Risiko von Fehlinterpretationen, z.B. als dreifache Gabe.
- CON: Mehr Ressourcen, und ein Abgleich mit der Verordnung ist schwieriger.

### Option 5: Pouch-IDs unstrukturiert (z.B. `note` oder `dosage.text`)
Die Pouch-IDs werden als Freitext mitgegeben.

- PRO: Kein Spezifikationsaufwand.
- CON: Nicht maschinell auswertbar und nicht suchbar, damit für Closed-Loop bzw. Rückverfolgung ungeeignet. Wird nur der Vollständigkeit halber aufgeführt.

### Option 6: Keine Vorgabe durch ISiK
ISiK trifft keine Festlegung. Häuser und Hersteller lösen das hausintern, z.B. über offene Slicing-Regeln in `identifier` oder eigene Extensions.

- PRO: Kein Aufwand, und die Spezifikation bleibt schlank.
- CON: Uneinheitliche Umsetzungen. Die Interoperabilität zwischen Unit-Dose-System, KIS und weiteren Konsumenten ist nicht gewährleistet.

## Entscheidung
[//]: # (
<Konzise Beschreibung der getroffenen Entscheidung.  
Was wird getan / wie wird es gelöst?>
)

Noch offen.

Offene Fragen zur Entscheidungsfindung:
- Welche Systeme konsumieren die Pouch-IDs, und welche Abfragen brauchen sie (z.B. Suche nach Pouch-ID, Anzeige je Verabreichung)?
- Werden pro Pouch weitere Informationen benötigt (Charge, Verfall, Status verabreicht/verworfen)? Davon hängt ab, ob ein reiner Identifier (Option 1 bzw. 2) ausreicht. Aktuell ist das unklar.
- Reicht es für die Chargen-Nachvollziehbarkeit (insbesondere bei gemischten Chargen innerhalb einer Verabreichung), die Charge indirekt über Pouch-ID und Unit-Dose-System aufzulösen? Oder muss die Charge in der ISiK-Schnittstelle selbst verfügbar sein? Ist das Unit-Dose-System für alle Konsumenten (z.B. Pharmakovigilanz, Rückrufmanagement) erreichbar?
- Gibt es weitere Häuser oder Hersteller mit Unit-Dose-Prozess, deren Anforderungen berücksichtigt werden sollten?

## Konsequenzen
[//]: # (
<Positive und negative Auswirkungen der Entscheidung.  
Auswirkungen auf Qualitätseigenschaften, Kosten, Risiken, Betrieb, Wartung.>
)

Wird nach der Entscheidung ergänzt.

## Anhänge (optional)
[//]: # (
<Verweise auf Dokumente, Prototypen o.Ä.>
)

- Profil: [ISiKMedikationsVerabreichung.fsh](../../Resources/input/fsh/Medikation/ISiKMedikationsVerabreichung.fsh)
- FHIR R4 MedicationAdministration: https://hl7.org/fhir/R4/medicationadministration.html
- FHIR R4 MedicationDispense: https://hl7.org/fhir/R4/medicationdispense.html
