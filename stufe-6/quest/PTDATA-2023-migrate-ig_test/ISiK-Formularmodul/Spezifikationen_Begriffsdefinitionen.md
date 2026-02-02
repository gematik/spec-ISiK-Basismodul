# Begriffsdefinitionen - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Begriffsdefinitionen**

## Begriffsdefinitionen

### Schlüsselworte

Anforderungen als Ausdruck normativer Festlegungen werden durch die dem [RFC2119](https://tools.ietf.org/html/rfc2119) entsprechenden, in Großbuchstaben geschriebenen deutschen Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN sowie ihrer Pluralformen gekennzeichnet.

### Bedeutung von Must-Support-Flags

**Die Bedeutung von [MustSupport-Flags](http://hl7.org/fhir/R4/conformance-rules.html#mustSupport) ist im FHIR-Standard nicht festgelegt und hängt vom Kontext der Implementierung ab. Leitfäden, in deren Profilen MustSupport-Flags gesetzt werden sollten daher präzisieren, welche Erwartungen hier an die jeweiligen Akteure gestellt werden. Dies kann (muss aber nicht) zum Beispiel umfassen:**

* **das Element zu persistieren**
* **das Element in der UI darzustellen**
* **das Element in der UI verändern zu können**
* **das Element über die API zurückgeben zu können**

### Begriffe und Abkürzungen

|Begriff|Erläuterung| |-|-| |FormularDefinition|Die FHIR-Ressourcen [“Questionnaire”](https://hl7.org/fhir/R4/questionnaire.html)| || Die FHIR-Ressource [“QuestionnaireResponse” ](https://hl7.org/fhir/R4/questionnaireresponse.html)| |SDC|Der Implementierungsleitfaden [“Structured Data Capture”](https://build.fhir.org/ig/HL7/sdc/)| |Vorbelegung|Der Vorgang des Vorbefüllens einer QuestionnaireResponse mit Daten, die über eine FHIR-API abgerufen werden können| |Extraktion|Der Vorgang des Extrahierens von FHIR-Ressourcen aus einer QuestionnaireResponse| |FHIRPath|Formale Sprache, um durch die Elemente einer FHIR-Ressource zu navigieren, um z.B. auf ein konkretes Element zu zeigen, das zur Vorbefüllung eines Formularfeldes verwendet werden soll| |Validierung|Prüfung der Konsistenz und Korrektheit der Formularantworten (QuestionnaireResponse) auf Basis der Definition (Questionnaire)|

