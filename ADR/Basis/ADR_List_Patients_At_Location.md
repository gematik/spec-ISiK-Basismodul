# ADR: Aktuelle Liste aller Patienten je Station

Datum: 2026-05-08

Status: Vorgeschlagen

Ticket: PTDATA-2220

## Kontext

publisher-guides\Basis\input\pagecontent\UebergreifendeFestlegungen_Suchparameter.md


## Optionen

### Option 1: Alle passenden Encounter anfragen und dann Patienten includieren

Request: `GET baseURL/Encounter?location=Location/loc-hospital&status=in-progress&_include=Encounter:patient`

Die Verkettung der Suchparameter `location` und `status` ist eine UND Verknüpfung, d.h. es werden nur Encounter zurückgegeben, die beide Kriterien erfüllen. Anschließend werden die Patienten über den Include-Parameter inkludiert.

Hier ist der Nachteil, dass die Anzahl der zurückgegebenen Ressourcen sehr groß ist, wenn man eigentlich nur die Patienten haben möchte. Es könnte als Client sinnvoll sein, den include weg zu lassen, das erfordert aber, dass man im lokalen Cache/Speicher die Patienten-IDs hat, die im Encounter als subject referenziert werden.

### Option 2: Alle Patienten mit _has-Parameter anfragen

Request: `GET baseURL/Patient?_has:Encounter:patient:combo-status-location=in-progress$Location/loc-hospital`

Instance: ISiKEncounterComboStatusLocation
InstanceOf: SearchParameter
Usage: #definition
* description = "The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values."
* insert MetaInstance
* name = "comboStatusLocation"
* code = #combo-status-location
* base = #Encounter
* type = #composite
* expression = "Encounter.status | Encounter.location.location"

Wir definieren einen neuen SearchParameter `combo-status-location`, der die Kriterien `status` und `location` kombiniert. Dadurch können wir direkt die Patienten anfragen, die einen Encounter mit den gewünschten Kriterien haben. Eine Verknüpfung mittels zwei _has Parametern ist nicht möglich, da die Kriterien in diesem Fall nicht in einem Encounter UND verknüpft abgefragt werden können.

#### Option 2b Alternative composite Suchparameter auf location.status und location.location

Alternativ könnte der Suchparameter auch auf `location.status = active` und `location.location = Location/loc-hospital` definiert werden. Beide sind in ISiK mit MS belegt, es kann aber gut sein, dass Systeme den Status der Location nicht sauber mit pflegen und daher ist diese Alternative nicht empfohlen.

### Option 3: Kombination von Option 1 und 2

Beide Optionen könnten parallel bereitgestellt werden. Option 1 ist auch in vorherigen ISiK Stufen bereits verpflichtend drin und erfordert keine Anpassung auf Seiten von Servern. Option 2 bietet aber eine deutlich effizientere Möglichkeit, die Patienten direkt abzufragen, ohne die Encounter mit zurückzugeben. Es könnte also sinnvoll sein, beide Optionen anzubieten, um die Kompatibilität zu bestehenden Implementierungen zu gewährleisten und gleichzeitig eine effizientere Abfrage zu ermöglichen.

Es müsste Teil der Entscheidung sein, welche Variante von Option 2 implementiert würde.

## Entscheidung
In der Diskussion haben wir uns für Option 1 entschieden. Es soll dazu aber nochmal textuell verdeutlicht werden, dass eine Nutzung von Chaining, einen Combo Suchparameter erfordert, wenn die Kombination von Station und status im selben Encounter vorliegen soll. 
Auch soll ein Hinweis ergänzt werden, dass ein Client am Ende nochmal prüfen muss, ob die gesuchte location auch tatsächlich den status active hat, da es Systeme geben kann, die eine historie von Location Ressourcen pflegen.

## Konsequenzen

### Positiv

- **Keine Breaking Changes für Server**: Option 1 (`Encounter?location=...&status=...&_include=Encounter:patient`) ist bereits in früheren ISiK-Stufen verpflichtend und erfordert keine neuen Implementierungsaufwände auf Serverseite.
- **Keine neuen Suchparameter notwendig**: Durch den Verzicht auf Option 2 muss kein neuer CompositeSearchParameter (`combo-status-location`) spezifiziert, getestet und von Servern implementiert werden. Das reduziert den Spezifikations- und Implementierungsaufwand.
- **Breite Kompatibilität**: Clients, die bereits mit früheren ISiK-Stufen arbeiten, können die bestehende Anfrage unverändert weiter nutzen.

### Negativ

- **Größere Antwort-Payloads**: Die Antwort enthält immer auch die Encounter-Ressourcen, auch wenn der Client nur die Patienten benötigt. Bei Stationen mit vielen Patienten kann dies zu erheblichem Datenvolumen führen.
- **Chaining erfordert Combo-Suchparameter**: Wer `_has` mit UND-Verknüpfung auf `location` und `status` nutzen möchte (also sicherstellen will, dass beide Kriterien im selben Encounter gelten), benötigt einen CompositeSearchParameter. Dieser ist in der Spezifikation textuell zu erläutern, auch wenn er nicht verpflichtend eingeführt wird, um Fehlanwendungen zu vermeiden.