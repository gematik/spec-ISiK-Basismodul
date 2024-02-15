Es wurden Bedarfe nach Abbildung sowohl der KH-Aufbauorganisation (FHIR Ressource Organization), als auch von Campi, Standorten etc. (FHIR Location) gemeldet.

**Use Cases und Bedarfe**
Folgende Bedarfe, Anforderungen und Use Cases finden im Rahmen der Ausbaustufe 4 von ISIK zwecks Festlegung im Implementierungsleitfaden und in Profilen Beachtung: 3

1. Die (Raum- und Betten-)Belegung (interdisziplinär) sollte strukturiert erfolgen können.
        - Frage - grundsätzlich: Wir gehen davon aus, dass die Raum- und Bettenbelegung Bestandteil der Funktionalität eines KIS ist. Was wären Use-Cases um diese Information über eine Schnittstelle zu kommunizieren?
1. Im Rahmen des Terminmanagements sollten Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation (Fachbereiche etc.) und an bestimmte Standorte möglich sein.
        - Fragen: Welche Granularität an Standorten ist hier sinnvoll? Reichen z.B. als Standort-Typen: Klinik, Station, Raum?
1. Im Rahmen der Versorgung sollte eine der folgenden Beispiel-Fragen beantworten werden können:
    - Handelt es sich um ein Isolationszimmer?
        -Frage: Abzubilden in Location, aber welches ELement?
    - Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte
    - etc.
1.  Informationen für eAU sollten auch in ISIK abgebildet werden – hier insbesondere BSNR (Betriebsstättennummer)

**Weitere (implizite) Anforderungen an die Festlegung zu Organisation und Standort in ISIK**
1. Ein Profil zur Organisation soll eine Fachabteilung abbilden können.
1. Profil IOrganisation sollte sich möglichst an das entsprechende Profil der KBV orientieren.
        - siehe insbesondere .identifier

Als Standorte für ISiK werden momentan in Betracht gezogen (WIP):
- Station
- Raum
- Bett

Zu bedenken:
- Gebäude (z.B. verschiedene Gebäude im Pavillonsystem; ggf. auch Krankensäle im Kammsystem)
    - ggf. abzugrenzen von Klinik?
- Campus (vgl. Charité mit Campus 1) Mitte , 2) Virchow und 3) Benjamin Franklin)

**Weitere Fragen - offen**
1. Soll ein Profil zur Organisation auch ein Krankenhaus als ganzes abbilden können?
        - Gegenargument:  Der Vorteil in der Abbildung einer Organization-Ressource darin, dass man die Hierarchie von Abteilungen, Kliniken, etc. abbilden kann (per Organization.partOf). Falls es nur darum geht die Zuständigkeit zu anmontieren, könnte dies auch "inline" per Display-Value (Name der Organization) und Identifier (z.B. IKNR der Organization) erfolgen.
1. Soll das Profil Organisation auch explizit die Standortnummer führen (oder eher für Profil Location?)? Siehe https://www.dkgev.de/themen/digitalisierung-daten/informationstechnik-im-krankenhaus/verzeichnisse-und-register/standortverzeichnis/; Hintergrund: https://reimbursement.institute/glossar/standortnummer/
1. Prüfung der MS-Flags und Interaktionen

**Fragen - beantwortet**
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
            - dies soll auch IN ISIK übernommen werden. Ein USe Case zur Motivation lautet folgendermaßen: Bei einem Transfer zwischen den Fachkliniken Gynäkologie und Dermatologie fragt eine Mitarbeiterin aus der Gynäkologie einen Mitarbeiter aus der Dermatologie zu nicht erfassten Informationen eines  Patienten an, der gerade verlegt wurde. Die Mitarbeitern kann dabei direkt TIM, weil die entsprechende Adresse im Profil-Identifier zur Organisationseinheit vorgehalten ist.
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
