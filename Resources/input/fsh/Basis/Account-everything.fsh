Instance: Patient-everything
InstanceOf: OperationDefinition
Usage: #definition
* insert MetaInstance
* url = "https://gematik.de/fhir/isik/OperationDefinition/ISiKAccountEverything"
* title = "ISiK Account-everything"
* kind = #operation
* name = "ISiKAccountEverything"
* description = "Diese Operation gibt alle Informationen zurück, die mit einem Abrechnungsfall (Account) verknüpft sind. Ein Account kann dabei mehrere Encounter (Abteilungskontakte) umfassen. Zum Beispiel vorstationäre Besuche, den stationären Aufenthalt sowie nachstationäre Besuche.\n\nDie Operation ermittelt zunächst alle Encounter, die dem angegebenen Account zugeordnet sind. Anschließend wird für jeden dieser Encounter die Operation [Encounter-everything](http://hl7.org/fhir/OperationDefinition/Encounter-everything) ausgeführt. Die resultierenden Searchsets werden zu einem gemeinsamen Bundle vom Typ \"searchset\" zusammengeführt und dedupliziert.

Welche Ressourcen der Server dabei zurückgeben soll, ist in der [$Encounter-everything](https://gematik.de/fhir/isik/OperationDefinition/ISiKEncounterEverything) Operation beschrieben.

Der primäre Verwendungszweck dieser Operation ist es, einem Nutzer alle zu einem Abrechnungsfall gehörenden medizinischen Informationen bereitzustellen oder einem Client zu ermöglichen, sämtliche Daten eines Abrechnungsfalls effizient abzurufen und darzustellen. Beispielsweise um einen Stamm an Daten bei Erstinstallation der Applikation zu erhalten."
* code = #everything
* comment = "Die wesentlichen Unterschiede zwischen dieser Operation und einer einfachen Suche innerhalb der zum Account gehörenden Encounter sind:

* Sofern der Client nichts anderes anfordert, gibt der Server das gesamte Ergebnis in einem einzigen Bundle zurück (anstatt Paging zu verwenden)
* Der Server ist dafür verantwortlich, die als included resources zurückzugebenden Ressourcen zu bestimmen (anstatt dass der Client dies vorgibt)

Dies befreit den Client davon, selbst bestimmen zu müssen, welche Ressourcen er anfordern kann oder soll, insbesondere hinsichtlich der included resources.

Intern führt die Operation die [$Encounter-everything](https://gematik.de/fhir/isik/OperationDefinition/ISiKEncounterEverything) Operation für jeden dem Account zugeordneten Encounter aus und vereint die resultierenden Searchsets. Ressourcen, die in mehreren Encounter-Ergebnissen enthalten sind, werden dabei dedupliziert. 

Wenn diese Operation für einen Account mit vielen Encountern und umfangreichen Daten verwendet wird, kann die zurückgegebene Datenmenge sehr groß sein. Server können verlangen, dass solche Anfragen asynchron gestellt werden. Alternativ können Clients durch die Ergebnismenge blättern (oder Server können dies verlangen). Das Blättern durch die Ergebnisse erfolgt analog zur [Suche](http.html#paging) mithilfe des Parameters [_count](search.html#count) und Bundle-Links.

Der Parameter _since ermöglicht periodische Abfragen, um zusätzliche Informationen zu erhalten, die sich seit der letzten Abfrage geändert haben. Der Wert des Parameters _since sollte auf die Zeitangabe des Servers gesetzt werden. Bei direkter Antwort ist dies der Zeitstempel im Antwort-Header, bei asynchroner Nutzung der Transaktionszeitstempel in der JSON-Antwort. Server müssen sicherstellen, dass Zeitstempel so verwaltet werden, dass dem Client keine Änderungen entgehen. Clients müssen in der Lage sein, dieselbe Antwort mehr als einmal zu verarbeiten, falls eine Transaktion auf eine Zeitgrenze fällt."
* resource = #Account
* system = false
* type = false
* instance = true
* parameter[0].name = #_since
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Ressourcen, die nach diesem Zeitpunkt aktualisiert wurden, werden in der Antwort berücksichtigt. Dieser Parameter ermöglicht es einem Client, nur Datensätze abzurufen, die sich seit der letzten Anfrage geändert haben, basierend auf dem Zeitstempel im Antwort-Header oder (bei asynchroner Nutzung) dem Transaktionszeitstempel."
* parameter[=].type = #instant
* parameter[+].name = #_type
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "Ein oder mehrere Parameter, die jeweils einen oder mehrere kommagetrennte FHIR-Ressourcentypen enthalten, die in der Antwort zurückgegeben werden sollen. Werden keine Typen angegeben, gibt der Server alle Ressourcentypen zurück."
* parameter[=].type = #code
* parameter[+].name = #_count
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Siehe Hinweise zur Verwendung von Paging bei der $everything-Operation."
* parameter[=].type = #integer
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Der Bundle-Typ ist \"searchset\"."
* parameter[=].type = #Bundle