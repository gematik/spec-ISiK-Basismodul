Invariant: mii-icu-1
Description: "If there is no Observation.value, a dataAbsentReason must be given."
* severity = #error
* expression = "value.exists().not() implies dataAbsentReason.exists()"
* source = Canonical(SD_MII_ICU_Monitoring_Und_Vitaldaten)

Invariant: obs-value-or-dataAbsentReason
Description: "Observation must have either value or dataAbsentReason."
* severity = #error
* expression = "value.exists() xor dataAbsentReason.exists()"

Invariant: obs-10
Description: "Either subject XOR encounter exists"
* severity = #error
* expression = "$this.encounter.exists() xor $this.subject.exists()"

Invariant: vs-de-2
Description: "If there is no component or hasMember element then either a value[x] or a data absent reason must be present"
* severity = #error
* expression = "(component.empty() and hasMember.empty()) implies (dataAbsentReason.exists() or value.exists())"