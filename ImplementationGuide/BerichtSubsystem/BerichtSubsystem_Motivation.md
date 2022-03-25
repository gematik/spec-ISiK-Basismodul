### Motivation

In der heterogenen Systemlandschaft im Krankenhaus sind eine Vielzahl spezialisierter Subsysteme im Einsatz. Die Ergebnisse aus diesen Subsystemen sind aktuell jedoch häufig nicht in den Primärsystemen des Krankenhauses verfügbar, denn aktuell bestehen noch folgende Herausforderungen:

1. Die Daten in Subsystemen sind sehr heterogen und können hochspezialisiert sein.
1. Bei der Nutzung dieser Subsysteme besteht häufig ein Interesse, auf die menschenlesbare Repräsentation der strukturierten Daten einwirken zu können.
1. Künftig ist mit Szenarien zu rechnen, bei denen Befunde aus Subsystemen in eine elektronische Patientenakte übertragen werden sollen.
1. Aktuell werden Befunde, obwohl sie in den Subsystemen in hochstrukturierter Form vorliegen, nur als PDF an das Primärsystem zurückübermittelt. Oft weil kein strukturiertes Format spezifiziert ist, das sowohl versendendes Subsystem als auch empfangendes Primärsystem implementiert haben. 
1. Der Umfang, in dem eine Datenübernahme in ein Primärsystem möglich ist, variiert stark zwischen den Systemen oder Installationen, z.B. abhängig davon, ob ein Modul für Vitalparameter installiert ist.

Die ISiK-Spezifikation begegnet diesen Herausforderungen, indem sie die Rückübermittlung von Ergebnissen aus Subsystemen an die Primärsysteme in Form von strukturierten Dokumenten erfordert, die über eine menschenlesbare Repräsentation verfügen. Diese strukturierten Dokumente werden im ISiK-Kontext als Berichte bezeichnet. Dabei sind die strukturierten Inhalte der Berichte harmonisiert mit den verbreiteten Formaten für Primärsysteme.

In der aktuellen Ausbaustufe von ISiK ist lediglich die Übernahme und Anzeige der Dokument-Metadaten (z.B. Dokumenttyp, Dokumentdatum, Quelle) und der menschenlesbaren HTML-Repräsentation in die Primärsysteme erforderlich.

In weiteren Ausbaustufen von ISiK soll darüber hinaus eine Übernahme der strukturierten Anteile der Dokumente möglich sein, die den ISiK-Spezifikationen entsprechen, z.B. Diagnosen und Prozeduren.

Es obliegt dabei dem Ermessen des Herstellers, ob die Übernahme strukturierter Daten in das Primärsystem automatisch erfolgt, oder durch den Benutzer initiiert wird.

Die Berichte werden, wie von der [FHIR Spezifikation für die Composition Ressource vorgesehen](https://www.hl7.org/fhir/composition.html), in einem FHIR-Bundle versendet.

---
