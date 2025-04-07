Invariant: mii-icu-1
Description: "If there is no Observation.value, a dataAbsentReason must be given."
* severity = #error
* expression = "value.exists().not() implies dataAbsentReason.exists()"
* source = Canonical(SD_MII_ICU_Monitoring_Und_Vitaldaten)