Es wurden Bedarfe nach Abbildung sowohl der KH-Aufbauorganisation (FHIR Ressource Organization), als auch von Campi, Standorten etc. (FHIR Location) gemeldet.

**Use Cases und Bedarfe**

Folgende Bedarfe, Anforderungen und Use Cases finden im Rahmen der Ausbaustufe 4 von ISIK zwecks Festlegung im Implementierungsleitfaden und in Profilen Beachtung: 

1. Die (Raum- und Betten-)Belegung (interdisziplinär) sollte strukturiert erfolgen können.
1. Im Rahmen des Terminmanagements sollten Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation (Fachbereiche etc.) und an bestimmte Standorte möglich sein.
1. Im Rahmen der Versorgung sollte eine der folgenden Beispiel-Fragen beantworten werden können.:
    - Handelt es sich um ein Isolationszimmer?
    - Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte
    - etc.
1.  Informationen für eAU sollten auch in ISIK abgebildet werden – hier insbesondere BSNR (Betriebsstättennummer)

**Weitere (implizite) Anforderungen an die Festlegung zu Organisation und Standort in ISIK**

1. Profil ISIKOrganisation soll auch ein Krankenhaus als ganzes abbilden können.
1. Profil ISIKOrganisation sollte sich möglichst an das entsprechende Profil der KBV orientieren.
        - siehe insbesondere .identifier


**Fragen - offen**
1. Soll das Profil Organisation auch explizit die Standortnummer führen (oder eher für Profil Location?)? Siehe https://www.dkgev.de/themen/digitalisierung-daten/informationstechnik-im-krankenhaus/verzeichnisse-und-register/standortverzeichnis/; Hintergrund: https://reimbursement.institute/glossar/standortnummer/
1. Prüfung der MS-Flags und Interaktionen

**Fragen - beantowrtet**
1. Soll das Profil auch explizit KIM und TIM Adressen als identifier führen? Siehe Analog: https://github.com/gematik/spec-E-Rezept-ServiceRequest/blob/master/Resources/input/fsh/profiles/8_Organization.fsh -> ja s.u.



**Lösungswege- und Optionen** 

- Profile zu den FHIR Ressourcen Organization und Location sollen spezifiziert werden
- Auch ein Profil zur FHIR Ressource HealthCareService soll diskutiert werden
- Weitere Profile, die zu beachten sind hinsichtlich der Kompatibilität:
   - Medizin Informatik Initiative https://simplifier.net/MedizininformatikInitiative-ModulStrukturdaten/~introduction, bzw siehe hier unter Strukturdaten https://art-decor.org/art-decor/decor-datasets--mide-
        - hier werden Profile zu Organisation und Standort (Location) vorgelegt
        - differenziert wird zwischen Abteilungen als Organisationen und Abteilungsidentifikatoren, letztere erfordern dezidierten .identifier und der Organisationstyp ist (mittels Slice) fest codiert mit "dept",  zur Codierung des Typs der Abteilungen wird folgendes ValueSet genutzt: http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel-erweitert
        -Organisation als ganzes Krankenhaus nutzt IKNR
   - E-Rezept ServiceRequest https://simplifier.net/erezept-servicerequest/erp-service-request-organization
        - hier werden für identifier KINAdresse und TIMAdresse vorgesehen
            - dies soll auch IN ISIK übernommen werden. Ein USe Case zur Motivation lautet folgendermaßen: Bei einem Transfer zwischen den Fachkliniken Gynäkologie und Dermatologie fragt eine Mitarbeiterin aus der Gynakologie einen Mitarbeiter aus der Dermatologie zu nicht erfassten Infomrationen eines  Patienten an, der gerade verlegt wurde. Die Mitarbeitern kann dabei direkt TIM, weil die entsprechende Adresse im Profil-Identifier zur Organisationseinheit vorgehalten ist.
   - VZD:
        - https://simplifier.net/vzd-fhir-directory/organizationdirectory
                - hier wird ein Organization.type gefordert (1..), das verwendete Value Set ist jedoch nicht nutzbar im Krankenhaus-Kontext und damit Abweichung notwendig
                -Organization.identifier betreffend gilt:
                        - auf die Angabe einer Abrechnungsnummer der Kassenzahnärztlichen Bundesvereinigung wird in ISIK verzichtet, da Zahnarztpraxen keine (Teil-)Organisationen eines Krankenhauses sind und damit nicht im Umfang des Moduls enthalten sein sollen
                        - auf die Angabe einer Vertragskassennummer (VKNR) wird in ISIK verzichtet, da Krankenkassen nicht (Teil-)Organisationen eines Krankenhauses sind und damit nicht im Umfang des Moduls enthalten sein sollen
        - https://simplifier.net/vzd-fhir-directory/healthcareservicedirectory
        - https://simplifier.net/vzd-fhir-directory/locationdirectory

**Hintergrund**

Die oben genannten Punkte entsprechen den konsolidierten Punkten, wie sie [hier](https://github.com/gematik/spec-ISiK-Basismodul/discussions/326) in Folge der Arbeitsgruppen zum ISIK-Basismodul festgehalten und veröffentlicht wurden.
