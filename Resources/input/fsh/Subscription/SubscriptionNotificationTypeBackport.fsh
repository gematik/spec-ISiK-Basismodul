ValueSet: SubscriptionNotificationTypeVS
Id: subscription-notification-type
Title: "SubscriptionNotificationType"
Description: "The type of notification represented by the status message."
* insert Meta
* ^meta.lastUpdated = "2022-05-28T13:47:40.239+11:00"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #fhir
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 0
* ^url = "http://hl7.org/fhir/ValueSet/subscription-notification-type"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.1523"
* ^version = "4.3.0"
* ^date = "2020-12-28T16:55:11+11:00"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://hl7.org/fhir"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "fhir@lists.hl7.org"
* ^immutable = true
* include codes from system SubscriptionNotificationTypeCS

CodeSystem: SubscriptionNotificationTypeCS
Id: subscription-notification-type
Title: "SubscriptionNotificationType"
Description: "The type of notification represented by the status message."
* insert Meta
* ^meta.lastUpdated = "2022-05-28T13:47:40.239+11:00"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #fhir
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 0
* ^url = "http://hl7.org/fhir/subscription-notification-type"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.1.1524"
* ^version = "4.3.0"
* ^experimental = false
* ^date = "2021-01-05T10:01:24+11:00"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://hl7.org/fhir"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "fhir@lists.hl7.org"
* ^caseSensitive = true
* ^valueSet = "http://hl7.org/fhir/ValueSet/subscription-notification-type"
* ^content = #complete
* #handshake "Handshake" "The status was generated as part of the setup or verification of a communications channel."
* #heartbeat "Heartbeat" "The status was generated to perform a heartbeat notification to the subscriber."
* #event-notification "Event Notification" "The status was generated for an event to the subscriber."
* #query-status "Query Status" "The status was generated in response to a status query/request."
* #query-event "Query Event" "The status was generated in response to an event query/request."