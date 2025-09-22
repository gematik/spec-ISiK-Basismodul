Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

Profile: BackportSubscriptionStatusR4Fixed
Parent: Parameters
Id: BackportSubscriptionStatusR4Fixed
Title: "R4 Backported R5 SubscriptionStatus"
Description: """Profil auf der FHIR-R4-Resource Parameters zur Unterstützung themenbasierter Subscription-Benachrichtigungen in R4.

Dieses Profil ist funktional identisch mit `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-status-r4`.  
Die Version 1.1.0 des offiziellen Profils weist jedoch technische Fehler auf. Daher wurde es hier als Workaround erneut implementiert.
Diese lokale Definition wird durch das offizielle `backport-subscription-status-r4` Profil ersetzt, sobald eine korrigierte Version veröffentlicht wurde.
"""
* insert Meta
* insert CommonElements
* ^version = "1.1.0"
* ^date = "2023-01-11T15:34:32+11:00"
* ^contact[0].name = "HL7 FHIR Infrastructure WG"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "https://hl7.org/Special/committees/fiwg"
* ^contact[+].name = "Gino Canessa"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "mailto:gino.canessa@microsoft.com"
* ^contact[+].name = "Eric Haas"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "mailto:ehaas@healthedatainc.com"
* ^jurisdiction = $m49.htm#001 "World"
* . ^short = "Parameter containing subscription status information"
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.description = "Slice on parameter name"
* parameter ^slicing.ordered = false
* parameter ^slicing.rules = #open
* parameter ^short = "Slices containing subscription status information"
* parameter contains
    subscription 1..1 MS and
    topic 0..1 MS and
    status 1..1 MS and
    type 1..1 MS and
    eventsSinceSubscriptionStart 0..1 MS and
    notificationEvent 0..* MS and
    error 0..* MS
* parameter[subscription] ^short = "Parameter containing the reference to a subscription"
* parameter[subscription].name = "subscription" (exactly)
* parameter[subscription].name ^short = "Slice discriminator: the reference to a subscription"
* parameter[subscription].value[x] 1.. MS
* parameter[subscription].value[x] only Reference(Subscription)
* parameter[subscription].value[x] ^short = "Reference to the Subscription responsible for this notification"
* parameter[subscription].value[x] ^definition = "The reference to the Subscription which generated this notification."
* parameter[topic] ^short = "Parameter containing the canonical reference to a subscription topic"
* parameter[topic].name = "topic" (exactly)
* parameter[topic].name ^short = "Slice discriminator: the canonical reference to a subscription topic"
* parameter[topic].value[x] only canonical
* parameter[topic].value[x] MS
* parameter[topic].value[x] ^short = "Canonical reference to the SubscriptionTopic this notification relates to"
* parameter[topic].value[x] ^definition = "Canonical reference to the SubscriptionTopic for the Subscription which generated this notification."
* parameter[topic].value[x] ^comment = "This value SHOULD NOT be present when using `empty` payloads, MAY be present when using id-only payloads, and SHOULD be present when using `full-resource` payloads."
* parameter[status] ^short = "Parameter containing the subscription status"
* parameter[status].name = "status" (exactly)
* parameter[status].name ^short = "Slice discriminator: the subscription status"
* parameter[status].value[x] 1.. MS
* parameter[status].value[x] only code
* parameter[status].value[x] from SubscriptionStatus (required)
* parameter[status].value[x] ^short = "Status of the subscription when this notification was generated"
* parameter[status].value[x] ^definition = "The status of the subscription, which marks the server state for managing the subscription."
* parameter[type] ^short = "Parameter containing the type of event for this notification"
* parameter[type].name = "type" (exactly)
* parameter[type].name ^short = "Slice discriminator: the type of event for this notification"
* parameter[type].value[x] 1.. MS
* parameter[type].value[x] only code
* parameter[type].value[x] from SubscriptionNotificationTypeVS (required)
* parameter[type].value[x] ^short = "The type of event being conveyed with this notificaiton."
* parameter[eventsSinceSubscriptionStart] ^short = "Parameter containing the number of events since this subscription started"
* parameter[eventsSinceSubscriptionStart].name = "events-since-subscription-start" (exactly)
* parameter[eventsSinceSubscriptionStart].name ^short = "Slice discriminator: the number of events since this subscription started"
* parameter[eventsSinceSubscriptionStart].value[x] only string
* parameter[eventsSinceSubscriptionStart].value[x] MS
* parameter[eventsSinceSubscriptionStart].value[x] ^short = "Events since the Subscription was created"
* parameter[eventsSinceSubscriptionStart].value[x] ^definition = "The total number of actual events which have been generated since the Subscription was created (inclusive of this notification) - regardless of how many have been successfully communicated. This number is NOT incremented for handshake and heartbeat notifications."
* parameter[notificationEvent] ^short = "Parameter containing the event notification details"
* parameter[notificationEvent].name = "notification-event" (exactly)
* parameter[notificationEvent].name ^short = "Parameter containing notification event details"
* parameter[notificationEvent].part MS
* parameter[notificationEvent].part ^slicing.discriminator.type = #value
* parameter[notificationEvent].part ^slicing.discriminator.path = "name"
* parameter[notificationEvent].part ^slicing.description = "Slice on notification event parameter name"
* parameter[notificationEvent].part ^slicing.ordered = false
* parameter[notificationEvent].part ^slicing.rules = #open
* parameter[notificationEvent].part contains
    eventNumber 1..1 MS and
    eventTimestamp 0..1 MS and
    eventFocus 0..1 MS and
    eventAdditionalContext 0..* MS
