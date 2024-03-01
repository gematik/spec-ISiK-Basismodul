### Motivation

#### Katalog
ISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/Systeminterne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Displaywerte. 

Eine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients dazugehörige Anzeigetext und Definitionen zu verarbeiten.

Ein Codesystem eignet sich auch dazu, auf dessen Basis definierte [ValueSets zu expandieren](https://hl7.org/fhir/R4/valueset-operation-expand.html).
Da ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich.
Darüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben. 

#### Normativer Status und Bestätigung

Dieses Profil MUSS im Rahmen der Bestätigung NICHT unterstützt werden. Falls das Profil unterstützt werden soll, MÜSSEN die hier definierten Festlegungen greifen (auch im Bestätigungsverfahren). 

---