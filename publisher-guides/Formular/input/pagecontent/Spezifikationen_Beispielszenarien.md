
| **Work in Progress** | **Unvollständige Inhalte** |
|-|-|
|<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/> | Diese Seite ist unvollständig. Die Beispielszenarien werden aus Anregungen und UseCases der Nutzer dieser Spezifikation, sowie der Bedarfe aus anderen ISiK-Modulen heraus entwickelt. Vorschläge und Hinweise zur Weiterentwicklung können im  [ISiK-Unterforum](https://chat.fhir.org/#streams/287581/german.2Fisik) des [internationalen FHIR-Chats](https://chat.fhir.org/) gegeben werden. **Bei der Anlage neuer Diskussionsthemen mit Bezug zu diesem Modul bitte das Präfix `[FORM]` verwenden!** |

Kandidaten:

* Ausfüllen eines Fragebogens bei der Terminbuchung eines Patienten in einem Patientenportal
* PROMS(Patient Reported Outcome Measures) der Medizininformatik-Initiative

### TI-Messenger (TI-M)

Das ISiK Formularmodul bietet neben der Möglichkeiten und Integrationen in Krankenhausinfrastrukturen auch die Möglichkeit, Formulare über den TI-Messenger (TI-M) bereitzustellen. Das folgende Diagramm zeigt eine beispielhafte Nutzung der im Modul beschriebenen Funktionen und Interaktionen im Kontext des TI-Messengers.

<div style="width: 700px;">
{% include akteure_tim.svg %}
</div>

Im Diagramm nicht abgebildet ist der Akteur des FormularLaunchers, welcher in diesem Kontext als Standalone anzunehmen ist und durch das interne Protokoll des TI-M getriggert wird. Wichtig ist, dass trotzdem der Patient-Kontext vorhanden ist, der in den [FormularDaten](StructureDefinition-ISiKFormularDaten.html) genutzt werden kann.

Die FormularDatenVorbelegung und -Extraktion sind in diesem Use Case nicht im FormularRenderer verortet, sondern werden durch den "TI-M Pro Client" durchgeführt bei potenzieller Integration in die Leistungserbringer-Infrastruktur.
