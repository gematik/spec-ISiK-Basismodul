Instance: ISiKCapabilityStatementSubscriptionRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementSubscriptionRolle"
* name = "ISiKCapabilityStatementSubscriptionRolle"
* title = "CapabilityStatement für Rolle &quot;Subscription&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Subscription"
* purpose = "
CapabilityStatement für die Rolle &quot;ISiKCapabilityStatementSubscriptionRolle&quot;.
Diese Rolle beschreibt die Fähigkeiten eines Systems zur Registrierung, Verwaltung und Verarbeitung von FHIR Subscriptions auf Basis themenbasierter Benachrichtigungen nach dem R5-Modell unter Verwendung der Subscriptions-Backport-Mechanismen in FHIR R4.
"
* rest
  * mode = #server
  * resource[+]
    * type = #Subscription
    * insert Expectation (#SHALL)
    * supportedProfile = Canonical(ISiKSubscription)
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #create
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #update
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #delete
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "criteria"
      * definition = "http://hl7.org/fhir/SearchParameter/Subscription-criteria"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Subscription?criteria=https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge`    
        **Anwendungshinweis:**    
        Dient dazu eine Subscription zu finden, die auf ein bestimmtes SubscriptionTopic verweist.        
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string)."
    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Subscription-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Subscription?status=requested`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token)."
    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "url"
      * definition = "http://hl7.org/fhir/SearchParameter/Subscription-url"
      * type = #uri
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Subscription?url=http://example.org/fhir/`    
        **Anwendungshinweis:**    
        Dient dazu eine Subscription zu finden, die auf einen REST-Endpoint verweist welcher die Subscription Notifications empfangen soll.    
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#uri)."
    * operation[+]
      * insert Expectation (#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-status"
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Subscription/[id]/$status`    
        **Anwendungshinweis:**    
        Dient dazu den Status einer Subscription zu ermitteln.    
        Weitere Details siehe [Subscriptions R5 Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-status)."
    * operation[+]
      * insert Expectation (#SHALL)
      * name = "events"
      * definition = "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-events"
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Subscription/[id]/$events`    
        **Anwendungshinweis:**    
        Diese Operation wird verwendet, um nach SubscriptionNotifications zu suchen und diese zurückzugeben, die zuvor durch eine topic basierte Subscription in FHIR R4 ausgelöst wurden.   
        Weitere Details siehe [Subscriptions R5 Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-events)."
  * resource[+]
    * type = #Parameters
    * insert Expectation (#SHALL)
    * supportedProfile = Canonical(BackportSubscriptionStatusR4Fixed)
  * resource[+]
    * type = #Bundle
    * insert Expectation (#SHALL)
    * supportedProfile = Canonical(BackportSubscriptionNotificationR4Fixed)