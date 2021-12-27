## Best Practice Empfehlungen für Standard-Suchfilter

Diese grundlegenden Best Practice Empfehlungen beziehen sich auf die korrekte Verwaltung des Suchprozesses seitens des Servers mit Bezug auf Sicherheit im klinischen Umfeld. Unstimmigkeiten in den Erwartungen zwischen Client und Server können dazu führen, dass mehr Ressourcen als erwartet oder angemessen gefunden werden, oder, dass Ressourcen in den Suchergebnissen fehlen, die eigentlich vorhanden sein sollten. Im folgenden werden daher Empfehlungen für Standard-Suchfilter genannt, die ein Grundmaß an Sicherheit im klinischen Umfeld bereitstellen sollen.

- Der Server sorgt dafür, dass Clients die benötigten Informationen finden können, auch bei Inhalten, die sich über mehrere FHIR-Ressourcen hinweg strecken.

- Der Server berücksichtigt bei Suchvorgängen Parameter mit fehlenden Werten und sendet bei fehlerhaften Suchparametern eine geeignete Antwort an den Client.

- Der Server enthält geeignete Standardfilter bei der Suche auf der Grundlage des Patientenkontextes - z. B. das Herausfiltern von Datensätzen, bei denen ein Fehler aufgetreten ist, oder das Filtern, um nur aktive, lebende Patienten einzuschließen, wenn dies angemessen ist, und dokumentiert diese eindeutig (vorzugsweise durch Aufnahme in den 'self link' für eine Suche).