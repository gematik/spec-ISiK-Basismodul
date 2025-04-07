---
topic: ISiKMedikament-MS
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament
---

### Anmerkungen zu Must-Support-Feldern

<fql>
from
	StructureDefinition
where 
    url = %canonical
for differential.element
where mustSupport = true
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
</fql>

### Übergangslösung für die Chargendokumentation beim Verblistern

Für eine Einführung in den Sachverhalt, siehe [Chargendokumentation: Lösung für Verblisterer gefunden](https://www.deutsche-apotheker-zeitung.de/news/artikel/2023/11/13/chargendokumentation-loesung-fuer-verblisterer-gefunden).
Die dort angesprochene Lösung kann gegebenenfalls auch auf den stationären Sektor übertragen werden und im Modul ISiK Medikation Anwendung finden.

#### `Medication.lot-number`

**Bedeutung:** Chargennummer

**Hinweise:** Bitte beachten Sie gegebenenfalls die Regelungen der zwischen GKV-SV und DAV für den [Bereich der Apotheken](https://www.gkv-datenaustausch.de/leistungserbringer/apotheken/apotheken.jsp). Insbesondere den Technischen Anhang 7 (TA7) zur Arzneimittelabrechnungsvereinbarung gemäß § 300 Absatz 3 SGB V in der aktuellsten Fassung, [Erste Änderungsvereinbarung](https://www.gkv-spitzenverband.de/media/dokumente/krankenversicherung_1/arzneimittel/rahmenvertraege/apotheken/20240101_1.AeV_Arzneimittelabrechnungsvereinbarung_300_Abs.3_SGBV.pdf).

**Relevanter Passus:** Soweit die Übermittlung der Chargenbezeichnung beim „Stellen“ von Arzneimitteln technisch nicht möglich ist, wird bis zur Schaffung entsprechender technischer Möglichkeiten analog § 312 Absatz 1 Nummer 3 SGB V ausnahmsweise bis zum 30. Juni 2025 von der Verpflichtung zur Chargendokumentation abgesehen.
Anstelle der tatsächlichen Chargenbezeichnungen ist „STELLEN“ in das entsprechende Datenfeld einzutragen.
Dabei sind die Abrechnungs- und rahmenvertraglichen Regelungen im Übrigen einzuhalten, insbesondere ist sicherzustellen, dass die in Anlage 9 § 2 Satz 1 des Rahmenvertrages nach § 129 Absatz 2 SGB V beschriebenen Mitwirkungspflichten auf Nachfrage erfüllt werden. Siehe auch, [Ergänzung in der Anlage 1 zur Arzneimittelabrechnungsvereinbarung gemäß § 300 Abs. 3 SGB V](https://www.gkv-datenaustausch.de/media/dokumente/leistungserbringer_1/apotheken/technische_anlagen_aktuell/FAQ-Liste_TA7-V004_001_20231127.pdf) in der FAQ-Liste zur TA7. 