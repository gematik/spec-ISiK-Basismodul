### Funktionsumfang

FormularDefinitionen sollten sich auf den Umfang der in diesem Modul festgelegten Funktionalitäten und Extensions beschränken.
Alle weiteren Funtionalitäten und Extensions müssen so verwendet werden, dass diese von einem [FormularRenderer](Akteure.html#formularrenderer) gefahrlos ignoriert werden können, 
ohne dass dies die Nutzbarkeit des Formulars einschränkt.

### Annotation für die Vorbelegung

Formularfelder, die Daten erheben, die durch ein Element des ISiK-Patienten- oder ISiK-Encounter-Profils repräsentiert werden können, müssen *zwingend* für die automatische Vorbelegung annotiert werden.
Formularfelder, die Daten erheben, die durch ein ISiK-Profil des Ressourcen-Typs Observation repräsentiert werden können, müssen *zwingend* in der Modellierung an das ISiK-Profil angepasst werden und für die automatische Vorbelegung annotiert werden.

### Annotation für die Extraktion

Formularfelder, die Daten erheben, die durch eine Observation-Ressource repräsentiert werden können, sollten für die Extraktion annotiert werden.
Formularfelder, die Daten erheben, die durch eine Observation-Ressource repräsentiert werden können, sollten in item.definition auf ein geeignetes nationales oder internationales Observation-Profil für die Extraktion verweisen.
Formulare, die sich im Bereich von ISiK-definierten Ressourcen (außer Observation) bewegen, sollten mit Template-based Extraction Annotationen versehen werden. Entsprechende Template Profile für die Basis sind vorhanden.   

### Vorbereitung für Definition-Based Extraction und Prepopulation

Obwohl die Definition-Based Extraction und Prepopulation derzeit nicht verbindlich sind, sollten Autoren von Formulardefinitionen die zugrunde liegenden Prinzipien berücksichtigen und ihre Modelle so strukturieren, dass eine zukünftige Extraktion in geeignete FHIR-Ressourcen ermöglicht wird.

### Launch-Kontext

FormularDefinitionen sollten immer das Vorhandensein eines Patienten- und Encounter-Kontextes annehmen und die Launch-Context-Extension entsprechend nutzen. 

### Mehrsprachigkeit von Formularen

Im ISiK Kontext ist die Sprache der Formulardefinitionen und Formulardaten meist mit de-DE (deutsch-Deutschland) anzugeben. Weicht die Sprache ab, sollte dies in der Formulardefinition und den Formulardaten entsprechend annotiert werden. Liegt ein Formular in mehreren Sprachen vor, gibt es verschiedene Möglichkeiten, dies zu modellieren. Die Möglichkeiten sind im Folgenden aufgeführt, ohne dass im Rahmen dieses Moduls eine Präferenz oder Empfehlung für eine der Möglichkeiten gegeben wird. **Wir bitten hier aktiv um Feedback aus der Praxis, um die BestPractices zu diesem Thema weiterzuentwickeln.**

#### Möglichkeit 1: Designation und Translation Extension

Die erste Möglichkeit ist die Nutzung der Translation Extension für die Übersetzung von Texten, sowie Designations in ValueSets für die Übersetzung von Antwortoptionen. Hierbei werden die Texte in der Formulardefinition und den Formulardaten in der Hauptsprache angegeben, sowie die Translation Extension für die Übersetzung verwendet wird:

```json
"language": "de-DE",
"title": "Aufnahmebogen",
"_title": {
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/translation",
      "extension": [
        { "url": "lang", "valueCode": "en" },
        { "url": "content", "valueString": "Admission form" }
      ]
    }
  ]
}
```

```json
"language": "de-DE",
"item": [
  {
    "linkId": "1",
    "text": "Haben Sie eine Voranmeldung?",
    "_text": {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/translation",
          "extension": [
            { "url": "lang", "valueCode": "en" },
            { "url": "content", "valueString": "Do you have a pre-registration?" }
          ]
        }
      ]
    },
    "type": "choice",
    "answerValueSet": "http://example.org/fhir/ValueSet/ja-nein-vs"
  }
]
```

Das referenzierte ValueSet nutzt dann designation für die Übersetzung der Antwortoptionen:

```json
"concept": [
  {
    "code": "Y",
    "display": "Ja",
    "designation": [
      { "language": "de-DE", "value": "Ja" },
      { "language": "en",    "value": "Yes" }
    ]
  },
  {
    "code": "N",
    "display": "Nein",
    "designation": [
      { "language": "de-DE", "value": "Nein" },
      { "language": "en",    "value": "No" }
    ]
  }
]
```

**Vorteile:**
- Eine einzige Formulardefinition für alle Sprachen (Single Source of Truth)
- Sprachauswahl kann zur Laufzeit durch den Renderer erfolgen
- Strukturänderungen müssen nur einmal vorgenommen werden

**Nachteile:**
- Die Formulardefinition wird umfangreicher und unübersichtlicher
- Renderer muss die Translation Extension und ValueSet-Designations aktiv unterstützen
- Fehlende Übersetzungen sind schwerer zu erkennen
- Bei sprachspezifisch unterschiedlicher Formularstruktur ist dieser Ansatz nicht geeignet

#### Möglichkeit 2: Mehrere Formulardefinitionen mit "language" und "Sprach-Suffix" in der URL

Die zweite Möglichkeit ist die Anlage mehrerer Formulardefinitionen, die sich im Element `language` unterscheiden und zusätzlich in der URL ein Suffix für die Sprache tragen. Die Sprachversionen können über `derivedFrom` miteinander verknüpft werden.

```json
{
  "resourceType": "Questionnaire",
  "id": "aufnahmebogen-de",
  "url": "http://example.org/fhir/Questionnaire/aufnahmebogen-de",
  "language": "de-DE",
  ...
}
```

```json
{
  "resourceType": "Questionnaire",
  "id": "aufnahmebogen-en",
  "url": "http://example.org/fhir/Questionnaire/aufnahmebogen-en",
  "derivedFrom": [
    "http://example.org/fhir/Questionnaire/aufnahmebogen-de"
  ],
  "language": "en",
  ...
}
```


**Vorteile:**
- Klare, übersichtliche Formulardefinitionen je Sprache
- Sprachspezifische Unterschiede in der Formularstruktur sind einfach abzubilden
- Renderer benötigt keine besondere Unterstützung für Translation Extensions
- Vollständigkeit einer Übersetzung ist leicht zu überprüfen

**Nachteile:**
- Redundanz: Formularstruktur und -logik werden dupliziert
- Änderungen müssen in allen Sprachversionen synchron nachgezogen werden
- Erhöhtes Risiko von Inkonsistenzen zwischen den Sprachversionen

### Formulare im Kontext von Medizinprodukten
Erfüllt eine Software ein Kriterium aus der MDR Art. 2, wird sie zum Medizinprodukt. Formulare sind kein Medizinprodukt, es kann allerdings Einsatzzwecke geben, bei denen die Kriterien der MDR erfüllt sind. Konkretes Beispiel wäre die Nutzung von Berechnungen auf deren Basis z.B. Entscheidungen am individuellen Patienten abgeleitet werden. Die Verantwortlichkeit für die Inverkehrbringung liegt hierbei beim Hersteller der Software. Aus diesem Grund ist es wichtig, sich Gedanken über den Einsatzzweck zu machen und diesen festzulegen. Ist ein Formular für eine statistische Auswertung im Forschungskontext gedacht, kann es durch eine Software angezeigt, berechnet und verarbeitet werden, ohne unter die MDR zu fallen. Ist das selbe Formular aber mit medizinischem Zweck am individuellen Patienten im Einsatz, kann die anzeigende, berechnende und verarbeitende Software durchaus unter die MDR fallen.

Aus diesem Grund soll im Rahmen des Moduls die Möglichkeit gegeben werden, die Zweckbestimmung eines Formulars mit zu erfassen und so teilweise strukturiert anzugeben, ob das Formular ohne vorheriges Auseinandersetzen mit der MDR angezeigt, berechnet und verarbeitet werden darf, oder ob hier gewisse Bedingungen erfüllt werden müssen. Für weitere Informationen zu diesem Thema verweisen wir auf die [Richtlinie](https://health.ec.europa.eu/document/download/b45335c5-1679-4c71-a91c-fc7a4d37f12b_en?filename=mdcg_2019_11_en.pdf).


Mit der Extension [ISiKMpFormularExtension](StructureDefinition-ISiKMpFormularExtension.html) besteht die Möglichkeit anzugeben, dass das Formular innerhalb eines Medizinproduktes eingesetzt wird und zusätzlich eine Zweckbestimmung anzugeben ist. Die Interpretation der Zweckbestimmung und der daraus folgenden Konsequenzen für die eingesetzte Software liegt im Verantwortungsbereich des Software-Hersteller!

Formular-Renderer, die kein Medizinprodukt sind, müssen aufgrund dieser Extension keine ISiK-spezifischen Anpassungen implementieren.
Da die Extension als Modifier-Extension modelliert ist, gelten die grundsätzlichen Regeln der FHIR-Spezifikation für den Umgang: http://hl7.org/fhir/extensibility.html#modifierExtension.


| **Work in Progress** | **Unvollständige Inhalte** |
|-|-|
|<img src="Betriebskoordination_Gruen_gematik.svg" width="40"/> | Diese Seite ist unvollständig. Die BestPractices sollen aus den Erfahrungen mit ersten Implementierungen und Anwendungen dieses Moduls heraus entwickelt und kontinuierlich fortgeschrieben werden. Vorschläge und Hinweise zur Weiterentwicklung können im  [ISiK-Unterforum](https://chat.fhir.org/#streams/287581/german.2Fisik) des [internationalen FHIR-Chats](https://chat.fhir.org/) gegeben werden. **Bei der Anlage neuer Diskussionsthemen mit Bezug zu diesem Modul bitte das Präfix `[FORM]` verwenden!** |