* parameter[notificationEvent].part[eventNumber] ^short = "Parameter containing the event number"
* parameter[notificationEvent].part[eventNumber].name = "event-number" (exactly)
* parameter[notificationEvent].part[eventNumber].name ^short = "Slice discriminator: the event number"
* parameter[notificationEvent].part[eventNumber].value[x] 1.. MS
* parameter[notificationEvent].part[eventNumber].value[x] only string
* parameter[notificationEvent].part[eventNumber].value[x] ^short = "Event number"
* parameter[notificationEvent].part[eventNumber].value[x] ^definition = "The sequential number of this event in this subscription context."
* parameter[notificationEvent].part[eventTimestamp] ^short = "Parameter containing the event timestamp"
* parameter[notificationEvent].part[eventTimestamp].name = "timestamp" (exactly)
* parameter[notificationEvent].part[eventTimestamp].name ^short = "Slice discriminator: the event timestamp"
* parameter[notificationEvent].part[eventTimestamp].value[x] only instant
* parameter[notificationEvent].part[eventTimestamp].value[x] MS
* parameter[notificationEvent].part[eventTimestamp].value[x] ^short = "The instant this event occurred"
* parameter[notificationEvent].part[eventTimestamp].value[x] ^definition = "The actual time this event occured on the server."
* parameter[notificationEvent].part[eventFocus] ^short = "Parameter containing the event focus"
* parameter[notificationEvent].part[eventFocus].name = "focus" (exactly)
* parameter[notificationEvent].part[eventFocus].name ^short = "Slice discriminator: the event focus"
* parameter[notificationEvent].part[eventFocus].value[x] only Reference
* parameter[notificationEvent].part[eventFocus].value[x] MS
* parameter[notificationEvent].part[eventFocus].value[x] ^short = "The focus of this event"
* parameter[notificationEvent].part[eventFocus].value[x] ^definition = "The focus of this event. While this will usually be a reference to the focus resource of the event, it MAY contain a reference to a non-FHIR object."
* parameter[notificationEvent].part[eventAdditionalContext] ^short = "Parameter containing additional context for this event"
* parameter[notificationEvent].part[eventAdditionalContext].name = "additional-context" (exactly)
* parameter[notificationEvent].part[eventAdditionalContext].name ^short = "Slice discriminator: additional context for this event"
* parameter[notificationEvent].part[eventAdditionalContext].value[x] only Reference
* parameter[notificationEvent].part[eventAdditionalContext].value[x] MS
* parameter[notificationEvent].part[eventAdditionalContext].value[x] ^short = "Additional context for this event"
* parameter[notificationEvent].part[eventAdditionalContext].value[x] ^definition = "Additional context information for this event. Generally, this will contain references to additional resources included with the event (e.g., the Patient relevant to an Encounter), however it MAY refer to non-FHIR objects."
* parameter[error] ^short = "Parameter containing errors on the subscription"
* parameter[error].name = "error" (exactly)
* parameter[error].name ^short = "Slice discriminator: errors on the subscription"
* parameter[error].value[x] only CodeableConcept
* parameter[error].value[x] MS
* parameter[error].value[x] ^short = "An error on the subscription"
* parameter[error].value[x] ^definition = "A record of errors that occurred when the server processed a notification."