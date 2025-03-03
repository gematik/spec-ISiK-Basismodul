# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.


----
Version: 3.0.0

Datum: 01.07.2023

* Mit dem Release der Stufe 3.0.0 werden die unten gelisteten Änderungen normativ festgesetzt.

----
Version: 3.0.0-rc5

Datum: 21.06.2023

* Beschränkung der normativen Berücksichtigung von CompartmentDefinitions auf das Patient Compartment und klarere Formulierungen zum Zusammenspiel von Scopes und Compartments

----
Version: 3.0.0-rc4

Datum: 01.06.2023

* Die über die Interaktion mit dem Ressourcenserver hinausgehenden Teile von ISiK-Sicherheit aus ISiK Stufe 2 wurden als informative Erläuterungen wieder hinzugefügt. Hersteller oder Krankenhäuser, die _SMART on FHIR_ vollständig umsetzen wollen, erhalten so Hinweise, wie dieses kongruent zu den sonstigen ISiK-Vorgaben möglich ist.
* Die Hinweise zu einem break-the-glass-Szenario wurden gestrichen, da hier die regulativen Rahmenbedingungen in Deutschland deutlich von den Annahmen in den referenzierten, auf das amerikanische Gesundheitssystem fokussierenden Quellen abweichen.
* Hinweis auf den Aufrufparameter "ISS_IDP" hinzugefügt, der für die Unterstützung der sektoralen IdP relevant ist.

----
Version: 3.0.0-rc3

Datum: 25.04.2023

* ReleaseNotes added

----
Version: 3.0.0-rc2

Datum: 24.04.2023

Wesentliche Änderungen gegenüber der Version 2.0.1 sind in folgendem Pull-Request erfolgt:
* Jca_smart_light by @jcaumann in https://github.com/gematik/spec-ISiK-Sicherheit/pull/46

Die Änderungen sind folgende:
*	Für ISIK Stufe 2 waren insbesondere EHR/KIS als bestätigungsrelevante Systeme definiert; in ISiK Stufe 3 sind nur noch Ressourcenserver für ISiK-Security bestätigungsrelevant. Die Motivationen für diese stärkere Fokussierung sind die dadurch konsistentere Fortschreibung von ISiK-Basis sowie die fehlenden Rückmeldungen aus dem ISiK-2-Kommentierungsverfahren zu dem ISiK Stufe 2 zugrunde liegenden Plattformkonzept von _SMART on FHIR_. 
* ISiK Security in ISiK Stufe 3 stellt einen Bezug zwischen SMART Kontexten und FHIR Compartment-Definitionen her. ISiK-Ressourcenserver müssen die Zugehörigkeit einer angefragten Ressource zu einem Kontext durch Abgleich mit der passenden _CompartmentDefinition_ sicherstellen. 
*	Die verpflichtenden Vorgaben zu den Inhalten der _SMART Configuration_ wurden in ISiK-Sicherheit in ISiK Stufe 3 auf die Elemente reduziert, die unmittelbar aus dem OAuth2-Standard abgeleitete Informationen betreffen und für einen interoperablen Austausch von Informationen zu den an den Client delegierten Berechtigungen erforderlich sind. Allein für einen _SMART App Launch_ relevante Elemente sind zunächst lediglich optional.
*	Für die Kodierung der _Scopes_ wurde in ISiK Stufe 2 die Unterstützung der SMART-on-FHIR-Syntax in den Versionen 1 und 2 verpflichtend vorgegeben. In Stufe 3 ist nur noch die v2-Syntax verpflichtend. Hiermit sollen Deployments vereinfacht werden, bei denen die Durchsetzung der (delegierten) Berechtigungen über ein vorgelagertes API-Gateway bzw.- einen Reverse Proxy erfolgt.


----
