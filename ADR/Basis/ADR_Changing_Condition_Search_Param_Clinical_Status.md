# ADR: Abschwächung des Suchparameters `clinical-status` und Überprüfung der MS-Einschränkungen für `clinicalStatus` und `verificationStatus` im Profil ISiKDiagnose

Datum: 2026-04-27  

Status: Vorgeschlagen  

Ticket: PTDATA-2043

## Kontext

Im Profil ISiKDiagnose (Condition) ist das Element `clinicalStatus` als Must-Support gekennzeichnet, jedoch mit einer **Einschränkung der übergreifenden MS-Definition**: Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung des Status einer Diagnose, so MUSS dieses System die Information NICHT abbilden. Gleichzeitig ist im CapabilityStatement der klinischen Rolle der Suchparameter `clinical-status` mit der Expectation `SHALL` (verpflichtend) deklariert.

Dieses Zusammenspiel führt zu einem Widerspruch: Der Suchparameter ist verpflichtend, die Befüllung des Feldes jedoch optional. Systeme, die `clinicalStatus` nicht befüllen, können eine Suche danach nicht sinnvoll unterstützen. Rückmeldungen von KIS-Herstellern bestätigen, dass eine Befüllung von `Condition.clinicalStatus` in der stationären Versorgung vielfach nicht unterstützt wird.

Darüber hinaus wurde im Rahmen der Diskussion auch das Element `verificationStatus` betrachtet. Dieses ist ebenfalls mit einer einschränkenden MS-Definition versehen (Server-seitige Implementierung optional, Client-seitige Auswertung SOLL). Auch hier besteht die Frage, ob die Einschränkung beibehalten werden soll.

## Optionen

### Option 1: Status quo beibehalten
Der Suchparameter `clinical-status` bleibt `SHALL`. Die MS-Einschränkungen bleiben bestehen.  
**Verworfen**, da dies den beschriebenen Widerspruch nicht auflöst und Hersteller, die `clinicalStatus` nicht führen, den verpflichtenden Suchparameter nicht sinnvoll bedienen können.

### Option 2: Suchparameter sofort entfernen
Den Suchparameter `clinical-status` vollständig aus dem CapabilityStatement entfernen.  
**Verworfen**, da der EHDS perspektivisch `clinicalStatus` fordert und ein vollständiges Entfernen die Rückwärtskompatibilität zu Systemen, die den Parameter bereits unterstützen, unnötig einschränkt.

### Option 3 (gewählt): Stufenweise Abschwächung
- **Stufe 5 und 6:** Der Suchparameter `clinical-status` wird von `SHALL` auf `MAY` abgeschwächt. Die eingeschränkte MS-Definition für `clinicalStatus` bleibt bestehen.
- **Stufe 7:** Erneute Bewertung unter Berücksichtigung der EHDS-Anforderungen an `clinicalStatus`. Ggf. Wiederanhebung auf `SHALL` und Anpassung der MS-Definition.

## Entscheidung

1. Der Suchparameter `clinical-status` im CapabilityStatement der klinischen Rolle wird für Stufe 5 und Stufe 6 von `SHALL` auf `MAY` abgeschwächt.
2. Die einschränkende MS-Definition für `clinicalStatus` bleibt vorerst bestehen.
3. In Stufe 7 erfolgt eine erneute Bewertung unter Berücksichtigung der dann vorliegenden EHDS-Vorgaben, die `clinicalStatus` als verpflichtendes Element vorsehen.
4. Für `verificationStatus` wird die Tendenz festgehalten, die bestehende Einschränkung der MS-Definition zu entfernen, sodass das Element regulär als Must-Support ohne Einschränkung gilt. Eine finale Entscheidung hierzu steht noch aus.

## Konsequenzen

**Positiv:**
- Auflösung des Widerspruchs zwischen verpflichtendem Suchparameter und optionaler Befüllung
- Reduktion der Implementierungslast für Systeme, die `clinicalStatus` nicht nativ führen
- Beibehaltung der Möglichkeit für Systeme, die den Suchparameter bereits unterstützen, diesen weiterhin anzubieten

**Negativ:**
- Clients können sich in Stufe 5/6 nicht auf die Verfügbarkeit des Suchparameters verlassen
- Ggf. erneuter Breaking Change in Stufe 7, wenn der Parameter aufgrund von EHDS-Anforderungen wieder verpflichtend wird

**Bezüglich `verificationStatus`:**
- Bei Entfernung der MS-Einschränkung müssten alle Server das Element befüllen können, was die Datenqualität erhöht
- Risiko: Systeme, die bisher keine interne Abbildung des Bestätigungsstatus haben, müssten nachrüsten

## Anhänge (optional)

- ISiKDiagnose-Profil: `Resources/input/fsh/Basis/ISiKDiagnose.fsh`
- CapabilityStatement klinische Rolle: `Resources/input/fsh/Basis/Rollen/ISiKCapabilityStatementKlinischeRolle.fsh` (Zeile 119–120: `clinical-status` mit `#SHALL`)
- EHDS-Referenz: HL7 Europe Patient Summary (EPS) fordert `clinicalStatus` als verpflichtendes Element