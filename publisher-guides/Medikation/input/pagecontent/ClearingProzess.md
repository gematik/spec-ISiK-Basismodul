> **Entwurf (PTDATA-2397):** Diese Seite ist ein Diskussionsstand. Offen sind insbesondere die Zwischenstatus für `MedicationStatement`, `MedicationAdministration` und `List`, die Statuswerte bei Ablehnung sowie die Verbindlichkeit der Festlegungen für sendende Systeme. Dieser Hinweis ist vor der Veröffentlichung zu entfernen.

### Hintergrund

Die Rollen dieses Moduls sehen vor, dass Ressourcen per Create-Interaktion an ein empfangendes System übermittelt werden können (vgl. [REST-API](RestApi.html)). Krankenhäuser haben zurückgemeldet, dass sie diese Interaktionen für ihre Prozesse benötigen. Die Create-Interaktionen bleiben daher Bestandteil der Spezifikation.

Medikationsdaten sind unmittelbar relevant für die Therapie und die Patientensicherheit. Das empfangende System verantwortet seinen Datenbestand und muss deshalb die Möglichkeit haben, von außen übermittelte Daten vor der Übernahme durch eine berechtigte Person prüfen zu lassen. Diesen Ablauf beschreibt der folgende Clearing-Prozess.

### Grundsatz

Ein empfangendes System ist nicht verpflichtet, per Create übermittelte Ressourcen ungeprüft in seinen freigegebenen Datenbestand zu übernehmen. Es KANN der Übernahme eine manuelle Prüfung (Clearing) vorschalten.

Setzt ein empfangendes System kein Clearing ein, übernimmt es die Ressource wie in der [REST-API](RestApi.html) beschrieben unmittelbar.

### Geltungsbereich

Der Clearing-Prozess gilt für alle Create-Interaktionen dieses Moduls. Dabei ist unerheblich, ob die Ressource einzeln per HTTP POST oder als Eintrag eines Transaktions-Bundles übermittelt wird.

| Rolle | Ressourcentyp |
|---|---|
| [ISiKCapabilityStatementMedikamentWRITERolle](CapabilityStatement-ISiKCapabilityStatementMedikamentWRITERolle.html) | Medication |
| [ISiKCapabilityStatementMedikationVerordnungWRITERolle](CapabilityStatement-ISiKCapabilityStatementMedikationVerordnungWRITERolle.html) | MedicationRequest |
| [ISiKCapabilityStatementMedikationVerabreichungWRITERolle](CapabilityStatement-ISiKCapabilityStatementMedikationVerabreichungWRITERolle.html) | MedicationAdministration |
| [ISiKCapabilityStatementMedikationInformationWRITERolle](CapabilityStatement-ISiKCapabilityStatementMedikationInformationWRITERolle.html) | MedicationStatement, List |
| [ISiKCapabilityStatementAMTSWRITERolle](CapabilityStatement-ISiKCapabilityStatementAMTSWRITERolle.html) | RiskAssessment, AllergyIntolerance, Observation |

### Beteiligte

* **Sendendes System:** Das System, das die Create-Interaktion auslöst (Client).
* **Empfangendes System:** Das System, das eine der oben genannten Rollen implementiert und die Ressource entgegennimmt (Server).
* **Prüfende Person:** Eine im empfangenden System berechtigte Person, die über die Übernahme entscheidet, z. B. ärztliches oder pharmazeutisches Personal. Wer prüfen darf, legt die betreibende Einrichtung fest.

### Ablauf

