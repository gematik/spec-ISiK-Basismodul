# ADR: Aktuelle Liste aller Patienten je Station

Datum: 2026-05-08

Status: Vorgeschlagen

Ticket: PTDATA-2220

## Kontext

publisher-guides\Basis\input\pagecontent\UebergreifendeFestlegungen_Suchparameter.md


## Optionen

### Option 1: Alle passenden Encounter anfragen und dann Patienten includieren

Request: `GET baseURL/Encounter?location=Location/loc-hospital&status=in-progress&_include=Encounter:subject`

Die Verkettung der Suchparameter `location` und `status` ist eine UND Verknüpfung, d.h. es werden nur Encounter zurückgegeben, die beide Kriterien erfüllen. Anschließend werden die Patienten über den Include-Parameter inkludiert.

Hier ist der Nachteil, dass die Anzahl der zurückgegebenen Ressourcen sehr groß ist, wenn man eigentlich nur die Patienten haben möchte. Es könnte als Client sinnvoll sein, den include weg zu lassen, das erfordert aber, dass man im lokalen Cache/Speicher die Patienten-IDs hat, die im Encounter als subject referenziert werden.

### Option 2: Alle Patienten mit _has-Parameter anfragen

Request: `GET baseURL/Patient?_has:Encounter:subject:combo-status-location=in-progress$Location/loc-hospital`

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
[//]: # (
<Konzise Beschreibung der getroffenen Entscheidung.  
Was wird getan / wie wird es gelöst?>
)

## Konsequenzen
[//]: # (
<Positive und negative Auswirkungen der Entscheidung.  
Auswirkungen auf Qualitätseigenschaften, Kosten, Risiken, Betrieb, Wartung.>
)