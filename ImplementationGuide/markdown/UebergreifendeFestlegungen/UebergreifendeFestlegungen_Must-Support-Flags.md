## Must-Support-Flags

Die Verwendung des [Must-Support-Flags](https://hl7.org/fhir/R4/profiling.html#mustsupport) (MS-Flag) an Profil-Elementen hat im Kontext dieses Leitfadens folgende Bedeutung:

1. Im Kontext der Erstellung von FHIR-Ressourcen:

    Wenn die entsprechende Information im erstellendem System bekannt ist, dann MUSS das Feld in der erstellten Ressource gefüllt sein. Ist die Information nicht bekannt, KANN es leer bleiben.
    Im Einzelfall können MS-Flags auf Element-Ebene spezifischer ausgestaltet werden (siehe Feld 'comment'), um besonderen kontextuellen Anforderungen gerecht zu werden.

    Weitere Hinweise zu Testszenarien im Rahmen des Bestätigungsverfahrens: 
    - Mit MS-Flag gekennzeichnete Elemente, die einem System nicht bekannt sind, können dennoch eine Implementierung erfordern, sofern die Information in einer Testvorbedingung übergeben wird.
    - Eine [Data Absent Reason](https://hl7.org/fhir/r4/extension-data-absent-reason.html) KANN verwendet werden, um im Testfall nicht zwingend geforderte Informationen als fehlend zu kennzeichnen 

2. Im Kontext der Verarbeitung von FHIR-Ressourcen:

    Wenn die entsprechende Information in einer Ressource vorhanden ist, so MUSS diese vom verarbeitenden System ausgewertet, persistiert und dem Anwender dargestellt werden können. Bei schreibenden Operationen (create, update) KANN ein Server nicht medizinisch-fachliche Inhalte (z.B. Metadaten) ändern, sofern dies keine Auswirkungen auf die fachlichen Informationen hat.

    Sollte ein Hersteller den Bedarf an einer Änderung der Must-Support Vorgaben der ISiK Profile haben, MUSS er von den Profilen ableiten, auf denen die ISiK Profile basieren. Angaben dazu finden sich für jedes Datenobjekt im Kapitel Kompatibilität. In diesem Fall MUSS der Hersteller auch dafür sorgen, dass seine abgeleiteten Profile weiterhin kompatibel mit den ISiK Profilen bleiben.
