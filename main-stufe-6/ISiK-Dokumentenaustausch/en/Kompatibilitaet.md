# Kompatibilität zu IHE-Profilen - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Kompatibilität zu IHE-Profilen**

## Kompatibilität zu IHE-Profilen

Die Festlegungen in diesem ISiK-Modul wurden auf Grundlage des [IHE-MHD-Profils](https://build.fhir.org/ig/IHE/ITI.MHD/) getroffen.

Die Intention der ISiK-Spezifikation ist es, die IHE-Interaktionen auf das notwendige Minimum für die einrichtungsinterne Kommunikation zu reduzieren, dabei jedoch alle erforderlichen Dokumenten-Metadaten für eine spätere Weitergabe der Dokumente an z.B. eine ePA oder ein IHE-MHD-basiertes Repository zu erheben.

Das IHE-MHD Profil ist kompatibel zu IHE-XDS. Die Mappings von MHD zu XDS sind seitens IHE definiert.

Dabei ist jedoch zu beachten, dass bei der Einstellung von Dokumenten in eine IHE-Registry weitere Metadaten über den Vorgang des Einstellens (Abgebildet im IHE-Konzept "SubmissionSet") hinzugefügt werden müssen, die im Kontext der ISiK Spezifikation keine Berücksichtigung finden.

Als Terminologien kommen bei ISiK - soweit sinnvoll und möglich - die XDS-ValueSets von IHE Deutschland zum Einsatz.

### Abweichungen zwischen ISiK und IHE-MHD

Für historische Abweichungen, die jedoch zwischenzeitlich entweder seitens IHE oder seitens ISiK gelöst wurden, siehe (Historie: Abweichungen zwischen ISiK und IHE-MHD)[https://simplifier.net/guide/isik-dokumentenaustausch-stufe-5/Einfuehrung/UseCasesUndAkteure/Kompatibilitaet?version=5.1.2].

#### Dokumentenstatus

Vor dem Hintergrund des einrichtungsübergreifenden Dokumentenaustausches geht IHE-MHD davon aus, dass alle kommunizierten Dokumente einen finalen Status haben. Dies ist jedoch bei der einrichtungs**internen** Kommunikation, wie sie von ISiK spezifiziert wird, nicht gegeben. Im Gegenteil: die Suche und Filterung von Dokumenten anhand des Fertigstellungsstatus war ein häufig geäußerter Wunsch bei der Sammlung potentieller Use Cases. Daher ist die Verwendung des Feldes `docStatus` in ISiK explizit erlaubt. Um die technische Kompatibilität mit dem DocumentReference-Profil von IHE-MHD zu wahren [wurde der Änderungswunsch an IHE herangetragen](https://github.com/IHE/ITI.MHD/issues/96), den Constraint, der die Verwendung von `docStatus` verbietet, zu lockern.

Im Kontext von ISiK muss es auch möglich sein, den Status eines Dokumentes ändern zu können, ohne dabei das Dokument vollständig ersetzen zu müssen, wie es im IHE-MHD-Kontext der Fall ist. In ISiK wurde hierfür die Interaktion "Update von Dokumentenmetadaten" definiert.

#### Patientenübergreifende Suche

Im Kontext von IHE-MHD sind Clients verpflichtet, bei allen Suchen mindestens die Parameter `patient` oder `patient.identifier` sowie `status` zu verwenden. In ISiK sollen perspektivisch jedoch auch patientenübergreifende Suchen, wie z.B. nach allen nicht abgeschlossenen Arztbriefen einer Station oder allen Spirometrie-Befunden der letzten Woche unterstützt werden. Da diese UseCases und die dafür benötigten Suchparameter (bzw. deren Kombinationen) jedoch zum aktuellen Zeitpunkt nicht klar definiert sind, bleibt die Implementierung einer patientenübergreifenden Suche eine freiwillige Option für ISiK-konforme Systeme. Diese Einschränkung im MHD-Kontext, dass **nur** patientenbezogene Suchen erlaubt seien, gilt im ISiK-Kontext nicht.

