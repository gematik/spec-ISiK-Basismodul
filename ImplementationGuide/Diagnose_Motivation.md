### Motivation

Die Möglichkeit, auf eine Übersicht der Diagnosen eines Patienten zuzugreifen, Patienten anhand ihrer Diagnose zu suchen oder zu prüfen, ob eine konkrete Diagnose bei einem Patienten vorliegt, sind wichtige Funktionen im klinischen Behandlungsablauf.

In FHIR werden Diagnosen mit der [Condition](http://hl7.org/fhir/condition.html)-Ressource repräsentiert.

Da die Diagnosen in klinischen Primärsystemen in der Regel in ICD-10-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches.
Falls eine Diagnose zwar dokumentiert, aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Diagnose möglich.