1. **Übermittlung:** Das sendende System übermittelt die Ressource per Create-Interaktion.
2. **Technische Prüfung:** Das empfangende System prüft die Ressource wie bei jeder Create-Interaktion technisch (z. B. Profilkonformität, auflösbare Referenzen). Schlägt diese Prüfung fehl, lehnt es die Interaktion mit einem HTTP-Fehlerstatus und einer `OperationOutcome` ab. Ein Clearing findet in diesem Fall nicht statt.
3. **Anlage im Zwischenstatus:** Das empfangende System legt die Ressource an und kennzeichnet sie mit einem Zwischenstatus (siehe [Zwischenstatus je Ressourcentyp](#zwischenstatus-je-ressourcentyp)). Es beantwortet die Interaktion mit `201 Created`. Eine Ressource im Zwischenstatus ist noch nicht Teil des freigegebenen Datenbestands. Sie DARF NICHT als Grundlage für Folgeprozesse dienen, z. B. für die Ausführung einer Verordnung.
4. **Manuelle Prüfung:** Die prüfende Person sichtet die Ressource im empfangenden System.
5. **Entscheidung:**
   * **Freigabe:** Das empfangende System setzt den Status der Ressource auf den regulären Zielstatus. Die Ressource ist damit Teil des freigegebenen Datenbestands.
   * **Ablehnung:** Das empfangende System setzt den Status der Ressource auf den Ablehnungsstatus. Die Ressource bleibt abrufbar, damit das sendende System das Ergebnis der Prüfung nachvollziehen kann.

Ändert die prüfende Person Inhalte der Ressource, gelten dafür dieselben Regeln wie für jede andere Änderung im empfangenden System.

### Zwischenstatus je Ressourcentyp

Der Zwischenstatus wird über die im FHIR-Standard vorgesehenen Statuselemente abgebildet, soweit diese einen fachlich passenden Wert bieten.

| Ressourcentyp | Element | Zwischenstatus | Nach Freigabe | Nach Ablehnung |
|---|---|---|---|---|
| MedicationRequest | `status`, ergänzend `statusReason` | `on-hold`, ergänzend `statusReason` = `clarif` | übermittelter Status, z. B. `active` | `cancelled` |
| AllergyIntolerance | `verificationStatus` | `unconfirmed` | `confirmed` | `refuted` |
| Observation | `status` | `preliminary` | `final` | `cancelled` |
| RiskAssessment | `status` | `preliminary` | `final` | `cancelled` |
| Medication | `status` | `inactive` | `active` | `entered-in-error` |
| MedicationStatement | – | offen | übermittelter Status | offen |
| MedicationAdministration | – | offen | übermittelter Status | offen |
| List | – | offen | übermittelter Status | offen |

Die Festlegung für `MedicationRequest` entspricht dem Hinweis am Element `status` im Profil [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.html).

Für `MedicationStatement`, `MedicationAdministration` und `List` bietet das jeweilige Statuselement keinen fachlich passenden Zwischenwert: `on-hold` bedeutet bei `MedicationStatement` und `MedicationAdministration`, dass die Einnahme bzw. Verabreichung pausiert ist, und `List.status` kennt nur `current`, `retired` und `entered-in-error`. Für diese Ressourcentypen ist die Kennzeichnung des Zwischenstatus noch festzulegen, z. B. über eine einheitliche Markierung in `meta.tag`.

### Verhalten gegenüber dem sendenden System

* **Antwort auf die Create-Interaktion:** Das empfangende System beantwortet eine technisch gültige Create-Interaktion auch dann mit `201 Created`, wenn die Ressource zunächst im Zwischenstatus angelegt wird. Es SOLL die angelegte Ressource einschließlich des gesetzten Status in der Antwort zurückgeben.
* **Abweichender Status:** Das sendende System SOLL nicht davon ausgehen, dass der von ihm übermittelte Status übernommen wurde. Es SOLL den Status der Ressource aus der Antwort oder durch einen anschließenden Abruf auswerten.
* **Ergebnis der Prüfung:** Das sendende System erfährt das Ergebnis, indem es die Ressource erneut abruft (Read- oder Search-Interaktion). Ergänzend KANN das empfangende System Statusänderungen aktiv mitteilen, z. B. über das Modul ISiK Subscription.
* **Ablehnung:** Eine abgelehnte Ressource bleibt mit dem Ablehnungsstatus abrufbar. Wo das Profil dies vorsieht, SOLL das empfangende System den Grund der Ablehnung angeben, z. B. in `MedicationRequest.statusReason`. Das sendende System DARF eine abgelehnte Ressource NICHT als gültigen Bestandteil der Medikationsdaten behandeln. Eine korrigierte Fassung übermittelt es als neue Create-Interaktion.
* **Transaktionen:** Bei einem Transaktions-Bundle erfolgt das Clearing je enthaltener Ressource. Die Vorgaben zur Verarbeitung der Transaktion selbst (vgl. [REST-API](RestApi.html)) bleiben unberührt.
