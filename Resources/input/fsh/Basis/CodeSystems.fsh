CodeSystem: ISiKBesondereBehandlungsformReha
Id: ISiKBesondereBehandlungsformRehaCS
Description: "Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen."
* insert Meta
* ^caseSensitive = false
* #0 "keine"
* #1 "MBOR" "Medizinisch beruflich orientierte Rehabilitation"
* #2 "VMO (vor dem Jahr 2021) / Kombination MBOR/VMO (ab dem Jahr 2021)" "Verhaltensmedizinische Orthopädie"
* #3 "VOR" "Verhaltensmedizinisch orientierte Rehabilitation"
* #9 "sonstige"

CodeSystem: ISiKBehandlungsergebnisReha
Id: ISiKBehandlungsergebnisRehaCS
Description: "Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis."
* insert Meta
* ^caseSensitive = false
* #0 "Ziff. 1-3 trifft nicht zu"
* #1 "gebessert"
* #2 "unverändert"
* #3 "verschlechtert"

CodeSystem: ISiKEntlassformReha
Id: ISiKEntlassformRehaCS
Description: "ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform."
* insert Meta
* ^caseSensitive = false
* #01 "Behandlung regulär beendet"
* #02 "Behandlung vorzeitig auf ärztliche Veranlassung beendet"
* #03 "Behandlung vorzeitig mit ärztlichem Einverständnis beendet"
* #04 "Behandlung gegen ärztlichen Rat beendet („Vorzeitig ohne ärztliches Einverständnis“)"
* #05 "Behandlung aus disziplinarischen Gründen beendet"
* #06 "Verlegung in Krankenhaus, bei DRV auch: Verlegung in andere Reha-Einrichtung"
* #07 "Wechsel zu ambulanter (Sucht), ganztägig ambulanter, stationärer Reha"
* #09 "gestorben"
* #11 "Wechsel von Phase B zu D vorgesehen"
* #12 "Wechsel von Phase B zu C vorgesehen"
* #13 "Wechsel von Phase C zu D vorgesehen x"
* #14 "Zuständigkeitswechsel des Leistungsträgers"
* #15 "Behandlung aus sonstigen Gründen beendet"
* #16 "Wechsel von Phase D zu C"
* #17 "Wechsel von Phase D zu B"
* #18 "Wechsel von Phase C zu B"
* #19 "Entlassung vor Wiederaufnahme (für CIFolgetherapie)"
// * #90 "planmäßig (entspricht Zusammenfassung der Schlüssel 01 bis 03)"
// * #90 "nicht planmäßig (entspricht Zusammenfassung der Schlüssel 04 und 05)"

CodeSystem: ISiKUnterbrechungReha
Id: ISiKUnterbrechungRehaCS
Description: "ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung."
* insert Meta
* ^caseSensitive = false
* #01 "Interkurrente Erkrankung"
* #02 "Stationäre Krankenhausbehandlung (nicht interkurrente Erkrankung)"
* #03 "Beurlaubung"
* #04 "Stationäre Krankenhausbehandlung"
* #05 "Erkrankung (ohne Krankenhausbehandlung)"
* #06 "Belastungserprobung im häuslichen Umfeld"
* #09 "Sonstiger Grund, der zur Unterbrechung der Pflegekosten führt"

CodeSystem: ISiKIdentifierTypeErweiterung
Id: ISiKIdentifierTypeErweiterungCS
Title: "Erweiterung von identifier.type in ISiK"
Description: "ISiK definiert an dieser Stelle einen eigene Identifier Typen. Dieses CodeSystem ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen."
* insert Meta
* ^caseSensitive = false
* #ASN "Ambulante Scheinnummer"

CodeSystem: ISiKEncounterTypeErweiterung
Id: ISiKEncounterTypeErweiterungCS
Title: "Erweiterung von Encounter.type in ISiK"
Description: "ISiK definiert an dieser Stelle eigene Encounter Typen. Dieses CodeSystem ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen."
* insert Meta
* ^caseSensitive = false
* #ambulant "Ambulanter Kontakt"
* #virtuell "Virtueller Kontakt"