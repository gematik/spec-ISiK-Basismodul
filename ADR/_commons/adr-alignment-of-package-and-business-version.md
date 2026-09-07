# ADR: Gleichlauf von Paketversion und Business-Version der Terminologieressourcen

Datum: 2026-09-07  

Status: Vorgeschlagen  

Ticket: PTDATA-2240

## Kontext
In der ISiK-Spezifikation wird die Business-Version (Element `version`) aller Konformitätsressourcen – einschließlich der Terminologieressourcen (CodeSystems, ValueSets) – zentral über das RuleSet `Meta` (`^version = $ISIKVersion`) auf die Paketversion der Spezifikation gesetzt. Paketversion und Business-Version der enthaltenen Terminologieressourcen laufen somit stets im Gleichlauf: Mit jedem Release erhalten alle Terminologieressourcen eine neue Business-Version – unabhängig davon, ob sich ihr Inhalt geändert hat.

Im Rahmen der Kommentierung wurde dieses Vorgehen kritisch hinterfragt:

- Eine automatische Anpassung der Business-Version bei jeder Paketänderung – auch ohne inhaltliche Modifikation der Ressource – führt zu semantischer Unschärfe und untergräbt die Nachvollziehbarkeit fachlicher Änderungen.
- Die Business-Version einer Terminologieressource sollte sich genau dann ändern, wenn sich der Inhalt der Ressource ändert; alleinige Rebuilds rechtfertigen keine neue Business-Version.
- Ein erzwungener Gleichlauf kann zu Inkonsistenzen führen: Versionserhöhungen suggerieren eine inhaltliche Änderung, obwohl tatsächlich lediglich ein Rebuild erfolgt ist.

