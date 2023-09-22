### Motivation

Die Möglichkeit, auf eine Übersicht der Prozeduren eines Patienten zuzugreifen, Patienten anhand durchgeführter oder geplanter Prozeduren zu suchen, oder zu prüfen, ob eine konkrete Prozedur bei einem Patienten durchgeführt wurde, sind wichtige Funktionen im klinischen Behandlungsablauf.

In FHIR werden Prozeduren mit der [Procedure](https://hl7.org/fhir/R4/procedure.html)-Ressource repräsentiert.

Da die Prozeduren in klinischen Primärsystemen in der Regel in OPS-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches.
Falls eine Prozedur zwar dokumentiert aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Prozedur möglich.