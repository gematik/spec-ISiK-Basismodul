# ADR-001: Performance in ISiK

Datum: 12.03.2026  
Status: Vorgeschlagen 
Ticket: PTDATA-1958

## Kontext
Die Performance der REST-Endpunkte in ISiK ist ein entscheidender Faktor für die Akzeptanz und den Erfolg der Implementierung in Krankenhäusern.
Besonders aus Sicht der Client-Hersteller und der Krankenhäuser ist es wichtig, klare Anforderungen und Zielwerte für die Performance zu definieren, um eine reibungslose Integration und Nutzung der ISiK-API zu gewährleisten.
Die Performance-Anforderungen müssen dabei die unterschiedlichen Nutzerrollen und deren Arbeitsabläufe berücksichtigen, um sicherzustellen, dass die API in kritischen Situationen schnell und zuverlässig reagiert, ohne die Arbeitsabläufe der Nutzer zu stören.

Die Idee besteht darin, minimale und grob definierte Performance-Anforderungen in der Spezifikation zu definieren, die sich an den bestehenden Rollen in ISiK orientieren. Diese Anforderungen sollen als Orientierung für die Implementierung dienen und im Rahmen des Zertifizierungsverfahrens überprüft werden.

## Entscheidung
Es werden Performance-Kategorien definiert, die den ISiK bestehenden Rollen zugeordnet werden. 
Für jede Performance-Kategorien werden grobe Vorgaben in der Spezifikation vorgehalten.
Für jede Performance-Kategorie werden spezifische Performance-Anforderungen (z.B. Antwortzeiten, Lasten, Durchsatz) im Test-System dokumentiert und definiert, sodass diese im des Zertifizierungsverfahrens für einzelne Suchabfragen und Interaktionen implementiert und überprüft werden.

## Alternativen
- Festlegung von konkreten Performance-Zielwerten (z.B. Antwortzeiten in Millisekunden) direkt in der Spezifikation, ohne Unterscheidung von Performance-Kategorien.  
  - Diese Alternative wurde verworfen, da bisher ungenügend Erfahrungswerte vorliegen, um konkrete Zielwerte für alle Endpunkte und Interaktionen festzulegen. Zudem würde dies die Flexibilität bei der Implementierung einschränken, da unterschiedliche Rollen und Anwendungsfälle unterschiedliche Performance-Anforderungen haben können.
- Verwendung von generischen Performance-Zielwerten für alle Endpunkte, unabhängig von der Rolle oder dem Anwendungsfall.  
  - Diese Alternative wurde verworfen, da sie die spezifischen Anforderungen und Arbeitsabläufe der verschiedenen Nutzerrollen nicht berücksichtigt und somit in kritischen Situationen zu unzureichender Performance führen könnte.

## Konsequenzen
<Positive und negative Auswirkungen der Entscheidung.  
Auswirkungen auf Qualitätseigenschaften, Kosten, Risiken, Betrieb, Wartung.>
- Positive Auswirkungen:  
  - Pragmatische Definition von Performance-Kategorien ermöglicht eine gezielte Optimierung der API für unterschiedliche Nutzerrollen und Anwendungsfälle.  
  - Flexibilität bei der Implementierung, da die Performance-Anforderungen an die spezifischen Bedürfnisse der angepasst werden können.  
- Negative Auswirkungen:  
  - Die grobe Definition der Performance-Kategorien könnte zu Unsicherheiten bei der Implementierung führen, da konkrete Zielwerte fehlen.  
  - Es besteht das Risiko, dass die Performance-Anforderungen nicht ausreichend umgesetzt werden.
  - Ggf. zusätzliche Implementierungsaufwände -> dies kann aber auch als Chance gesehen werden, um die Performance der API gezielt zu optimieren.

## Anhänge (optional)
<Verweise auf Tickets, Dokumente, Prototypen o.Ä.>