Es ist daher zu entscheiden, ob der Gleichlauf von Paketversion und Business-Version für Terminologieressourcen beibehalten wird oder ob Terminologieressourcen eine eigenständige, inhaltsbasierte Versionierung (z.B. nach [Semantic Versioning](https://semver.org)) erhalten.

Randbedingungen und Annahmen:

- Werkzeugkette: SUSHI bzw. der IG Publisher setzen die Business-Version standardmäßig auf die Paketversion, sofern keine explizite Version je Ressource gepflegt wird. Eine ressourcenspezifische Versionierung erfordert manuelle Pflege je Ressource sowie einen definierten Prozess, wann eine Version zu erhöhen ist.
- Die ISiK-Spezifikation legt für CodeSystems bestätigungsrelevanter Systeme selbst ein inhaltsgetriebenes Versionsverständnis zugrunde (Profil `ISiKCodeSystem`): "Jede Änderung des CodeSystems MUSS eine Änderung in der Version des CodeSystems und gebundenen ValueSets nach sich ziehen." Daraus folgt umgekehrt nicht, dass jede Paketänderung eine neue Business-Version erfordert.
- Die Entscheidung steht im Zusammenhang mit der Überlegung, Terminologieressourcen in ein eigenes Terminologie-Paket auszulagern (PTDATA-2240). Auch bei getrennter Paketierung stellt sich die Frage nach dem Verhältnis von Paketversion und Business-Version erneut.
- Abweichende Business-Versionen wirken sich ggf. auf versionierte Bindings/Canonicals, die Validierung sowie das Verhalten von Terminologieservern (z.B. bei der Expansion von ValueSets) aus.

## Optionen

### Option 1: Status quo – Gleichlauf beibehalten
Die Business-Version aller Terminologieressourcen wird weiterhin zentral auf die Paketversion gesetzt (RuleSet `Meta`).

- PRO:
  - Kein zusätzlicher Pflegeaufwand; keine Prozessänderung notwendig.
  - Entspricht dem Default der Werkzeugkette (SUSHI/IG Publisher); keine Sondermechanik.
  - Aus der Business-Version ist unmittelbar ablesbar, mit welchem Release die Ressource ausgeliefert wurde; durchgängig konsistente versionierte Canonicals innerhalb der Spezifikation.
  - Kein Risiko, eine Versionserhöhung nach inhaltlicher Änderung zu vergessen.
- CON:
  - Semantische Unschärfe: Versionserhöhungen suggerieren inhaltliche Änderungen, obwohl ggf. nur ein Rebuild/Release erfolgt ist (Kernkritik der Kommentierung).
  - Fachliche Änderungen sind nicht anhand der Version nachvollziehbar; Konsumenten müssen Inhalte diffen.
  - Widerspricht dem Grundgedanken von Semantic Versioning sowie dem inhaltsgetriebenen Versionsverständnis, das die Spezifikation in `ISiKCodeSystem` selbst fordert.
  - Terminologieserver und validierende Systeme behandeln unveränderte Inhalte ggf. unnötig als neue Versionen (Re-Import, erneute Expansion).

### Option 2: Eigenständige, inhaltsbasierte Versionierung je Terminologieressource
Terminologieressourcen (CodeSystems, ValueSets) werden aus dem zentralen Versions-Stempel herausgenommen und erhalten je Ressource eine explizit gepflegte `version` (Semantic Versioning), die nur bei inhaltlicher Änderung erhöht wird.

- PRO:
  - Semantisch präzise: Versionsänderung genau dann, wenn sich der Inhalt ändert; fachliche Änderungen sind nachvollziehbar.
  - Konsistent mit Semantic Versioning und der Anforderung aus `ISiKCodeSystem`.
  - Stabile Versionen über Releases hinweg reduzieren unnötige Folgeprozesse bei Terminologieservern und Konsumenten.
- CON:
  - Manuelle Pflege je Ressource; erfordert einen definierten Prozess (wann major/minor/patch?) und Disziplin im Review.
  - Fehlerrisiko: Eine inhaltliche Änderung ohne Versionserhöhung wäre schwerwiegender als der Status quo (stille Änderung unter gleicher Version). Dieses Risiko lässt sich durch einen automatisierten Versions-/Inhaltsabgleich in der CI weitgehend abfangen (siehe unten); es entfällt dadurch aber nicht vollständig, da die Einstufung der Änderung (major/minor/patch) eine Review-Entscheidung bleibt.
  - Gemischte Versionsstände innerhalb eines Pakets (Profile auf Paketversion, Terminologie mit eigenen Versionen) können verwirren, insbesondere bei versionierten Bindings.
  - Aus der Business-Version ist nicht mehr ablesbar, zu welchem Release die Ressource gehört.

### Option 3: Auslagerung in ein eigenes Terminologie-Paket
Terminologieressourcen werden in ein separates Paket mit eigener Release-Kadenz ausgelagert (vgl. PTDATA-2240); ein Release des Terminologie-Pakets erfolgt nur bei inhaltlichen Änderungen. Der Gleichlauf kann innerhalb dieses Pakets bestehen bleiben.

- PRO:
  - Der Gleichlauf bleibt werkzeugunterstützt und pflegearm, gewinnt aber Bedeutung zurück: Eine neue Paketversion impliziert eine inhaltliche Änderung der Terminologie.
  - Unabhängiger Lebenszyklus: Spezifikations-Releases (Rebuilds, redaktionelle Änderungen) berühren die Terminologieversionen nicht mehr.
  - Wiederverwendbarkeit der Terminologie über ISiK-Module hinweg und durch Dritte; etabliertes Vorbild mit `de.gematik.terminology`.
- CON:
  - Zusätzlicher Betriebs- und Pflegeaufwand: eigenes Paket, eigene Pipeline, Abhängigkeits- und Release-Management in den ISiK-Modulen.
  - Granularität auf Paketebene: Die Änderung einer einzelnen Ressource hebt die Versionen aller Ressourcen des Pakets an – die semantische Unschärfe kehrt in abgeschwächter Form auf Paketebene zurück (vermeidbar nur in Kombination mit Option 2).
  - Migrationsaufwand (Publikationsprozess, ggf. Umstellung von Referenzen/Abhängigkeiten in allen Modulen).

### Option 4: Gleichlauf beibehalten, Änderungen redaktionell dokumentieren
Der Mechanismus bleibt unverändert; je Release wird dokumentiert (z.B. in den Release Notes), welche Terminologieressourcen sich inhaltlich geändert haben.

- PRO:
  - Minimaler Aufwand; Nachvollziehbarkeit fachlicher Änderungen wird zumindest dokumentarisch hergestellt.
- CON:
  - Löst das semantische Kernproblem nicht: Die Business-Version suggeriert weiterhin Änderungen, die nicht stattgefunden haben.
  - Nachvollziehbarkeit hängt an redaktionaler Disziplin und ist maschinell nicht auswertbar.

Hinweis: Option 2 und Option 3 schließen sich nicht aus – ein eigenes Terminologie-Paket mit zusätzlich inhaltsbasierter Versionierung je Ressource würde beide Kritikpunkte vollständig adressieren, verursacht aber den höchsten Pflegeaufwand.

### Flankierende Maßnahme zu Option 2 und 3: Automatisierter Versions-/Inhaltsabgleich in der CI
Unabhängig von der Wahl zwischen Option 2 und Option 3 kann eine zusätzliche CI-Prüfung (GitHub Action, eingebettet in die bestehende Quality-Control-Pipeline, vgl. `.github/workflows/fhir-quality-control.yml` bzw. `scripts/QualityAssuranceAutomation`) den Inhalt jeder Terminologieressource gegen den zuletzt veröffentlichten Stand abgleichen und Abweichungen zwischen Inhalts- und Versionsänderung melden. Wesentliche Festlegungen:

- Vergleichsbasis ist das zuletzt veröffentlichte Paket (Package-Registry bzw. letzter Release-Tag), nicht der vorherige Commit – andernfalls würde jeder Zwischenstand auf einem Feature-Branch eine Versionserhöhung einfordern.
- Vor dem Vergleich werden volatile bzw. werkzeuggenerierte Anteile normalisiert (u.a. `meta.lastUpdated`, `date`, generierte Narrative in `text`, vom IG Publisher injizierte Extensions); verglichen wird ein Hash über den verbleibenden Inhalt.
- Geprüft wird in beide Richtungen: Inhalt geändert bei unveränderter `version` → Fehler (blockierend); `version` erhöht bei unverändertem Inhalt → Warnung; neue oder entfallene Ressourcen → Hinweis.
- Für Option 3 greift dieselbe Prüfung auf Paketebene ("Paketinhalt geändert, aber Paketversion unverändert").

- PRO:
  - Reduziert den zentralen CON von Option 2 (stille inhaltliche Änderung unter gleicher Version) auf ein Werkzeugthema; die Einhaltung hängt nicht mehr allein an der Review-Disziplin.
  - Erkennt zusätzlich unnötige Versionserhöhungen und macht damit auch die semantische Unschärfe sichtbar, die Option 1 systematisch erzeugt.
  - Der ermittelte Diff liefert die Liste der inhaltlich geänderten Terminologieressourcen maschinell und stellt damit das Ergebnis von Option 4 als Nebenprodukt bereit (Release Notes).
  - Macht die Anforderung aus `ISiKCodeSystem` ("Jede Änderung des CodeSystems MUSS eine Änderung in der Version [...] nach sich ziehen") erstmals maschinell prüfbar.
- CON:
  - Zusätzliches, selbst gepflegtes Werkzeug in der Pipeline; insbesondere die Normalisierungsregeln müssen bei Änderungen der Werkzeugkette (z.B. neue IG-Publisher-Version) nachgezogen werden. Unvollständige Normalisierung führt zu Fehlalarmen und damit zur Abstumpfung gegenüber der Prüfung.
  - Die Prüfung erkennt nur, *dass* eine Versionserhöhung erforderlich ist, nicht *welche* Stufe (major/minor/patch) angemessen ist; die SemVer-Einstufung bleibt eine Review-Entscheidung. Eine heuristische Klassifikation (z.B. entfernter oder inhaltlich geänderter Code ⇒ mindestens minor) wäre als Ausbaustufe denkbar.
  - Setzt einen stabil erreichbaren Referenzstand des letzten Releases voraus (Registry-Zugriff bzw. archivierte Paketstände).

## Entscheidung
[//]: # (
<Konzise Beschreibung der getroffenen Entscheidung.  
Was wird getan / wie wird es gelöst?>
)

## Konsequenzen
[//]: # (
<Positive und negative Auswirkungen der Entscheidung.  
Auswirkungen auf Qualitätseigenschaften, Kosten, Risiken, Betrieb, Wartung.>
)

## Anhänge (optional)
[//]: # (
<Verweise auf Dokumente, Prototypen o.Ä.>
)