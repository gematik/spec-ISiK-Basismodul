---
topic: markdown-KontaktGesundheitseinrichtung-Kontakt-Beispiele
---
#### Beispiele

**Beispiel für das Profil ISiKKontaktGesundheitseinrichtung:**

{{json:Resources/fsh-generated/resources/Encounter-Fachabteilungskontakt.json}}

**Beispiel für die Abbildung einer stationäre Aufnahme:**

{{json:Resources/fsh-generated/resources/Encounter-FachabteilungskontaktStationaereAufnahme.json}}

Die Anlage eines Versorgungsstellenkontakts ist optional möglich; sie fällt jedoch nicht in den Geltungsbereich von ISiK.

**Beispiel für die Abbildung eines Bettenwechsels:**

{{json:Resources/fsh-generated/resources/Encounter-FachabteilungskontaktBettenverlegung.json}}

Die Bettenverlegung wird durch Anpassungen im "location"-Element abgebildet.
Der vorherige Bettenstellplatz kann mit dem Status "completed" bestehen bleiben, wobei die "period" entsprechend anzupassen ist.
Der neue Bettenstellplatz erhält den Status "active".

Die Anlage eines Versorgungsstellenkontakts ist optional möglich; sie fällt jedoch nicht in den Geltungsbereich von ISiK. Der Status eines vorherigen Versorgungsstellenkontaktes ist auf "completed" zu setzen.

**Beispiel für die Abbildung eines Fachbereichswechsel:**

{{json:Resources/fsh-generated/resources/Encounter-FachabteilungskontaktFachbereichswechsel1.json}}

Der Status eines vorherigen Abteilungskontakts ist auf completed zu setzen. Der Zeitpunkt der Verlegung ist in period.end zu dokumentieren.

{{json:Resources/fsh-generated/resources/Encounter-FachabteilungskontaktFachbereichswechsel2.json}}

Ein neuer aktiver Abteilungskontakt ist anzulegen. Der Startzeitpunkt in "period.start" entspricht dem Zeitpunkt der Verlegung.
Der Wechsel der Fachabteilung führt zudem zu einer neuen Kodierung in "serviceType". Die "partOf"-Referenz bestehender Versorgungsstellenkontakte ist auf den neuen Abteilungskontakt zu setzen.

**Beispiel für die Abbildung eines Stationswechsel:**

{{json:Resources/fsh-generated/resources/Encounter-FachabteilungskontaktStationswechsel1.json}}

{{json:Resources/fsh-generated/resources/Encounter-FachabteilungskontaktStationswechsel2.json}}

Ändert sich lediglich die Station (Location) bei einer Verlegung und nicht die Fachabteilung (serviceType), ist der bestehende Abteilungskontakt zu aktualisieren; ein neuer Abteilungskontakt wird nicht angelegt.

**Beispiel für die Abbildung einer Entlassung:**

{{json:Resources/fsh-generated/resources/Encounter-FachabteilungskontaktEntlassung.json}}

Alle Abteilungskontakte sind mit einem period.end zu versehen und der Status ist auf completed zu setzen. Dies gilt auch für noch offene Versorgungsstellenkontakte.
