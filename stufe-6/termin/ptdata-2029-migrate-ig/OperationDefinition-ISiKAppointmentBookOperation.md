# Book - ISiK Terminplanung Implementierungsleitfaden v6.0.0-rc

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Book**

## OperationDefinition: Book 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/OperationDefinition/AppointmentBook | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:Book |

 
OperationDefinition für die Buchung eines Termins. Die Operation überprüft ob der Termin noch verfügbar ist im Termin-Repository. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "ISiKAppointmentBookOperation",
  "url" : "https://gematik.de/fhir/isik/OperationDefinition/AppointmentBook",
  "version" : "6.0.0-rc",
  "name" : "Book",
  "status" : "active",
  "kind" : "operation",
  "experimental" : false,
  "date" : "2025-12-17",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        }
      ]
    }
  ],
  "description" : "OperationDefinition für die Buchung eines Termins. Die Operation überprüft ob der Termin noch verfügbar ist im Termin-Repository.",
  "affectsState" : true,
  "code" : "book",
  "resource" : ["Appointment"],
  "system" : false,
  "type" : true,
  "instance" : false,
  "parameter" : [
    {
      "name" : "appt-resource",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "documentation" : "Eine Appointment-Ressource entsprechend dem dazugehörigen ISiK-Profil MUSS übergeben werden. Falls das Parameter-Element 'Appointment' als einziges Parameter-Element verwendet wird, SOLL die Appointment-Ressource direkt im HTTP Body übergeben werden, alternativ zu einer Parameter-Ressource inklusive dem eingebetteten Appointment-Element. Invalide Ressourcen MÜSSEN abgelehnt werden durch das Termin-Repository (zur Form der Ablehnung s.u.). Das Appointment MUSS den Status 'proposed' enthalten. Bei Terminverschiebungen (keine Terminabsage!) kann ein Appointment mit einem angepassten Zeitfenster in diesem Parameter übergeben werden. Appointment-Ressourcen können beim Anlegen eine id enthalten. Ist ein Appointment mit dieser id bereits im Termin-Repository vorhanden, MUSS es unter Beibehaltung der id aktualisiert werden.",
      "type" : "Appointment"
    },
    {
      "name" : "cancelled-appt-id",
      "use" : "in",
      "min" : 0,
      "max" : "1",
      "documentation" : "Im Falle einer Terminverschiebung kann die Situation vorkommen, dass Terminressourcen (z.B. Räume oder angebotene Dienstleistungen) nicht verfügbar sind. Dadurch kann es notwendig sein, den zu verschiebenden Termin neu zu planen. Dies wird als zweistufiger Prozess durch die $book-Operation unterstützt, bei dem ein Termin storniert und ein neuer Termin gebucht wird. Dieser Parameter repräsentiert die Ressourcen-Id des zu stornierenden Appointments. Der uri-Parameter kann eine absolute URL enthalten, Server SOLLEN jedoch nur Termine für ihre eigene Domäne verwalten. Im neu-angelegten Appointment MUSS eine Reference auf den abgesagten Termin hinterlegt werden (vgl. Appointment.extension:replaces) durch den Server. Der Status der abgesagten Ressource MUSS durch den Server angepasst werden (status = 'cancelled'). Die Verschiebung ist als transaktionale Operation zu verstehen, d.h. die Absage des originalen Termins DARF durch den Server nur bestätigt werden, wenn der neue vorgeschlagene Termin angenommen werden kann. Andernfalls MUSS die Terminverschiebung mit einem entsprechenden Hinweis abgelehnt werden.",
      "type" : "uri"
    },
    {
      "name" : "schedule",
      "use" : "in",
      "min" : 0,
      "max" : "1",
      "documentation" : "Im Falle dass ein Appointment keine Referenz auf ein oder mehrere Slots enthält, MUSS der Server die benötigten Slots auf Basis der Referenz auf Schedule, sowie dem Start- und Endzeitpunkt im Appointment ermitteln.",
      "type" : "Reference",
      "targetProfile" : [
        "https://gematik.de/fhir/isik/StructureDefinition/ISiKKalender"
      ]
    },
    {
      "name" : "patient",
      "use" : "in",
      "min" : 0,
      "max" : "1",
      "documentation" : "Dieser Parameter KANN durch einen Client und MUSS durch ein Termin-Repository unterstützt werden. Wird der Parameter unterstützt, dann gelten folgende Festlegungen: Eine Patient-Ressource, die die Person identifiziert, für die der Termin gemäß dem Parameter 'appt-resource' gebucht werden soll. Die Ressource KANN vom ISiKPatient-Profil abweichen, falls für die Terminbuchung irrelevante Pflichtangaben aus dem Profil nicht bekannt sind. Invalide Ressourcen MÜSSEN vom Termin-Repository abgelehnt werden (zur Form der Ablehnung s.u.). Dieser Parameter dient der Übermittlung der Patienteninformationen, falls diese dem Termin-Repository noch nicht bekannt sind. Das Termin-Repository SOLL im bestätigten Termin eine Referenz auf einen Patienten zurückgeben, sofern kein Patient unter Appointment.participant im 'appt-resource'-Parameter referenziert ist.",
      "type" : "Patient"
    },
    {
      "name" : "related-person",
      "use" : "in",
      "min" : 0,
      "max" : "1",
      "documentation" : "Dieser Parameter KANN durch einen Client und MUSS durch ein Termin-Repository unterstützt werden. Wird der Parameter unterstützt, dann gelten folgende Festlegungen: Eine RelatedPerson-Ressource, die eine Person identifiziert, die den Termin im Namen des Patienten bucht. Die Ressource KANN vom ISiKRelatedPerson-Profil abweichen, falls für die Terminbuchung irrelevante Pflichtangaben aus dem Profil nicht bekannt sind. Invalide Ressourcen MÜSSEN vom Termin-Repository abgelehnt werden (siehe Form der Ablehnung unten). Dieser Parameter dient der Übermittlung der RelatedPerson-Informationen, falls diese dem Termin-Repository noch nicht bekannt sind. Das Termin-Repository SOLL im bestätigten Termin eine Referenz auf eine RelatedPerson zurückgeben, sofern keine RelatedPerson unter Appointment.participant im 'appt-resource'-Parameter referenziert ist.",
      "type" : "Patient"
    },
    {
      "name" : "return",
      "use" : "out",
      "min" : 0,
      "max" : "1",
      "documentation" : "Falls die Interaktion erfolgreich ist, ist der Status Code HTTP 201 - Created zurückzugeben. Im Erfolgsfall MUSS als Return-Parameter eine Appointment-Ressource (entsprechend dem dazugehörigen ISiK-Profil) zurückgegeben werden. Das id-Element der Appointment-Ressource MUSS korrekt gefüllt werden. Der Server MUSS den Status der Appointment-Ressource auf 'booked' oder 'pending' ändern. Der Server MUSS die verwendeten Slot-Ressourcen als Referenz im Appointment angeben. Die Appointment-Ressource SOLL direkt im HTTP Body zurückgegeben werden, falls es sich um den einzigen Rückgabewert handelt. Alternativ kann die Appointment-Ressource innerhalb einer Parameter-Ressource zurückgegeben werden. Als Teil der Parameter-Ressource können zusätzlich Hinweise zum Termin als OperationOutcome zurückgegeben werden.",
      "type" : "Appointment"
    },
    {
      "name" : "return",
      "use" : "out",
      "min" : 0,
      "max" : "1",
      "documentation" : "Falls die Interaktion fehlschlägt, MUSS als Return-Parameter eine OperationOutcome-Ressource zurückgegeben werden. Syntaktisch fehlerhafte Appointment-Ressourcen (z. B. ungültige XML-/JSON-Repräsentationen gemäß Kernspezifikation) MÜSSEN mit dem HTTP Status-Code 400 – Bad Request abgewiesen werden. Anderweitige und insbesondere semantisch invalide Appointment-Ressourcen (z.B. bei inkorrekter semantischer Kodierung der Fachrichtung (serviceType) oder bei Verstößen gegen Kardinalitäten gemäß dem ISiKTermin-Profil oder der $book-OperationDefinition) MÜSSEN mit einer OperationOutcome-Ressource abgewiesen werden. In diesem Fall SOLL der HTTP Status-Code HTTP 422 - Unprocessable Entity verwendet werden. Eine OperationOutcome-Ressource KANN zu informativen Zwecken in jedem Fall zurückgegeben werden (s.o.).",
      "type" : "OperationOutcome"
    }
  ]
}

```
