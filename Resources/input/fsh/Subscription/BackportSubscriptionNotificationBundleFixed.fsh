Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

Profile: BackportSubscriptionNotificationR4Fixed
Parent: Bundle
Id: BackportSubscriptionNotificationR4Fixed
Title: "R4 Topic-Based Subscription Notification Bundle"
Description: """Profil auf der FHIR-R4-Resource Bundle, um R5-ähnliche, themenbasierte Subscription-Benachrichtigungen in FHIR R4 zu ermöglichen.

Dieses Profil ist funktional identisch mit `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-notification-r4`.  
Die Version 1.1.0 des offiziellen Profils enthält jedoch technische Fehler. Daher wurde dieses Profil lokal als temporärer Workaround nachgebildet.
Es wird durch das offizielle `backport-subscription-notification-r4` Profil ersetzt, sobald eine korrigierte Version veröffentlicht wurde.
"""
* insert Meta
* insert CommonElements
* ^publisher = "HL7 International / FHIR Infrastructure"
* ^version = "1.1.0"
* ^date = "2023-01-11T15:35:36+11:00"
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
* obeys backport-notification-bundle-r4-1
* type = #history
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.description = "Slice based on resource"
* entry ^slicing.ordered = false
* entry ^slicing.rules = #open
* entry contains subscriptionStatus 1..1 MS
* entry[subscriptionStatus].resource 1.. MS
* entry[subscriptionStatus].resource only BackportSubscriptionStatusR4Fixed

Invariant: backport-notification-bundle-r4-1
Description: "A notification bundle MUST have a Parameters as the first entry"
* severity = #error
* expression = "(entry.first().resource.is(Parameters))"
