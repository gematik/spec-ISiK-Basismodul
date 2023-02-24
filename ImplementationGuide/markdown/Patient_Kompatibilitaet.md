### Kompatibilität

Dieses Profil basiert auf dem [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://simplifier.net/base1x0/kbvprbasepatient).

Instanzen, die gegen ISiKPatient valide sind, sind (mit wenigen Einschränkungen) auch valide gegen
* [Profil KBV_PR_Base_Patient der KBV Basisprofile - v1.1.3](https://simplifier.net/base1x0/kbvprbasepatient)
  * hier ist zu beachten, dass die KBV im Patienten-Profil für Address.country ein "extensible"-Binding auf die DEÜV-Codes festlegt; dies weicht von der ISiK Verwendung von ISO-Codes ab
* [Profil Patient im International Patient Summary (IPS) - STU-1](http://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative - v2.0.0](https://simplifier.net/medizininformatikinitiative-modulperson/patientin)
  * wenn in indentifier:pid.assigner eine Referenz auf eine Organisation angegeben wurde
  * wenn in identifier:versichertenId_GKV.assigner die IK-NR der Krankenversicherung angegeben ist
* [Profil Patient der KBV Archiv- und Wechselschnittstelle - v1.2.0](https://simplifier.net/pvs-archivierungs-undwechselschnittstelle/kbvprawpatient)
  * wenn die Ressource einen Narrative enthält und in den Metadaten die Canonical-URL des KBV-Profile angegeben wird

Instanzen, die gegen dieses Profil valide sind, sind **nicht** valide gegen

* [Profil Patient der formularübergreifenden Vorgaben der KBV - v1.1.3](https://simplifier.net/for/kbvprforpatient) (eRezept/eAU) <br/>
Um die Kompatibilität herzustellen sind folgende Schritte erforderlich:
  * es MUSS genau eine Adresse angegeben werden (Mehrfachangaben sind nicht erlaubt)
  * folgende Elemente MÜSSEN entfernt werden: 
    * active
    * identifier:pid
    * name:geburtsname
    * gender

* [Profil Patient Deutsches Elektronisches Melde- und Informationssystem für den Infektionsschutz (RKI) - v1.0.0](https://simplifier.net/demis/notifiedperson) <br/>
Aus Gründen der Datensparsamkeit bei der Übermittelung einer Meldung nach Infektionsschutzgesetz müssen bestimmte Datenelemente entfernt werden. Um die Kompatibilität herzustellen sind folgende Schritte erforderlich:
  * es MUSS der offizielle Name der Person angegeben werden (Angabe des Geburtsnamen nicht erlaubt)
  * es MUSS die Straßenanschrift der Person angegeben werden (Angabe einer Postfach-Adresse nicht erlaubt)
  * innerhalb der Straßenanschrift der Person MÜSSEN alle Zustell- oder Abholangabe in eine Adresszeile abgebildet werden