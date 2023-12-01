### Kompatibilität

Dieses Profil basierte ursprünglich auf dem [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://simplifier.net/base1x0/kbv_pr_base_patient) in der Version 1.2.1.

Für das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt - allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:
* [Profil KBV_PR_Base_Patient der KBV Basisprofile - v1.2.1](https://simplifier.net/packages/kbv.basis/1.2.1)
  * hier ist zu beachten, dass die KBV im Patienten-Profil für Address.country ein "extensible"-Binding auf die DEÜV-Codes festlegt; dies weicht von der ISiK Verwendung von ISO-Codes ab
* [Profil Patient im International Patient Summary (IPS) - STU-1](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative - v2024.0.0](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
  * hier ist zu beachten, dass in identifier:Patientennummer (ISK.Basis) von identifier:pid (MII) abweicht
  * hier ist zu beachten, dass in identifier:pid.assigner (MII) eine Referenz auf eine Organisation angegeben wurde
  * hier ist zu beachten, dass in identifier:versichertenId_GKV.assigner.identifier die IK-NR der Krankenversicherung angegeben ist
  * weitere Abweichungen können aufgrund der laufenden Entwicklung nicht ausgeschlossen werden
* [Profil Patient der KBV Archiv- und Wechselschnittstelle - v1.2.0](https://simplifier.net/pvs-archivierungs-undwechselschnittstelle/kbv_pr_aw_patient)
  * hier ist zu beachten, dass die Instanz einen Narrative enthält und in den Metadaten die Canonical-URL des KBV-Profile angegeben wird

Instanzen, die gegen dieses Profil valide sind, sind **nicht** valide gegen:

* [Profil Patient der formularübergreifenden Vorgaben der KBV - v1.0.3](https://simplifier.net/for/kbvprforpatient) (eRezept/eAU) <br/>
Um die Kompatibilität herzustellen sind folgende Schritte erforderlich:
  * es MUSS genau eine Adresse angegeben werden (Mehrfachangaben sind nicht erlaubt)
  * folgende Elemente MÜSSEN entfernt werden: 
    * active
    * identifier:pid
    * name:geburtsname
    * gender
  * weitere Abweichungen können  nicht ausgeschlossen werden
* [Profil Patient Deutsches Elektronisches Melde- und Informationssystem für den Infektionsschutz (RKI) - v1.1.1](https://simplifier.net/demis/notifiedperson) <br/>
Aus Gründen der Datensparsamkeit bei der Übermittlung einer Meldung nach Infektionsschutzgesetz müssen bestimmte Datenelemente entfernt werden. Um die Kompatibilität herzustellen sind folgende Schritte erforderlich:
  * es MUSS der offizielle Name der Person angegeben werden (Angabe des Geburtsnamen nicht erlaubt)
  * es MUSS die Straßenanschrift der Person angegeben werden (Angabe einer Postfachadresse nicht erlaubt)
  * innerhalb der Straßenanschrift der Person MÜSSEN alle Zustell- oder Abholangaben in eine Adresszeile abgebildet werden
  * weitere Abweichungen können nicht ausgeschlossen werden