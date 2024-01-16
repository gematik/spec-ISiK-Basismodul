Es wurden Bedarfe nach Abbildung sowohl der KH-Aufbauorganisation (FHIR Ressource Organization), als auch von Campi, Standorten etc. (FHIR Location) gemeldet.

Folgende Bedarfe, Anforderungen und Use Cases finden im Rahmen der Ausbaustufe 4 von ISIK zwecks Festlegung im Implmentierungsleitfaden und in Profilen Beachtung: 

1. Die (Raum- und Betten-)Belegung (interdisziplinär) sollte strukturiert erfolgen können.
1. Im Rahmen des Terminmanagements sollten Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation (Fachbereiche etc.) und an bestimmte Standorte möglich sein.
1. Im Rahmen der Versorgung sollte eine der folgenden Beispiel-Fragen beantworten werden können.:
Handelt es sich um ein Isolationszimmer?
Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte
etc.
1.  Informationen für eAU sollten auch in ISIK abgebildet werden – hier insbesondere BSNR (BetriebsstellenNummer)

Weitere (implizite) Anforderungen an die Festlegung zu Organisation und Standort in ISIK:

1. Profil ISIKOrganisation soll auch ein Krankenhaus als ganzes abbilden können.

Lösungswege- und Optionen

- Profile zu den FHIR Ressourcen Organization und Location sollen spezifiziert werden
- Auch ein Profil zur FHIR Ressource HealthCareService soll diskutiert werden
- Weitere Profile, die zu beachten sind:
   - E-Rezept ServiceRequest https://simplifier.net/erezept-servicerequest/erp-service-request-organization
   - VZD:
        - https://simplifier.net/vzd-fhir-directory/organizationdirectory
        - https://simplifier.net/vzd-fhir-directory/healthcareservicedirectory
        - https://simplifier.net/vzd-fhir-directory/locationdirectory

**Hintergrund**

Die oben genannten Punkte entsprechen den konsolidierten Punkten, wie sie [hier](https://github.com/gematik/spec-ISiK-Basismodul/discussions/326) in Folge der Arbeitsgruppen zum ISIK-Basismodul festgehalten und veröffentlicht wurden.