---
topic: markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen-Rest
---
# REST-API

## Read-Interaktionen
Instanzen von Datenobjekten, die die REST-Interaktion "READ" fordern, MÜSSEN per HTTP GET auf ```[BASE_URL]/[resourceType]/[ID]``` abgerufen werden können. 
Siehe: https://www.hl7.org/fhir/R4/http.html#read 

### Profil-Konformität
Instanzen, die von einem ISiK-konformen Server über READ-Interaktionen bereitgestellt werden, SOLLEN valide gegen die entsprechenden ISiK-Profile sein. Ausnahmen bilden Instanzen, die für Anwendungsfälle außerhalb des ISIK-Scopes erstellt wurden oder historische Daten, die bereits *vor* der ISiK-Implementierung erzeugt, oder aus nicht-ISiK-konformen Systemen übernommen wurden.

### Nicht profilierte Ressourcentypen
Weiterhin steht es Servern frei, neben den in ISIK profilierten auch weitere Ressourcentypen über die REST-API bereitzustellen, sofern dies im CapabilityStatement des Servers entsprechend spezifiziert ist. Server SOLLEN dabei auf ein öffentlich verfügbares Profil des jeweiligen Ressourcentyps referenzieren, das die vom Server implementierten Constraints abbildet. Es KANN sich dabei um ein Profil aus einem anderen (z.B. IHE-/KBV-/MII-)Implementierungsleitfaden oder ein vom Hersteller selbst publiziertes Profil handeln.

### generische Ressourcentypen
Darüber hinaus ist es Servern gestattet, in ISiK profilierte generische Ressourcentypen, wie z.B. Organization oder Observation in Kontexten außerhalb der in ISiK spezifizierten UseCases zu verwenden.



## Search-Interaktionen
Die Suche MUSS sowohl mittels HTTP GET als auch HTTP POST (vgl. [FHIR RESTful Search - Introduction](https://www.hl7.org/fhir/R4/search.html#Introduction)) unterstützt werden. Die URL-Parameter komplexer Suchanfragen können personenbezogene Merkmale enthalten, daher ist im Echtbetrieb die Suche mittels HTTP POST in Verbindung mit TLS-Verschlüsselung vorzuziehen. 

## Create-Interaktionen
Ein System KANN das Erstellen einer Ressource mittels HTTP POST (vgl. [FHIR RESTful API - create](https://www.hl7.org/fhir/R4/http.html#create)) unterstützen. Einzelne Datenobjekte (spezifiziert im vorliegenden Basismodul oder in einem ISiK Erweiterungsmodul) können diese Interaktion als verpflichtend kennzeichnen.

Es liegt im Ermessen des bestätigungsrelevanten Systems, ob eine externe Ressource durch das System direkt übernommen wird. Auch wie die Herkunft der übernommenen Ressource gekennzeichnet wird, liegt im Ermessen des bestätigungsrelevanten Systems.

Eine Ressource welche nicht durch das bestätigungsrelevante System angelegt wird, KANN in ```Resource.meta.tag``` eine Angabe enthalten, welche indiziert, dass diese Ressource durch ein Fremdsystem erzeugt wurde. Dieser Tag KANN durch den Server hinzugefügt werden, sollte der Client diese Angabe nicht von sich aus übermitteln. Eine von einem System vorgenommene Auszeichnung von Fremdübernahmen SOLL über den Code ```external``` aus dem Kodiersystem ```https://fhir.de/CodeSystem/common-meta-tag-de``` erfolgen. Weitere Kodierungen KÖNNEN hinzugefügt werden. Ein Beispiel in ```json```:

```
{
    "resourceType": "Patient",
    "meta": {
        "tag": [
            {
                "system": "http://fhir.de/CodeSystem/common-meta-tag-de",
                "code": "external"
            }
        ]
    }
    [...]
}
```

Eine weitere Differenzierung der Herkunft kann mittels ```Resource.meta.security``` kodiert werden. Hierzu KÖNNEN Codes aus dem ValueSet [SecurityIntegrityObservationValue](https://terminology.hl7.org/ValueSet/v3-SecurityIntegrityObservationValue) verwendet werden.

Sollte die erzeugte Ressource dauerhaft in das bestätigungsrelevante System übernommen werden, KANN der entsprechende Tag in ```Patient.meta.tag``` entfernt werden. In diesem Falle MUSS die id der Ressource stabil bleiben und darf nicht verändert werden.


Per Create-Interaktion erzeugte Ressourcen MÜSSEN im Falle einer erfolgreichen Übermittlung direkt über die READ- und SEARCH-Interaktionen zur Verfügung gestellt werden.

Ressourcen, die zu einem entsprechenden ISiK-Profil nicht konform sind, KÖNNEN durch das bestätigungsrelevante System abgewiesen werden.  Falls diese abgewiesenen Ressourcen syntaktisch korrekt sind, dann SOLL der Server als Antwort ein HTTP Status-Code 422 - Unprocessable Entity mit einer ```OperationOutcome```-Ressource zurückgeben.

Falls es sich um einen syntaktischen Fehler in der Repräsentation der Ressource handelt, dann SOLL als Antwort ein HTTP Status-Code 400 - Bad Request mit einer ```OperationOutcome```-Ressource zurückgegeben werden. Die ```OperationOutcome``` SOLL eine Auflistung aller Fehler in der übermittelten Ressource in kodierter Form vorweisen. Anderweitig (semantisch) invalide Ressourcen KÖNNEN ebenfalls mit einer entsprechenden OperationOutcome-Ressource abgewiesen werden. In diesem Fall SOLL der HTTP Status-Code HTTP 422 - Unprocessable Entity verwendet werden.

**Hintergrund:** Bei diesen Festlegungen wurden die Vorgaben der [Kernspezifikation](https://hl7.org/fhir/http.html#create) übernommen.

Systeme SOLLEN die [Hinweise zum korrekten Umgang mit Validierung beachten](https://hl7.org/fhir/R4/validation.html#correct-use) und dem [Robustheitsgrundsatz](https://de.wikipedia.org/wiki/Robustheitsgrundsatz) folgen:  "Eine Implementierung sollte in ihrem Sendeverhalten konservativ und in ihrem Empfangsverhalten liberal sein."


## Update-Interaktionen
Das Update einer Ressource KANN per HTTP PUT (vgl. [FHIR RESTful API - update](https://www.hl7.org/fhir/R4/http.html#update)) unterstützt werden. Es ist zu beachten, dass beim Update einer Ressource bestimmte dazugehörige [Metadaten](https://www.hl7.org/fhir/R4/resource.html#Meta) beibehalten werden SOLLTEN. Die gleichen Vorgaben für die Handhabung von invaliden Ressourcen wie beschrieben im Abschnitt "Create-Interaktionen", gelten auch für Update-Interaktionen.


## Sicherheitsaspekte
Alle REST-Interaktionen müssen sowohl mittels HTTP als auch HTTPS (TLS-Verschlüsselung) unterstützt werden. Vorgaben zur TLS-Verschlüsselung sind dem nachfolgenden Link für die FHIR Security Check List zu entnehmen.
Im Echtbetrieb MUSS die Kommunikation ausschließlich per HTTPS erfolgen.
Weiterhin sind geeignete Maßnahmen zur Risiko-Minimierung (z.B. Benutzerautorisierung / -authentifikation) zu treffen, siehe http://build.fhir.org/security.html#6.1.0. 
Diese sind in der jetzigen Stufe des ISiK Basismoduls jedoch nicht bestätigungsrelevant.
