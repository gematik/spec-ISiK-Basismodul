Profile: ISiKEKG
Parent: EkgDE
Id: ISiKEKG
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über kurze, relevante EKG-Ausschnitte eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK. Es wurde entwickelt, um spezifische klinische Fragestellungen zu unterstützen, bei denen prägnante und gezielte EKG-Daten im Vordergrund stehen. Für vollständige und längere EKG-Aufzeichnungen sind alternative Formate vorgesehen, die für umfangreiche Daten besser geeignet sind.

**Motivation**

Die Bereitstellung kurzer EKG-Ausschnitte ermöglicht eine präzise und effiziente Unterstützung bei der Diagnose akuter kardiologischer Fragestellungen, der Überwachung von Arrhythmien oder der Beurteilung bestimmter Ereignisse wie ST-Strecken-Veränderungen. Diese fokussierte Darstellung dient der Optimierung klinischer Entscheidungen und der schnellen Verarbeitung relevanter Daten.

In FHIR wird das EKG durch die Observation-Ressource repräsentiert, wobei spezifische Anforderungen für die Darstellung und Kodierung der Daten in diesem Profil berücksichtigt werden.

**Kompatibilität**

Das Profil ISiKEKG ist vom Profil [EkgDE](http://fhir.de/StructureDefinition/observation-de-ekg) aus den deutschen Basisprofilen abgeleitet."
* insert Meta
* insert CommonElements
* insert ISiKVitalsignCommons
// should not contain ISiKVitalsignCommonsValue since it is not used in this profile
* component MS
  * insert Component-MS
* component[ekgLeads] MS
  * ^comment = "Motivation MS: Die einzelnen Ableitungen des EKG werden als component abgebildet. **Begründung**: Bei einer EKG Untersuchung werden mehrere Ableitungen gemeinsam erfasst und bilden zusammen das Gesamtbild des EKGs. Siehe auch [Observation.component im FHIR R4 Standard](https://hl7.org/fhir/R4//observation.html#gr-comp)."
  * ^short = "EKG-Ableitungen"
* component[ekgLeads].valueSampledData MS
  * ^comment = "Motivation MS: Die EKG-Daten werden mittels des SampledData Datentyps abgebildet."
  * ^short = "SampledData"
* component[ekgLeads].valueSampledData.origin MS
  * ^comment = "Motivation MS: Das Feld `origin` definiert den Referenzpunkt und die Einheit der Messreihe, um sicherzustellen, dass die gemessenen Werte im richtigen Kontext interpretiert werden können."
  * ^short = "Ausgangswert"
* component[ekgLeads].valueSampledData.period MS
  * ^comment = "Motivation MS: Das Feld `period` definiert die zeitliche Distanz zwischen zwei aufeinanderfolgenden Messwerten."
  * ^short = "Messintervall"
* component[ekgLeads].valueSampledData.dimensions MS
  * ^comment = "Motivation MS: Das Feld `dimensions` gibt die Anzahl der Achsen oder Dimensionen an, die in der Messreihe enthalten sind, und ist notwendig, um die Struktur der Daten korrekt zu verstehen."
  * ^short = "Dimensionen"
* component[ekgLeads].valueSampledData.data MS
  * ^comment = "Motivation MS: Das Feld `data` enthält die eigentlichen Messwerte der EKG-Daten."
  * ^short = "Messwerte"

Instance: ISiKEKGExample
InstanceOf: ISiKEKG
Usage: #example
* code.coding[loinc] = $loinc#11524-6 "EKG study"
* code.coding[snomed] = $sct#106073009 "EKG wave, interval AND/OR segment"
* subject = Reference(PatientinMusterfrau)
* status = #final
* category = $observation-category#procedure
* device = Reference(ExampleDevice)
* effectiveDateTime = "2019-07-02"
* performer = Reference(PractitionerWalterArzt)
* component[+].code = $sct#272729005 "Lead I"
* component[=].valueSampledData.origin.value = 2048
* component[=].valueSampledData.period = 10
* component[=].valueSampledData.dimensions = 1
* component[=].valueSampledData.data = "2041 2043 2037 2047 2060 2062 2051 2023 2014 2027 2034 2033 2040 2047 2047 2053 2058 2064 2059 2063 2061 2052 2053 2038 1966 1885 1884 2009 2129 2166 2137 2102 2086 2077 2067 2067 2060 2059 2062 2062 2060 2057 2045 2047 2057 2054 2042 2029 2027 2018 2007 1995 2001 2012 2024 2039 2068 2092 2111 2125 2131 2148 2137 2138 2128 2128 2115 2099 2097 2096 2101 2101 2091 2073 2076 2077 2084 2081 2088 2092 2070 2069 2074 2077 2075 2068 2064 2060 2062 2074 2075 2074 2075 2063 2058 2058 2064 2064 2070 2074 2067 2060 2062 2063 2061 2059 2048 2052 2049 2048 2051 2059 2059 2066 2077 2073"
* component[+].code = $sct#272730000 "Lead II"
* component[=].valueSampledData.origin.value = 2048
* component[=].valueSampledData.period = 10
* component[=].valueSampledData.dimensions = 1
* component[=].valueSampledData.data = "2041 2043 2037 2047 2060 2062 2051 2023 2014 2027 2034 2033 2040 2047 2047 2053 2058 2064 2059 2063 2061 2052 2053 2038 1966 1885 1884 2009 2129 2166 2137 2102 2086 2077 2067 2067 2060 2059 2062 2062 2060 2057 2045 2047 2057 2054 2042 2029 2027 2018 2007 1995 2001 2012 2024 2039 2068 2092 2111 2125 2131 2148 2137 2138 2128 2128 2115 2099 2097 2096 2101 2101 2091 2073 2076 2077 2084 2081 2088 2092 2070 2069 2074 2077 2075 2068 2064 2060 2062 2074 2075 2074 2075 2063 2058 2058 2064 2064 2070 2074 2067 2060 2062 2063 2061 2059 2048 2052 2049 2048 2051 2059 2059 2066 2077 2073"
* component[+].code = $sct#272731001 "Lead III"
* component[=].valueSampledData.origin.value = 2048
* component[=].valueSampledData.period = 10
* component[=].valueSampledData.dimensions = 1
* component[=].valueSampledData.data = "2041 2043 2037 2047 2060 2062 2051 2023 2014 2027 2034 2033 2040 2047 2047 2053 2058 2064 2059 2063 2061 2052 2053 2038 1966 1885 1884 2009 2129 2166 2137 2102 2086 2077 2067 2067 2060 2059 2062 2062 2060 2057 2045 2047 2057 2054 2042 2029 2027 2018 2007 1995 2001 2012 2024 2039 2068 2092 2111 2125 2131 2148 2137 2138 2128 2128 2115 2099 2097 2096 2101 2101 2091 2073 2076 2077 2084 2081 2088 2092 2070 2069 2074 2077 2075 2068 2064 2060 2062 2074 2075 2074 2075 2063 2058 2058 2064 2064 2070 2074 2067 2060 2062 2063 2061 2059 2048 2052 2049 2048 2051 2059 2059 2066 2077 2073"

Instance: ISiKEKGMinExample
InstanceOf: ISiKEKG
Usage: #example
* code.coding[loinc] = $loinc#11524-6 "EKG study"
* subject = Reference(PatientinMinimal)
* status = #final
* category = $observation-category#procedure
* effectiveDateTime = "2024-01-15"
* component[+].code = $sct#272729005 "Lead I"
* component[=].valueSampledData.origin.value = 2048
* component[=].valueSampledData.period = 10
* component[=].valueSampledData.dimensions = 1
* component[=].valueSampledData.data = "2048 2048 2048 2048 2048"

Instance: ISiKEKGMaxExample
InstanceOf: ISiKEKG
Usage: #example
* code.coding[loinc] = $loinc#11524-6 "EKG study"
* code.coding[snomed] = $sct#106073009 "EKG wave, interval AND/OR segment"
* subject = Reference(PatientinNormal)
* status = #final
* category = $observation-category#procedure
* device = Reference(ExampleDevice)
* effectiveDateTime = "2024-01-15T12:00:00+01:00"
* performer = Reference(PractitionerWalterArzt)
* note.text = "12-Kanal-EKG mit kompletter Ableitung zur Diagnostik von Rhythmusstörungen"
* component[+].code = $sct#272729005 "Lead I"
* component[=].valueSampledData.origin.value = 2048
* component[=].valueSampledData.period = 5
* component[=].valueSampledData.dimensions = 1
* component[=].valueSampledData.data = "2041 2043 2037 2047 2060 2062 2051 2023 2014 2027 2034 2033 2040 2047 2047 2053 2058 2064 2059 2063 2061 2052 2053 2038 1966 1885 1884 2009 2129 2166 2137 2102 2086 2077 2067 2067 2060 2059 2062 2062 2060 2057 2045 2047 2057 2054 2042 2029 2027 2018 2007 1995 2001 2012 2024 2039 2068 2092 2111 2125 2131 2148 2137 2138 2128 2128 2115 2099 2097 2096 2101 2101 2091 2073 2076 2077 2084 2081 2088 2092 2070 2069 2074 2077 2075 2068 2064 2060 2062 2074 2075 2074 2075 2063 2058 2058 2064 2064 2070 2074 2067 2060 2062 2063 2061 2059 2048 2052 2049 2048 2051 2059 2059 2066 2077 2073 2080 2085 2090 2095 2100 2105 2110 2115 2120 2125 2130 2135 2140 2145 2150 2155 2160 2165 2170 2175 2180"
* component[+].code = $sct#272730000 "Lead II"
* component[=].valueSampledData.origin.value = 2048
* component[=].valueSampledData.period = 5
* component[=].valueSampledData.dimensions = 1
* component[=].valueSampledData.data = "2055 2058 2052 2062 2075 2077 2066 2038 2029 2042 2049 2048 2055 2062 2062 2068 2073 2079 2074 2078 2076 2067 2068 2053 1981 1900 1899 2024 2144 2181 2152 2117 2101 2092 2082 2082 2075 2074 2077 2077 2075 2072 2060 2062 2072 2069 2057 2044 2042 2033 2022 2010 2016 2027 2039 2054 2083 2107 2126 2140 2146 2163 2152 2153 2143 2143 2130 2114 2112 2111 2116 2116 2106 2088 2091 2092 2099 2096 2103 2107 2085 2084 2089 2092 2090 2083 2079 2075 2077 2089 2090 2089 2090 2078 2073 2073 2079 2079 2085 2089 2082 2075 2077 2078 2076 2074 2063 2067 2064 2063 2066 2074 2074 2081 2092 2088 2095 2100 2105 2110 2115 2120 2125 2130 2135 2140 2145 2150 2155 2160 2165 2170 2175 2180 2185 2190 2195 2200"
* component[+].code = $sct#272731001 "Lead III"
* component[=].valueSampledData.origin.value = 2048
* component[=].valueSampledData.period = 5
* component[=].valueSampledData.dimensions = 1
* component[=].valueSampledData.data = "2048 2050 2045 2055 2068 2070 2059 2031 2022 2035 2042 2041 2048 2055 2055 2061 2066 2072 2067 2071 2069 2060 2061 2046 1974 1893 1892 2017 2137 2174 2145 2110 2094 2085 2075 2075 2068 2067 2070 2070 2068 2065 2053 2055 2065 2062 2050 2037 2035 2026 2015 2003 2009 2020 2032 2047 2076 2100 2119 2133 2139 2156 2145 2146 2136 2136 2123 2107 2105 2104 2109 2109 2099 2081 2084 2085 2092 2089 2096 2100 2078 2077 2082 2085 2083 2076 2072 2068 2070 2082 2083 2082 2083 2071 2066 2066 2072 2072 2078 2082 2075 2068 2070 2071 2069 2067 2056 2060 2057 2056 2059 2067 2067 2074 2085 2081 2088 2093 2098 2103 2108 2113 2118 2123 2128 2133 2138 2143 2148 2153 2158 2163 2168 2173 2178 2183 2188 2193 2198"
* component[+].code = $sct#272732008 "Lead aVR"
* component[=].valueSampledData.origin.value = 2048
* component[=].valueSampledData.period = 5
* component[=].valueSampledData.dimensions = 1
* component[=].valueSampledData.data = "2020 2018 2024 2014 2001 1999 2010 2038 2047 2034 2027 2028 2021 2014 2014 2008 2003 1997 2002 1998 2000 2009 2008 2023 2095 2176 2177 2152 2023 1986 2016 2059 2075 2084 2094 2094 2101 2102 2099 2099 2101 2104 2116 2114 2104 2107 2119 2132 2134 2143 2154 2166 2160 2149 2137 2122 2093 2069 2050 2036 2030 2013 2024 2025 2033 2033 2046 2062 2064 2063 2058 2058 2068 2086 2083 2082 2075 2078 2071 2067 2089 2090 2085 2082 2084 2091 2095 2099 2097 2085 2084 2083 2084 2096 2101 2101 2095 2095 2089 2086 2100 2098 2095 2092 2094 2101 2099 2098 2091 2093 2094 2100 2108 2113 2118 2123 2128 2133 2138 2143 2148 2153 2158 2163 2168 2173 2178 2183 2188 2193 2198 2203 2208 2213"
* component[+].code = $sct#272733003 "Lead aVL"
* component[=].valueSampledData.origin.value = 2048
* component[=].valueSampledData.period = 5
* component[=].valueSampledData.dimensions = 1
* component[=].valueSampledData.data = "2048 2047 2044 2047 2054 2055 2051 2036 2031 2038 2041 2040 2044 2047 2047 2050 2053 2056 2054 2056 2055 2051 2051 2042 2009 1964 1964 1987 2070 2090 2076 2060 2053 2049 2044 2044 2041 2040 2042 2042 2041 2039 2033 2034 2039 2037 2031 2025 2024 2019 2013 2007 2010 2016 2022 2031 2046 2062 2073 2081 2085 2094 2087 2088 2083 2083 2076 2067 2066 2065 2068 2068 2062 2051 2053 2054 2058 2056 2060 2062 2049 2048 2051 2053 2052 2048 2046 2043 2044 2051 2051 2051 2051 2046 2043 2043 2046 2046 2049 2051 2047 2043 2044 2045 2044 2043 2038 2040 2038 2037 2039 2043 2043 2047 2053 2051 2058 2063 2068 2073 2078 2083 2088 2093 2098 2103 2108 2113 2118 2123 2128 2133 2138 2143 2148 2153 2158"
* component[+].code = $sct#272734009 "Lead aVF"
* component[=].valueSampledData.origin.value = 2048
* component[=].valueSampledData.period = 5
* component[=].valueSampledData.dimensions = 1
* component[=].valueSampledData.data = "2052 2054 2049 2059 2072 2074 2063 2035 2026 2039 2046 2045 2052 2059 2059 2065 2070 2076 2071 2075 2073 2064 2065 2050 1978 1897 1896 2021 2141 2178 2149 2114 2098 2089 2079 2079 2072 2071 2074 2074 2072 2069 2057 2059 2069 2066 2054 2041 2039 2030 2019 2007 2013 2024 2036 2051 2080 2104 2123 2137 2143 2160 2149 2150 2140 2140 2127 2111 2109 2108 2113 2113 2103 2085 2088 2089 2096 2093 2100 2104 2082 2081 2086 2089 2087 2080 2076 2072 2074 2086 2087 2086 2087 2075 2070 2070 2076 2076 2082 2086 2079 2072 2074 2075 2073 2071 2060 2064 2061 2060 2063 2071 2071 2078 2089 2085 2092 2097 2102 2107 2112 2117 2122 2127 2132 2137 2142 2147 2152 2157 2162 2167 2172 2177 2182 2187 2192 2197"