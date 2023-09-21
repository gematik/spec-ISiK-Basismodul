# REST-API

## Read-Interaktionen
Instanzen von Datenobjekten, die die REST-Interaktion "READ" fordern MÜSSEN per HTTP GET auf ```[BASE_URL]/[resourceType]/[ID]``` abgerufen werden können. 
Siehe: https://www.hl7.org/fhir/http.html#read 

## Search-Interaktionen
Die Suche MUSS sowohl mittels HTTP GET als auch HTTP POST (vgl. [FHIR RESTful Search - Introduction](https://www.hl7.org/fhir/search.html#Introduction)) unterstützt werden. Die URL-Parameter komplexer Suchanfragen können personenbezogene Merkmale enthalten, daher ist im Echtbetrieb die Suche mittels HTTP POST in Verbindung mit TLS-Verschlüsselung vorzuziehen. 

## Create-Interaktionen
Das Erstellen einer Ressource kann per HTTP POST (vgl. [FHIR RESTful API - create](https://www.hl7.org/fhir/http.html#create)) unterstützt werden. Einzelne Datenobjekte (spezifiziert im vorliegenden Basismodul oder in einem ISiK Erweiterungsmodul) können diese Interaktion als verpflichtend kennzeichnen.

Es liegt im Ermessen des bestätigungsrelevanten Systems, ob eine externe Ressource durch das System direkt übernommen wird. Auch wie die Herkunft der übernommenen Ressource gekennzeichnet wird, liegt im Ermessen des bestätigungsrelevanten Systems.

Eine Ressource welche nicht durch das bestätigungsrelevante System angelegt wird, KANN in ```Resource.meta.tag``` eine Angabe enthalten, welche indiziert, dass diese Ressource durch ein Fremdsystem erzeugt wurde. Dieser Tag KANN durch den Server hinzugefügt werden, sollte der Client diese Angabe nicht mit übermitteln. Eine von einem System vorgenommene Auszeichnung von Fremdübernahmen SOLL über den Code ```external``` aus dem Kodiersystem ```https://fhir.de/CodeSystem/common-meta-tag-de``` erfolgen. Weitere Kodierungen KÖNNEN hinzugefügt werden.

```
json
{
    "resourceType": "Patient",
    "meta": {
        "tag": [
            {
                "system": "https://fhir.de/CodeSystem/common-meta-tag-de",
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

Ressourcen, die zu einem entsprechenden ISiK-Profil nicht konform sind, MÜSSEN durch das bestätigungsrelevante System abgelehnt werden. Als Antwort MUSS ein HTTP 400 Status Code mit einer ```OperationOutcome```-Ressource zurückgegeben werden. Diese enthält eine Auflistung aller Fehler in der übermittelten Ressource in kodierter Form.

## Update-Interaktionen
Das Update einer Ressource KANN per HTTP PUT (vgl. [FHIR RESTful API - update](https://www.hl7.org/fhir/http.html#update)) unterstützt werden. Es ist zu beachten, dass beim Update einer Ressource bestimmte dazugehörige [Metadaten](https://www.hl7.org/fhir/resource.html#Meta) beibehalten werden SOLLTEN.


## Sicherheitsaspekte
Alle REST-Interaktionen müssen sowohl mittels HTTP als auch HTTPS (TLS-Verschlüsselung) unterstützt werden. Vorgaben zur TLS-Verschlüsselung sind dem nachfolgenden Link für die FHIR Security Check List zu entnehmen.
Im Echtbetrieb MUSS die Kommunikation ausschließlich per HTTPS erfolgen.
Weiterhin sind geeignete Maßnahmen zur Risiko-Minimierung (z.B. Benutzerautorisierung / -authentifikation) zu treffen, siehe https://build.fhir.org/security.html#6.1.0. 
Diese sind in Stufe 1 des ISiK Basismoduls jedoch nicht bestätigungsrelevant.
