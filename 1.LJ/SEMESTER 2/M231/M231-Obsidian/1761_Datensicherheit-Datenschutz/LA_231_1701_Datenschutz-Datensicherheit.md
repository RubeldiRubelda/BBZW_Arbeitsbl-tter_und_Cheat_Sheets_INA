```dataview
table without id
Titel as "Titel",
Modul as "Modul",
Autor_Version as "Autor/Version",
Hilfsmittel as "Hilfsmittel",
Nachweis as "Nachweis",
Gütekriterien as "Gütekriterien",
Sozialform as "Sozialform",
Leistungsziele as "Leistungsziele"
where file = this.file
```

---

## Lern- und Arbeitsauftrag LA_231_1701_Datenschutz-Datensicherheit_BBZW

### Metadaten
| Eigenschaft        | Inhalt                                                                                       |
| ------------------ | -------------------------------------------------------------------------------------------- |
| **Titel**          | Datenschutz und Datensicherheit unterscheiden können                                         |
| **Modul**          | 231 Informatiker/in EFZ                                                                      |
| **Autor/Version**  | Davor Vukelic / V1.0                                                                         |
| **Hilfsmittel**    | • Notebook<br>• Präsentation: 1761_Datensicherheit-Datenschutz                               |
| **Nachweis**       | Abgabe auf Teams. Total 6 Punkte                                                             |
| **Gütekriterien**  | • Alle Rechtsräume sind genannt (2)<br>• Für jeden Rechtsraum ist der Einfluss begründet (4) |
| **Sozialform**     | Einzelarbeit / Partnerarbeit                                                                 |
| **Leistungsziele** | LZ 1.6 (ExZ)                                                                                 |

---

### Ausgangslage  
Datenschutz und Datensicherheit werden oft verwechselt oder einfach als gleichwertige Wörter behandelt.

---

## Aufgabenstellung

### Teilaufgabe 1: Datensicherheit  
Datensicherheit soll Vertraulichkeit, Integrität und Verfügbarkeit von Daten sicherstellen.  
Weisen Sie die folgenden Situationen den drei Begriffen zu.

| Situation                                                                                                                                           | Vertraulichkeit | Integrität | Verfügbarkeit |
| --------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | ---------- | ------------- |
| Bei jeder Änderung in der Datenbank wird die Zeit und der Benutzer protokolliert, welche die Änderung vorgenommen hat.                              |                 | X          |               |
| Der Zugang zum System ist nur mit Benutzername und Passwort möglich.                                                                                | X               |            |               |
| Die Webseite ist bei zwei verschiedenen Cloud-Anbietern gehostet. Bei einem Unterbruch übernimmt der zweite Anbieter.                               |                 |            | X             |
| Der Zugang zum Rechenzentrum ist nur mit Zutrittsbadge und Handvenenscanner möglich.                                                                | X               |            |               |
| Zu jedem Download wird auch die Checksumme (Hashcode) angezeigt.                                                                                    |                 | X          |               |
| Bei einem Totalausfall kann das Backup innerhalb von 4 Stunden alle Daten wiederherstellen.                                                         |                 |            | X             |
| Alle E-Mails werden automatisch verschlüsselt, bevor sie das interne Netzwerk verlassen.                                                            | X               |            |               |
| Ein Intrusion Detection System (IDS) wird eingesetzt, um verdächtige Aktivitäten zu überwachen und darauf zu reagieren.                             |                 | X          |               |
| Server werden regelmässig aktualisiert und gepatcht, um sicherzustellen, dass sie frei von bekannten Schwachstellen sind.                           |                 |            | X             |
| Mitarbeiterschulungen zur Sensibilisierung für Phishing-Angriffe und sichere Passwortpraktiken werden regelmässig durchgeführt.                     | X               | X          |               |
| Die Datenbank-Transaktionen werden mit Transaktionsprotokollen gesichert, um bei Fehlern oder Manipulationen eine Wiederherstellung zu ermöglichen. |                 | X          |               |
| Ein Lastenausgleichssystem sorgt dafür, dass der Zugriff auf die Datenbank auch bei hoher Nutzung schnell und zuverlässig bleibt.                   |                 |            | X             |

