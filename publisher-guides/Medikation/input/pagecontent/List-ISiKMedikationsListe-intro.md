### Fachliche Guidance zu `List.mode` in `ISiKMedikationsListe`

Für die Ressource `ISiKMedikationsListe` wird `List.mode` zur fachlichen Einordnung des Charakters der Medikationsliste verwendet.

* `snapshot`: abgeschlossene, zu einem bestimmten Zeitpunkt gültige Momentaufnahme der Medikation
* `working`: aktiv gepflegte oder fortlaufend weiterbearbeitete Medikationsliste

Die Wahl von `List.mode` richtet sich danach, ob die Liste als dokumentierter Zustand oder als Arbeitsgrundlage verwendet wird.

Pro Patient und fachlichem Kontext (z. B. Behandlungskontext) sollte in der Regel nur eine aktiv gepflegte Medikationsliste (`List.mode = working` und `List.status = current`) geführt werden.

Dies dient der Vermeidung konkurrierender Listen und stellt eine eindeutige fachliche Referenz sicher.

Mehrere parallele Listen können in unterschiedlichen Kontexten oder für unterschiedliche Zwecke existieren, sollten jedoch klar voneinander abgegrenzt sein.

### Typische Anwendungsszenarien

Die `ISiKMedikationsListe` stellt eine fachliche Zusammenführung von Medikationsinformationen dar. Die Wahl von `List.mode` hängt davon ab, ob ein definierter Zustand dokumentiert oder eine fortschreibbare Liste geführt wird.

**Aufnahmemedikation**

Bei Aufnahme wird die Medikation aus verschiedenen Quellen (z. B. Patientenangaben, Vorbefunde, ePA) zusammengeführt und als Medikationsliste dargestellt.

Typischerweise:
- `working`, wenn die Liste im Behandlungsverlauf weitergeführt wird
- `snapshot`, wenn der Stand zum Aufnahmezeitpunkt dokumentiert wird

**Entlassmedikation**

Die Entlassmedikation beschreibt den Medikationsstand zum Zeitpunkt der Entlassung.

Typischerweise:
- `snapshot` (Dokumentation eines abgeschlossenen Zustands)

**Bericht des Patienten**

Vom Patienten berichtete Medikation wird als Medikationsliste zusammengeführt.

Typischerweise:
- `snapshot`, wenn die Angaben als dokumentierter Stand übernommen werden
- `working`, wenn die Angaben in eine fortgeführte Medikationsliste einfließen

**ePA / externe Quellen**

Medikationsinformationen aus externen Quellen werden in die Liste integriert.

Typischerweise:
- `snapshot`, bei unveränderter Übernahme eines dokumentierten Stands
- `working`, bei Integration in eine fortgeschriebene Liste

**Ableitung aus Verordnungen**

Verordnungen (`MedicationRequest`) können als Grundlage für die Ableitung von `MedicationStatement`-Ressourcen dienen. Diese `MedicationStatement`-Ressourcen bilden die Einträge der `ISiKMedikationsListe`.

Typischerweise:
- `working`, wenn die Liste fortlaufend aus aktuellen Informationen aktualisiert wird
- `snapshot`, wenn ein definierter Zustand der Medikation zu einem Zeitpunkt festgehalten wird