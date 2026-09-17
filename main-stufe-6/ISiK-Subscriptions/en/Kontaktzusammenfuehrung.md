# Encounter Merge Notification (Kontaktzusammenführung) - ISiK Subscription Implementierungsleitfaden v6.0.0

ISiK Subscription Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Encounter Merge Notification (Kontaktzusammenführung)**

## Encounter Merge Notification (Kontaktzusammenführung)

### Kontext und Zielsetzung

Im Rahmen interoperabler Krankenhausinformationssysteme (KIS) und anderer Encounter-führender Systeme (z.B. PDMS) kann es vorkommen, dass mehrere Encounter (Abteilungskontakte) desselben Patienten nachträglich als zusammengehörig erkannt und zu einem gemeinsamen Encounter zusammengeführt werden. Ziel dieser Seite ist es, die **technische Abbildung einer solchen Encounter Merge Notification** zu beschreiben und damit eine einheitliche Kommunikation über erfolgte Fallzusammenführungen zu ermöglichen.

Hintergrund für solche Zusammenführungen können unterschiedliche Situationen im klinischen Alltag sein:

* **Fehlerhafte oder parallele Dokumentation:** Es kann vorkommen, dass versehentlich für denselben Patienten und denselben Behandlungsanlass mehrere Encounter angelegt werden (z.B. durch parallele Arbeit verschiedener Teams oder Subsysteme). Nach Entdeckung des Fehlers werden die Encounter zusammengeführt, um die medizinische Dokumentation zu vereinheitlichen.
* **Nachträgliche Datenbereinigung:** Im Rahmen von Qualitätsmanagement, Datenmigration oder Systemumstellungen werden Dubletten entdeckt. Um die medizinische Historie korrekt und konsistent zu halten, werden die betreffenden Encounter zusammengeführt.

Die konkrete Umsetzung des Merge-Prozesses sowie die Logik zur Zusammenführung und zur Auflösung von Konflikten liegt vollständig in der Verantwortung der jeweiligen Systeme und ist nicht Bestandteil dieser Spezifikation.

**Hinweis:**
 Diese Seite bezieht sich ausschließlich auf Encounter (Kontakt/Fall) im ISiK-Kontext. Zur begrifflichen Abgrenzung von Fall, Encounter, Account und EpisodeOfCare siehe die [ISiK-Basis-Seite zur Fallabbildung](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/StructureDefinition-ISiKKontaktGesundheitseinrichtung.html).

### User Story

**Als Anwender eines KIS oder PDMS möchte ich, dass nach einer Zusammenführung zweier Encounter für einen Patienten eine standardisierte Benachrichtigung („Encounter Merge Notification“) an angebundene Subsysteme erfolgt, damit diese ihre Datenkonsistenz sicherstellen und ggf. Referenzen aktualisieren können.**

### Technische Anforderungen

