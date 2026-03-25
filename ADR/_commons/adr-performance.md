# ADR-001: Performance in ISiK

Datum: 18.03.2026  
Status: Vorgeschlagen 
Ticket: PTDATA-1958

## Kontext
Die Performance der REST-Endpunkte in ISiK ist ein entscheidender Faktor für die Akzeptanz und den Erfolg der Implementierung in Krankenhäusern.
Besonders aus Sicht der Client-Hersteller und der Krankenhäuser ist es wichtig, klare Anforderungen und Zielwerte für die Performance zu definieren, um eine reibungslose Integration und Nutzung der ISiK-API zu gewährleisten.
Die Performance-Anforderungen müssen dabei die unterschiedlichen Abfragetypologien berücksichtigen, um sicherzustellen, dass die API in kritischen Situationen schnell und zuverlässig reagiert, ohne die Arbeitsabläufe zu stören.

Die Idee besteht darin, minimale und grob definierte Performance-Anforderungen in der Spezifikation zu definieren. Diese Anforderungen sollen als Orientierung für die Implementierung dienen und im Rahmen des Zertifizierungsverfahren nachjustiert werden werden können.

## Optionen
- Performance-Kategorien für verschiedene Interaktionen / Suchabfragen-Typologien (s.u. im Detail)
- Beschränkung auf 2 Performance Kategorien
- Festlegung von konkreten Performance-Zielwerten entlang von Rollen.  
  - Diese Alternative wurde verworfen, da die Rollen zu grob-granular sind.
- Festlegung von abstrakten Performance-Zielwerten entlang von Rollen.  
  - Diese Alternative wurde verworfen, da für Testing schlecht.
- Verwendung von generischen Performance-Zielwerten für alle Endpunkte, unabhängig von der Rolle oder dem Anwendungsfall.  
  - Diese Alternative wurde verworfen, da sie die spezifischen Anforderungen und Arbeitsabläufe der verschiedenen Nutzerrollen nicht berücksichtigt und somit in kritischen Situationen zu unzureichender Performance führen könnte.

## Entscheidung
1) Es werden Performance-Kategorien definiert, entlang der Kriterien und in der Spec angegeben (siehe Spec zu den Kategorien).
2) Für jede Performance-Kategorien werden grobe Vorgaben für Response Times (ALLEIN!) in der Spezifikation vorgehalten.
NICHT: Lasten, Durchsatz
3) Anforderungen betreffen best. Systeme allein und NICHT sonstige Infrastruktur


## Konsequenzen
- Positive Auswirkungen:  
  - Pragmatische Definition von Performance-Kategorien ermöglicht ein Mindestmaß an Performance für anfragende Clients.   
- Negative Auswirkungen:  
  - Da Spec-seitig festgelegt, ggf. hier nachträgliche Anpassung nötig.

## Anhänge (optional)
<Verweise auf Tickets, Dokumente, Prototypen o.Ä.>

### gemSpec_Perf
Es besteht gematik-seitig eine TI-Spezifikation: die "Performance-Spezifikation hat zum Ziel, die Performance-Kenngrößen für alle Produkttypen der TI zu definieren und die Anforderungen an die Performance der Produkttypen zu stellen." (https://gemspec.gematik.de/docs/gemSpec/gemSpec_Perf/latest/#1.1)

Hier sind drei Aspekte berücksichtigt:
- Bearbeitungszeit
- Durchsatz
- Verfügbarkeit

Offene Frage hier: an welches TI-Produkt kann sich ISiK orientieren?
-> ggf. FHIR VZD ? https://gemspec.gematik.de/docs/gemSpec/gemSpec_Perf/latest/#3.24
-> ggf. https://gemspec.gematik.de/docs/gemSpec/gemSpec_Perf/latest/#3.28