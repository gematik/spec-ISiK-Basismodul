## Must-Support-Flags

Die Verwendung des [Must-Support-Flags](https://hl7.org/fhir/profiling.html#mustsupport) an Profil-Elementen hat im Kontext dieses Leitfadens folgende Bedeutung:

1. Im Kontext der Erstellung von FHIR-Ressourcen:

    Wenn die entsprechende Information in einem der Testszenarien bekannt ist, dann MUSS das Feld in der erstellten Ressource gefüllt sein. Ist die Information nicht bekannt, KANN es leer bleiben.

2. Im Kontext der Verarbeitung von FHIR-Ressourcen:

    Wenn die entsprechende Information in einer Ressource vorhanden ist, so MUSS diese vom verarbeitenden System ausgewertet, persistiert und dem Anwender dargestellt werden können.

    Sollte ein Hersteller den Bedarf an einer Änderung der Must-Support Vorgaben der ISiK Profile haben, MUSS er von den Profilen ableiten, auf denen die ISiK Profile basieren. Angaben dazu finden sich für jedes Datenobjekt im Kapitel Kompatibilität. In diesem Fall MUSS der Hersteller auch dafür sorgen, dass seine abgeleiteten Profile weiterhin kompatibel mit den ISiK Profilen bleiben.
