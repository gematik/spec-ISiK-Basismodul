Profile: SD_MII_ICU_Koerpertemperatur_Generisch
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-koerpertemperatur-generisch
Title: "SD MII ICU Koerpertemperatur Generisch"
* insert Meta
* insert CommonElements
* code
  * coding contains 
    specific-loinc 0..1 MS
  * coding[specific-loinc] from ISiKSpecificGenericTempLoincVS
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8310-5 //"Körpertemperatur"
* valueQuantity = $unitsofmeasure#Cel
  * unit 1..