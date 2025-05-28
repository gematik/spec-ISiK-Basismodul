---
topic: ISiKCapabilityStatementSubscriptionRolle
canonical: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementSubscriptionRolle
---

##  <fql output="inline" headers="false">
from
    CapabilityStatement
where
    url = %canonical
select
    Artefakt:title
</fql> - Konformitätserklärung [(CapabilityStatement)](https://hl7.org/fhir/R4/capabilitystatement.html)

<fql>
from
	CapabilityStatement
where
	url = %canonical
select
	Beschreibung:description
</fql>

<fql>
from
	CapabilityStatement
where
	url = %canonical
select
	Zweck:purpose
</fql>

<fql output="transpose" headers="true">
from
	CapabilityStatement
where
	url = %canonical
select
	CanonicalURL: url, Intention: kind, Status: status, Version: version
</fql>

