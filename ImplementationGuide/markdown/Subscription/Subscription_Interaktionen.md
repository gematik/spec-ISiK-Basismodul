### Interaktionen

Für die Ressource Subscription MUSS die REST-Interaktion "READ", "CREATE", "UPDATE", "DELETE" implementiert werden, insofern der festgelegte Lösungsansatz zu 'Patient merge Notification' implementiert wird.

## Operations

Bei der Umsetzung des Subscription Channel Type `websocket` MUSS die Operation [`$get-ws-binding-token`](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/OperationDefinition-backport-subscription-get-ws-binding-token.html) supported werden.

Siehe auch: {{pagelink:ImplementationGuide/markdown/CapabilityStatement.md, text:CapabilityStatement}} & {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/UebergreifendeFestlegungen_Patient-merge.md, text:Patient merge und Notification}}

---