* Es **SOLL** eine Encounter Merge Notification bereitgestellt werden, wenn zwei oder mehr Encounter zu einem gemeinsamen Encounter zusammengeführt wurden.
* Die Notification **SOLL** das [ISiK Subscription Profil](https://simplifier.net/isik-stufe-6/isiksubscription) nutzen.
* Als `.criteria` **SOLL** folgender Wert genutzt werden:
 `https://gematik.de/fhir/isik/SubscriptionTopic/encounter-merge`
* Die Notification **SOLL** mindestens folgende Informationen enthalten: 
* Die Referenz auf den „überlebenden“ (Master-)Encounter.
* Die Referenzen auf die „zusammengeführten“ (Source-)Encounters, die nicht mehr eigenständig fortgeführt werden.
 
* Die Notification **SOLL** eindeutig als Encounter Merge Notification gekennzeichnet sein.
* Die Notification **SOLL** als Ereignis an relevante Subsysteme übermittelt werden (mittels ISiK Subscription Profil).
* Es **SOLL** keine Vorgaben zur Fehlerbehandlung beim Merge-Prozess geben. Fehler und Sonderfälle sind durch die Business-Logik der Systeme zu adressieren.

### Hinweise zur Referenzierung

* Nach erfolgtem Merge **SOLLEN** alle Referenzen, die auf einen der zusammengeführten Encounter zeigen, auf den verbliebenen Encounter aktualisiert werden. Dies ist jedoch außerhalb des Schnittstellenumfangs und in der Verantwortung der implementierenden Systeme.
* Da für Encounter keine FHIR-Standardoperation wie `$merge` existiert, ist die Benachrichtigung über einen erfolgten Merge ein konzeptuelles Konstrukt (sie ist nicht Teil der offiziellen FHIR-Spezifikation)

#### Obsolete Encounter-Ressource

Es gelten keine gesonderten Anforderungen an eine obsolete Encounter-Ressource über die ISiKKontaktGesundheitseinrichtung-Profilanforderungen hinaus.

Allerdings KANN das encounter-führende System die obsolete Encounter-Ressource nach einem Merge weiter vorhalten. Ein Entfernen der obsoleten Ressource ist ebenfalls erlaubt.

Falls die obsolete Ressource nach einem Merge weiter vorgehalten wird, SOLL die Ersetzungsbeziehung für Clients nachvollziehbar dokumentiert werden.

Die Verwendung der Extension `http://hl7.org/fhir/StructureDefinition/encounter-recordLinkage` ist hierfür eine **optionale** Modellierungsvariante, da diese Extension derzeit noch nicht final veröffentlicht ist.

Bei Nutzung dieser optionalen Variante KÖNNEN die Elemente der obsoleten Ressource wie folgt befüllt werden:

* `.status = entered-in-error` (sofern fachlich zutreffend)
* `extension.url = "http://hl7.org/fhir/StructureDefinition/encounter-recordLinkage"`
* `extension[encounter-recordLinkage].extension[other] = Reference(auf resultierenden Encounter)`
* `extension[encounter-recordLinkage].extension[type] = "replaced-by"`

#### Resultierende Encounter-Ressource

Es gelten keine gesonderten Anforderungen an eine resultierende Encounter-Ressource über die ISiKKontaktGesundheitseinrichtung-Profilanforderungen hinaus.

Allerdings SOLL das encounter-führende System nach einem Merge die Ersetzungsbeziehung auf der resultierenden Ressource kenntlich machen.

Bei Nutzung der optionalen `encounter-recordLinkage`-Variante KÖNNEN die Elemente der resultierenden Ressource wie folgt befüllt werden:

* `extension.url = "http://hl7.org/fhir/StructureDefinition/encounter-recordLinkage"`
* `extension[encounter-recordLinkage].extension[other] = Reference(auf obsolete Encounter-Ressource)`
* `extension[encounter-recordLinkage].extension[type] = "replaces"`

### Profilreferenz

Weitere Details zur technischen Abbildung von Encounter-Ressourcen im ISiK-Kontext finden sich im [ISiK-Basis Encounter-Profil](https://gematik.github.io/spec-ISiK-Basismodul/stufe-5/basis/migrate-ig-to-ig-publisher-ptdata-1885/StructureDefinition-ISiKKontaktGesundheitseinrichtung.html).

### Beispiel für eine Encounter Merge Subscription

```
{
  "resourceType": "Subscription",
  "meta": {
    "profile": [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKSubscription"
    ]
  },
  "channel": {
    "type": "rest-hook",
    "endpoint": "https://example.org/fhir/notification",
    "payload": "application/fhir+json",
    "_payload": {
      "extension": [
        {
          "url": "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content",
          "valueCode": "id-only"
        }
      ]
    },
    "header": [
      "Authorization: Bearer xxxxxxxxxx"
    ]
  },
  "status": "requested",
  "reason": "Encounter merge subscription",
  "criteria": "https://gematik.de/fhir/isik/SubscriptionTopic/encounter-merge"
}

```

Nach erfolgreicher Fallzusammenführung würde ein abonnierter Client eine Notification als Bundle mit `SubscriptionStatus` erhalten, z.B.:

```
{
  "resourceType": "Bundle",
  "meta": {
    "profile": [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKSubscriptionNotification"
    ]
  },
  "type": "history",
  "entry": [
    {
      "fullUrl": "urn:uuid:9bb6fcbd-8391-4e35-bd4c-620a2db47af0",
      "resource": {
        "resourceType": "Parameters",
        "meta": {
          "profile": [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKSubscriptionStatus"
          ]
        },
        "parameter": [
          {
            "name": "subscription",
            "valueReference": {
              "reference": "Subscription/EncounterMergeSubscriptionExample"
            }
          },
          {
            "name": "topic",
            "valueCanonical": "https://gematik.de/fhir/isik/SubscriptionTopic/encounter-merge"
          },
          {
            "name": "status",
            "valueCode": "active"
          },
          {
            "name": "type",
            "valueCode": "event-notification"
          },
          {
            "name": "events-since-subscription-start",
            "valueString": "1"
          },
          {
            "name": "notification-event",
            "part": [
              {
                "name": "event-number",
                "valueString": "1"
              },
              {
                "name": "timestamp",
                "valueInstant": "2026-03-12T17:05:00+01:00"
              },
              {
                "name": "focus",
                "valueReference": {
                  "reference": "Encounter/EncounterZiel-1234"
                }
              },
              {
                "name": "additional-context",
                "valueReference": {
                  "reference": "Encounter/EncounterQuelle-4711"
                }
              }
            ]
          }
        ]
      },
      "request": {
        "method": "GET",
        "url": "https://gematik.de/fhir/isik/SubscriptionTopic/encounter-merge/$status"
      },
      "response": {
        "status": "200"
      }
    }
  ]
}

```

### Beispiele zur Fallzusammenführung

Die Fallzusammenführung kann analog zur Patientenzusammenführung über Quell-, Ziel- und resultierende Encounter-Ressourcen illustriert werden:

"Quell" Encounter-Ressource:

```
{
  "resourceType": "Encounter",
  "id": "EncounterQuelle-4711",
  "meta": {
    "profile": [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
    ]
  },
  "identifier": [
    {
      "system": "https://fhir.krankenhaus.example/sid/Fallnummer",
      "value": "F-2026-004711"
    }
  ],
  "status": "finished",
  "class": {
    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code": "IMP"
  },
  "subject": {
    "reference": "Patient/DorisZiel"
  },
  "period": {
    "start": "2026-03-10T08:10:00+01:00",
    "end": "2026-03-12T16:30:00+01:00"
  },
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/encounter-recordLinkage",
      "extension": [
        {
          "url": "other",
          "valueReference": {
            "reference": "Encounter/EncounterZiel-1234"
          }
        },
        {
          "url": "type",
          "valueCode": "replaced-by"
        }
      ]
    }
  ]
}

```

und

"Ziel" Encounter-Ressource:

```
{
  "resourceType": "Encounter",
  "id": "EncounterZiel-1234",
  "meta": {
    "profile": [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
    ]
  },
  "identifier": [
    {
      "system": "https://fhir.krankenhaus.example/sid/Fallnummer",
      "value": "F-2026-001234"
    }
  ],
  "status": "finished",
  "class": {
    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code": "IMP"
  },
  "subject": {
    "reference": "Patient/DorisZiel"
  },
  "period": {
    "start": "2026-03-10T08:00:00+01:00",
    "end": "2026-03-12T17:00:00+01:00"
  },
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/encounter-recordLinkage",
      "extension": [
        {
          "url": "other",
          "valueReference": {
            "reference": "Encounter/EncounterQuelle-4711"
          }
        },
        {
          "url": "type",
          "valueCode": "replaces"
        }
      ]
    }
  ]
}

```

Mittels eines **Encounter merge** wird die "Ziel"-Encounter-Ressource ausgewählt und weitergeführt. Daraus entsteht die resultierende Encounter-Instanz:

```
{
  "resourceType": "Encounter",
  "id": "EncounterZiel-1234",
  "meta": {
    "profile": [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
    ]
  },
  "identifier": [
    {
      "system": "https://fhir.krankenhaus.example/sid/Fallnummer",
      "value": "F-2026-001234"
    },
    {
      "use": "old",
      "system": "https://fhir.krankenhaus.example/sid/Fallnummer",
      "value": "F-2026-004711"
    }
  ],
  "status": "finished",
  "class": {
    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code": "IMP"
  },
  "subject": {
    "reference": "Patient/DorisZiel"
  },
  "period": {
    "start": "2026-03-10T08:00:00+01:00",
    "end": "2026-03-12T17:00:00+01:00"
  },
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/encounter-recordLinkage",
      "extension": [
        {
          "url": "other",
          "valueReference": {
            "reference": "Encounter/EncounterQuelle-4711"
          }
        },
        {
          "url": "type",
          "valueCode": "replaces"
        }
      ]
    }
  ]
}

```