---

### Teilaufgabe 2: Datenschutz und Datensicherheit  
Entscheiden Sie für die folgenden Fälle, ob es sich vorwiegend um Datensicherheit oder um Datenschutz handelt.

| Fall                                                                                                                                           | Datenschutz | Datensicherheit |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | --------------- |
| Die Bewerbungsunterlagen für die Lehrstellen werden allen Kandidaten*innen, welche nicht berücksichtigt werden konnten, zurückgesendet.        | X           |                 |
| Wir erstellen stündlich ein Backup der wichtigsten Datenbanken.                                                                                |             | X               |
| Die Personaldossiers ehemaliger Mitarbeitenden werden nach einem Jahr mit Hilfe eines Shredders entsorgt.                                      | X           |                 |
| Für die Statistik in der BBZW werden alle Daten der Lernenden anonymisiert (Namen werden durch zufällige Nummern ersetzt).                     | X           |                 |
| Der Zugriff auf das eBanking erfolgt mit Benutzer, Passwort und einem PIN auf dem Smartphone.                                                  |             | X               |
| Ein Krankenhaus stellt sicher, dass nur berechtigtes Personal Zugriff auf die Patientenakten hat, indem es Zugriffsrechte strikt kontrolliert. |             | X               |
| Eine Firma führt regelmäßige Sicherheitsüberprüfungen durch, um unbefugte Zugriffe auf ihre Datenbanken zu verhindern.                         |             | X               |
| Die Kundeninformationen einer Online-Plattform werden nach fünf Jahren Inaktivität automatisch gelöscht.                                       | X           |                 |
| Die IT-Abteilung einer Universität verschlüsselt alle personenbezogenen Daten, die auf den Servern gespeichert sind.                           |             | X               |
| Es wird eine Zwei-Faktor-Authentifizierung für den Zugang zu vertraulichen Kundendaten eingesetzt.                                             |             | X               |

---

### Teilaufgabe 3: Datenschutz ist nur mit Hilfe von Datensicherheit möglich  
**Aufgabe:**  
Finden Sie ein eigenes Beispiel, in dem Datenschutz mit Hilfe von Datensicherheit sichergestellt wird. Vergleichen Sie die Lösung mit der Lernpartnerin.

-> Mein BrowserAddon schützt die Daten der Benutzer indem es keine Daten der Lernenden an einen Server zur Statistik sendet. Es werden lediglich die Metastatistiken von Google erhoben welche Standartmässig in allen Addons aktiviert sind. Durch das werden keine Daten der Schüler nach aussen gebracht und ebenso wird sichergestellt, dass niemand an diese Daten dran kommen würde.

**Erweiterte Aufgabe:**  
- Überlegen Sie sich ein weiteres Beispiel, in dem Datenschutz nur durch geeignete Massnahmen der Datensicherheit gewährleistet werden kann.  
- Diskutieren Sie, welche zusätzlichen Sicherheitsmaßnahmen eingeführt werden könnten, um den Datenschutz noch weiter zu verbessern.  
- Erstellen Sie einen kurzen Bericht, der die Beziehungen zwischen Datenschutz und Datensicherheit in Ihrem Beispiel beschreibt. Teilen Sie diesen Bericht mit Ihrem Lernpartner/Ihrer Lernpartnerin und tauschen Sie sich darüber aus.

**Zusätzliche Hinweise für die Diskussion:**  
- Welche Rolle spielen technische und organisatorische Maßnahmen, um Datenschutz durch Datensicherheit zu gewährleisten?  
- Wie können Mitarbeitende durch Schulungen und Sensibilisierung zum Schutz der Daten beitragen?  

---

### Gütekriterien  
Der Lern- und Arbeitsauftrag ist erfüllt, wenn …  
- [x] Sie die Situationen den Begriffen der Datensicherheit zugeteilt haben.  
- [x] Sie die Fälle der Datensicherheit oder dem Datenschutz zugeordnet haben.  
- [x] Sie ein eigenes Beispiel erstellt und diskutiert haben.