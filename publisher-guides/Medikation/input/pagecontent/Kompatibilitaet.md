Der vorliegende Implementierungsleitfaden wurde aus der Analyse verschiedener in Deutschland bestehender Spezifikationen im Bereich Medikation heraus entwickelt.

Überwiegend wurde dabei eine Vereinigungsmenge aus diesen, teilweise mit stark unterschiedlicher Ausrichtung verfassten, Spezifikationen hergestellt. Allerdings wurde auch zum einen der Entwicklung der letzten Jahre Rechnung getragen, zum anderen wurden sehr spezifische Datenelemente, die für die Medikationskommunikation im stationären Bereich nicht von Bedeutung sind, nicht berücksichtigt.

Zu den betrachteten Spezifikationen und Anwendungen zählen insbesondere der [digital gestützte Medikationsprozess (dgMP)](https://gemspec.gematik.de/ig/fhir/epa-medication/1.3.2/dgmp-overview.html), der [ePA Medication Service](https://gemspec.gematik.de/ig/fhir/epa-medication/1.3.2/index.html) mit der elektronischen Medikationsliste (eML), das [KBV eRezept](https://simplifier.net/erezept), der [MedicationDE-Implementierungsleitfaden](https://ig.fhir.de/igs/medication) mit den Profilen DosageDE und TimingDE sowie der [Medizininformatik-Initiative Kerndatensatz Modul Medikation](https://www.medizininformatik-initiative.de/Kerndatensatz/KDS_Medikation_2026/MIIIGModulMedikation.html). Die jeweiligen Abschnitte verweisen auf die entsprechenden Spezifikationen und beschreiben die relevanten Unterschiede aus Sicht von ISiK-Medikation.


### Kompatibilität zum digital gestützten Medikationsprozess (dgMP)

Die Kompatibilität mit dem dgMP wird insbesondere dadurch unterstützt, dass ISiK-Medikation und die im dgMP verwendeten Profile auf Profilierungen aus dem [MedicationDE-Implementierungsleitfaden](https://ig.fhir.de/igs/medication) aufbauen. ISiK-Medikation verwendet für strukturierte Dosierungsinformationen das Profil DosageDE sowie die darin verwendeten Strukturen zur Abbildung von Zeitangaben. Im dgMP wird hierfür das darauf aufbauende Profil DosageDgMP verwendet. Damit besteht für strukturierte Dosierungsinformationen eine gemeinsame Profilierungsgrundlage, auch wenn die Profile nicht identisch sind.

### Kompatibilität zum Medizininformatik-Initiative Kerndatensatz Modul Medikation

Zwischen dem Medizininformatik-Initiative Kerndatensatz Modul Medikation und ISiK-Medikation bestehen fachliche und strukturelle Überschneidungen. Beide Spezifikationen verwenden die FHIR-Ressource Medication zur Abbildung von Medikamenten, unterscheiden sich jedoch in Profilierung, Terminologien und Kardinalitäten. Eine vollständige oder weitgehende Deckungsgleichheit der Spezifikationen ist damit nicht verbunden.

Unterschiede bestehen insbesondere bei der Medikamenten-Codierung. Beide Spezifikationen unterstützen PZN und ATC-DE. Die Medizininformatik-Initiative sieht zusätzlich ATC-WHO für Medication.code vor, während ISiK-Medikation hierfür zusätzlich SNOMED CT zulässt. Je nach Ausgangsdaten kann daher ein Mapping oder eine Umcodierung erforderlich sein.

Weitere Unterschiede bestehen bei der Abbildung von Wirkstoffen und Bestandteilen. Die Medizininformatik-Initiative verlangt mindestens einen Bestandteil und sieht für ingredient.itemCodeableConcept unter anderem ASK, UNII, CAS und SNOMED CT vor. ISiK-Medikation unterstützt an dieser Stelle ASK, ATC-DE, PZN und SNOMED CT und erlaubt außerdem die Abbildung von Medikamenteninformationen über Medication.code oder Freitext, sofern keine strukturierte Codierung möglich ist.

### Kompatibilität zum KBV eRezept

Zwischen ISiK-Medikation und dem KBV eRezept besteht eine gemeinsame Profilierungsgrundlage über den MedicationDE-Implementierungsleitfaden. Insbesondere werden für die strukturierte Abbildung von Dosierungs- und Zeitangaben Profile aus MedicationDE verwendet. Dadurch wird eine fachliche und technische Kompatibilität in den gemeinsam genutzten Strukturen unterstützt.

Gleichzeitig unterscheiden sich die Anwendungskontexte der beiden Spezifikationen. Die eRezept-Spezifikation enthält Datenelemente, die spezifisch für Rezept-Verordnungen, Einlösung und Abrechnung relevant sind. Diese sind unter anderem im Profil [KBV_PR_ERP_Prescription](https://simplifier.net/erezept/kbv_pr_erp_prescription) beschrieben. Beispiele hierfür sind eRezept-spezifische Extensions, etwa Angaben im Kontext der Abrechnung wie die Notdienstgebühr. Solche eRezept-spezifischen Datenelemente werden in ISiK nicht explizit spezifiziert. Dennoch ist die Verwendung entsprechender Extensions in ISiK möglich und zulässig, sofern hierfür im konkreten Anwendungsfall ein Bedarf besteht.

Umgekehrt erlaubt ISiK-Medikation Angaben, die über die Anforderungen und Einschränkungen des eRezepts hinausgehen. Soll aus einer ISiK-Verordnung ein eRezept generiert werden, muss daher geprüft werden, welche strukturierten Informationen direkt übernommen werden können und welche Informationen reduziert, angepasst oder in eine textuelle Beschreibung überführt werden müssen.

Weiterhin kann die Erzeugung eines eRezepts aus den ISiK-FHIR-Ressourcen die Umsetzung direkt codierter Medikamente in eine eigene Medication-Ressource und/oder die Umcodierung des Medikamentencodes sowie der codierten Medikamenten-Bestandteile in einen Freitext erfordern.

### Kompatibilität zur elektronischen Medikationsliste der ePA

Die elektronische Medikationsliste der ePA (eML) wird im ePA Medication Service insbesondere über das Profil EPAMedicationStatement abgebildet. ISiK-Medikation stellt mit dem Profil ISiKMedikationsInformation ebenfalls ein MedicationStatement-basiertes Profil zur Abbildung von Medikationsinformationen eines Patienten bereit.

Auf Ebene der Arzneimittelinformation strebt ISiK-Medikation für das Profil ISiKMedikament eine größtmögliche Kompatibilität mit EPAMedication an. Auf Ebene der Medikationsinformation bestehen zudem strukturelle Überschneidungen zwischen EPAMedicationStatement und ISiKMedikationsInformation, insbesondere hinsichtlich der Referenzierung der Medikation, der Angabe von Status, Zeitraum und Dosierungsinformationen.

Unterschiede bestehen insbesondere im jeweiligen Anwendungskontext sowie in ePA-spezifischen Kontext- und Prozessinformationen. EPAMedicationStatement enthält hierfür unter anderem Extensions, beispielsweise für den Kontext des eML-Eintrags und Verarbeitungsereignisse, sowie Referenzen auf Verordnungs- und Dispensierinformationen. Diese Informationen werden in ISiKMedikationsInformation nicht vollständig explizit spezifiziert. Die Verwendung zusätzlicher Extensions wird durch ISiK jedoch nicht ausgeschlossen, sofern diese im konkreten Anwendungsfall benötigt werden. Bei einer Überführung ist daher zu prüfen, welche Informationen direkt übernommen, über zusätzliche Extensions transportiert oder auf andere ISiK-Elemente bzw. -Profile abgebildet werden können.

Für die strukturierte Dosierung verwenden beide Spezifikationen Profile aus dem MedicationDE-Implementierungsleitfaden. ISiKMedikationsInformation verwendet DosageDE, während EPAMedicationStatement DosageDgMP verwendet. Dadurch besteht eine gemeinsame Profilierungsgrundlage, auch wenn die Profile nicht identisch sind.