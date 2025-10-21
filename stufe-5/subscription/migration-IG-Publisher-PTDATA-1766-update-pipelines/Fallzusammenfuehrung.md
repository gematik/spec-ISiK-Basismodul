# Fallzusammenführung - Test Implementation Guide v0.0.1

Implementation Guide

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Fallzusammenführung**

## Fallzusammenführung

# Encounter Merge Notification (Fallzusammenführung)

## Kontext und Zielsetzung

Im Rahmen interoperabler Krankenhausinformationssysteme (KIS) und anderer Encounter-führender Systeme (z.B. PDMS) kann es vorkommen, dass mehrere Encounter (Fälle) desselben Patienten nachträglich als zusammengehörig erkannt und zu einem gemeinsamen Encounter zusammengeführt werden. Ziel dieser Seite ist es, die **technische Abbildung einer solchen Encounter Merge Notification** zu beschreiben und damit eine einheitliche Kommunikation über erfolgte Fallzusammenführungen zu ermöglichen.

Hintergrund für solche Zusammenführungen können unterschiedliche Situationen im klinischen Alltag sein:

* **Doppelte Anlage bei Notfallaufnahme:** In Notfallsituationen wird ein Patient häufig schnell aufgenommen, teils ohne vollständige Identitätsprüfung. Wird der Patient später erneut – etwa nach Verlegung oder durch eine andere Abteilung – als neuer Encounter angelegt, können für denselben klinischen Aufenthalt mehrere Encounters entstehen. Nach Klärung der Identität werden diese Encounters zusammengeführt.
* **Abteilungsübergreifende Behandlung:** Patienten, die während eines Aufenthalts in mehrere Abteilungen verlegt werden (z.B. von der Notaufnahme auf die Intensivstation und dann auf eine Normalstation), werden in manchen Systemen zunächst als eigenständige Encounters geführt. Nach Abschluss des Aufenthalts können diese Encounters zu einem Gesamt-Encounter konsolidiert werden, um den klinischen Verlauf vollständig abzubilden.
* **Fehlerhafte oder parallele Dokumentation:** Es kann vorkommen, dass versehentlich für denselben Patienten und denselben Behandlungsanlass mehrere Encounters angelegt werden (z.B. durch parallele Arbeit verschiedener Teams oder Subsysteme). Nach Entdeckung des Fehlers werden die Encounters zusammengeführt, um die medizinische Dokumentation zu vereinheitlichen.
* **Nachträgliche Datenbereinigung:** Im Rahmen von Qualitätsmanagement, Datenmigration oder Systemumstellungen werden Dubletten entdeckt. Um die medizinische Historie korrekt und konsistent zu halten, werden die betreffenden Encounters zusammengeführt.

Die konkrete Umsetzung des Merge-Prozesses sowie die Logik zur Zusammenführung und zur Auflösung von Konflikten liegt vollständig in der Verantwortung der jeweiligen Systeme und ist nicht Bestandteil dieser Spezifikation.

**Hinweis:**
 Diese Seite bezieht sich ausschließlich auf Encounter (Kontakt/Fall) im ISiK-Kontext. Zur begrifflichen Abgrenzung von Fall, Encounter, Account und EpisodeOfCare siehe die [ISiK-Basis-Stufe-5-Seite zur Fallabbildung](https://simplifier.net/guide/isik-basis-stufe-5/einfuehrung/usecasesanwendung/abbildung-des-konstrukt-fall?version=5.0.0-rc2).

## User Story

**Als Anwender eines KIS oder PDMS möchte ich, dass nach einer Zusammenführung zweier Encounter für einen Patienten eine standardisierte Benachrichtigung („Encounter Merge Notification“) an angebundene Subsysteme erfolgt, damit diese ihre Datenkonsistenz sicherstellen und ggf. Referenzen aktualisieren können.**

## Technische Anforderungen

* Es **SOLL** eine Encounter Merge Notification bereitgestellt werden, wenn zwei oder mehr Encounter zu einem gemeinsamen Encounter zusammengeführt wurden.
* Die Notification **SOLL** das [ISiK Subscription Profil](https://simplifier.net/isik-stufe-5/isiksubscription) nutzen.
* Als `.criteria` **SOLL** folgender Wert genutzt werden:
 `https://gematik.de/fhir/isik/SubscriptionTopic/encounter-merge`
 mit dem Display: `encounter-merge`
* Die Notification **SOLL** mindestens folgende Informationen enthalten: 
* Die Referenz auf den „überlebenden“ (Master-)Encounter.
* Die Referenzen auf die „zusammengeführten“ (Source-)Encounters, die nicht mehr eigenständig fortgeführt werden.
 
* Die Notification **SOLL** eindeutig als Encounter Merge Notification gekennzeichnet sein.
* Die Notification **SOLL** als Ereignis an relevante Subsysteme übermittelt werden (mittels ISiK Subscription Profil).
* Es **SOLL** keine Vorgaben zur Fehlerbehandlung beim Merge-Prozess geben. Fehler und Sonderfälle sind durch die Business-Logik der Systeme zu adressieren.

## Hinweise zur Referenzierung

* Nach erfolgtem Merge **SOLLEN** alle Referenzen, die auf einen der zusammengeführten Encounter zeigen, auf den überlebenden Encounter aktualisiert werden. Dies ist jedoch außerhalb des Schnittstellenumfangs und in der Verantwortung der implementierenden Systeme.
* Da für Encounter keine FHIR-Standardoperation wie `$merge` existiert, ist die Benachrichtigung über einen erfolgten Merge ein konzeptuelles Konstrukt (sie ist nicht Teil der offiziellen FHIR-Spezifikation)

## Profilreferenz

Weitere Details zur technischen Abbildung von Encounter-Ressourcen im ISiK-Kontext finden sich im [ISiK-Basis Encounter-Profil](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Kontakt?version=5.0.0-rc2).

-------

## Beispiel für eine Encounter Merge Notification (Pseudo-JSON)

#todo example in fsh

```json { “resourceType”: “Subscription”, “meta”: { “profile”: [ “https://gematik.de/fhir/isik/StructureDefinition/ISiKSubscription” ] }, “status”: “active”, “reason”: “Benachrichtigung bei Encounter-Merge”, “criteria”: { “code”: “https://gematik.de/fhir/isik/SubscriptionTopic/encounter-merge”, “display”: “encounter-merge” }, “channel”: { “type”: “rest-hook”, “endpoint”: “https://example.org/fhir/notification”, “payload”: “application/fhir+json” } }

#todo example for pre and post merge

