# Best Practice für FormularDefinitionen - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Best Practice für FormularDefinitionen**

## Best Practice für FormularDefinitionen

### Funktionsumfang

* FormularDefinitionen sollten sich auf den Umfang der in diesem Modul festgelegten Funktionalitäten und Extensions beschränken. Alle weiteren Funtionalitäten und Extensions müssen so verwendet werden, dass diese von einem gefahrlos ignoriert werden können, ohne dass dies die Nutzbarkeit des Formulars einschränkt.

### Annotation für die Vorbelegung

* Formularfelder, die Daten erheben, die durch ein Element des ISiK-Patienten- oder ISiK-Encounter-Profiles repräsentiert werden können, müssen **zwingend** für die automatische Vorbelegung annotiert werden.
* Formularfelder, die Daten erheben, die durch ein ISiK-Profil des Ressourcen-Typs Observation repräsentiert werden können, müssen **zwingend** in der Modellierung an das ISiK-Profil angepasst werden und für die automatische Vorbelegung annotiert werden.

### Annotation für die Extraktion

* Formularfelder, die Daten erheben, die durch eine Observation-Ressource repräsentiert werden können, sollten für die Extraktion annotiert werden.
* Formularfelder, die Daten erheben, die durch eine Observation-Ressource repräsentiert werden können, sollten in item.definition auf ein geeignetes nationales oder internationales Observation-Profil für die Extraktion verweisen.
* Formulare, die sich im Bereich von ISiK-definierten Ressourcen (außer Observation) bewegen, sollten mit Template-based Extraction Annotationen versehen werden. Entsprechende Template Profile für die Basis sind vorhanden.

### Vorbereitung für Definition-Based Extraction und Prepopulation

Obwohl die Definition-Based Extraction und Prepopulation derzeit nicht verbindlich sind, sollten Autoren von Formulardefinitionen die zugrunde liegenden Prinzipien berücksichtigen und ihre Modelle so strukturieren, dass eine zukünftige Extraktion in geeignete FHIR-Ressourcen ermöglicht wird.

### Launch-Kontext

* FormularDefinitionen sollten immer das Vorhandensein eines Patienten- und Encounter-Kontextes annehmen und die Launch-Context-Extension entsprechend nutzen.

### Formulare im Kontext von Medizinprodukten

Formulare, deren Einsatz eine Zweckbestimmung im Sinne der EU-Medizinprodukteverordnung (MDR) nach sich zieht und somit unter die entsprechende EU-Richtlinie für Medizinprodukte fallen, sollen ebenfalls über dieses Modul erstellt werden können. Solche Formulare müssen jedoch eine spezielle Extension enthalten, die sie eindeutig als medizinproduktrelevante Formulare kennzeichnet. Die Anzeige und Verarbeitung dieser Formulare darf ausschließlich im Rahmen ihrer definierten Zweckbestimmung erfolgen. Die Verantwortung für die Prüfung und Freigabe dieser Formulare liegt beim jeweiligen Hersteller.

| | |
| :--- | :--- |
| ![](https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg) | Diese Seite ist unvollständig. Die BestPractices sollen aus den Erfahrungen mit ersten Implementierungen und Anwendungen dieses Moduls heraus entwickelt und kontinuierlich fortgeschrieben werden. Vorschläge und Hinweise zur Weiterentwicklung können im[ISiK-Unterforum](https://chat.fhir.org/#streams/287581/german.2Fisik)des[internationalen FHIR-Chats](https://chat.fhir.org/)gegeben werden.**Bei der Anlage neuer Diskussionsthemen mit Bezug zu diesem Modul bitte das Präfix `[FORM]` verwenden!** |

