
Innerhalb des ISiK-Moduls Medikation können beteiligte Systeme unterschiedliche Aufgaben übernehmen.

Diese Aufgaben werden im vorliegenden Implementierungsleitfaden durch Akteure beschrieben. Die Akteure werden über CapabilityStatements formalisiert und bündeln jeweils die für einen fachlichen Bereich relevanten Rollen und Interaktionen.

* **Akteur Medikationsinformation (Medication Summary, "Medikationspläne"):** Bildet den Medikationsstatus eines Patienten ab, z.B. Informationen über Dauermedikation oder Selbstmedikation. In diesem Kontext wird häufig noch eine Liste verwendet, in der die einzelnen Medikationsinformationen strukturiert sind - siehe [Capability Statement](CapabilityStatement-ISiKCapabilityStatementMedikationInformationAkteur-expanded.html).
* **Akteur Medikationsverordnung (Medication Order):** Umfasst Informationen über die Verordnung von Medikamenten im Rahmen des medizinischen Workflows - siehe [Capability Statement](CapabilityStatement-ISiKCapabilityStatementMedikationVerordnungAkteur-expanded.html).
* **Akteur Medikationsverabreichung (Administered Medication):** Umfasst Informationen über die (erfolgte) Verabreichung bzw. Einnahme von Medikamenten im Rahmen des medizinischen Workflows - siehe [Capability Statement](CapabilityStatement-ISiKCapabilityStatementMedikationVerabreichungAkteur-expanded.html).

Die normativen Anforderungen werden in den jeweiligen CapabilityStatements und den darüber importierten Rollen festgelegt. Dort ist im Detail ersichtlich, welche Profile unterstützt werden müssen und welche REST-Interaktionen dafür verbindlich sind.
