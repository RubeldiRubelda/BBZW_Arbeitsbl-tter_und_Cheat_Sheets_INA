
---

```
table without id
Titel as "Titel",
Modul as "Modul",
Autor_Version as "Autor/Version",
Hilfsmittel as "Hilfsmittel",
Nachweis as "Nachweis",
Sozialform as "Sozialform",
Leistungsziele as "Leistungsziele"
where file = this.file
```

---

## **Lern- und Arbeitsauftrag LA_231_1724_Archivierung.docx**

### **Metadaten**

|Eigenschaft|Inhalt|
|---|---|
|**Titel**|Vor- und Nachteile verschiedener Archivierungstechnologien kennen|
|**Modul**|231 Informatiker/in EFZ|
|**Autor/Version**|Davor Vukelic / V1.0|
|**Hilfsmittel**|• Notebook  <br>• Präsentation: 1769_DSG_DSGVO_erweitert  <br>• Präsentation: 1767_Datenspeicher|
|**Nachweis**|Exam.net-Test (Einzelarbeit) mit 3 Fragen  <br>3 Punkte|
|**Sozialform**|Einzelarbeit / Partnerarbeit|
|**Leistungsziele**|LZ 5.3 (ExZ)|

---

### **Ausgangslage**

Nicht alle Speichermedien sind für die Archivierung geeignet. Der Konflikt zwischen günstigem Speicher, Haltbarkeit und Zugriffsmöglichkeiten kann kein Speicher lösen. Es sind immer Kompromisse.

---

## **Aufgabenstellung**

Sie sehen hier drei Fallbeispiele. Wählen Sie für jedes Fallbeispiel eine geeignete Archivierungsmethode aus. Geeignet meint hier aus Sicht der Kosten, der Datensicherheit und des Datenschutzes.

### **Fallbeispiel 1: Verein Freunde der Botanik**

Der Verein Freunde der Botanik ist nicht gewinnorientiert. Trotzdem muss er als Verein die Geschäftsdaten 10 Jahre lang aufbewahren. Es entstehen so pro Jahr Backups und Kopien im Umfang von ca. 2.3GiB. Da der Verein knapp bei Kasse ist, sucht er eine einfache, kostengünstige Lösung.

**Lösung & Analyse:**
- **Technik/Methode:** Speicherung auf externen USB-Festplatten, langlebigen optischen Medien (z.B. M-Disc, die nicht/kaum degradiert) oder einem sehr günstigen Schweizer Cloud-Speicher (Cloud-Backup). Wegen der winzigen Datenmenge (23 GB in 10 Jahren) reicht das völlig aus. Es müssen zwei Festplatten/Medien genutzt werden (Redundanz).
- **Kosten:** Extrem gering. Zwei externe Festplatten oder ein günstiges Cloud-Abo kosten nur wenige Franken pro Jahr.
- **Datensicherheit:** M-Discs bieten jahrzehntelange Haltbarkeit. Bei Festplatten empfiehlt sich ein regelmässiger Austausch (z.B. alle 3–5 Jahre), da sich Mechanik abnutzen kann. Durch redundante Lagerung wird Datensicherheit garantiert.
- **Datenschutz:** Physische Speichermedien können sicher bei einem Vorstandsmitglied im Tresor aufbewahrt werden (Schutz vor Hacking / Ransomware durch Offline-Lagerung). Falls Cloud-Speicher gewählt wird, muss vorher verschlüsselt werden.

### **Fallbeispiel 2: ABC AG**

Die Firma ABC AG hat im Keller einen Serverraum, da die Informatik selbst betrieben wird. Für das Archivieren der Geschäftsdaten muss eine Archivierung von 10 Jahren und länger gefunden werden. Auf die Daten muss sehr selten zugegriffen werden.

**Lösung & Analyse:**
- **Technik/Methode:** Magnetband-Laufwerke (Tape Storage, wie z.B. LTO). Tapes eignen sich ideal für sehr grosse Datenmengen und lange Liegezeiten (Cold Storage).
- **Kosten:** Das Laufwerk selbst kostet bei der Anschaffung, danach sind die einzelnen Bänder jedoch die absolut günstigste Speichermethode pro Terabyte. Ideal für Firmen mit eigenen Räumlichkeiten.
- **Datensicherheit:** Tapes sind langlebig (oft 15 bis 30 Jahre Garantie bei korrekter Umgebung mit konstanter Temperatur/Luftfeuchtigkeit) und widerstandsfähig gegen Ransomware, da sie abgekoppelt (Air-Gap) gelagert werden.
- **Datenschutz:** Tapes lassen sich hardwareseitig verschlüsseln (verhindert unbefugtes Lesen bei Diebstahl). Zugangskontrolle zum Tresor schützt die sensiblen Offline-Medien.

### **Fallbeispiel 3: DataCon GmbH**

Die Firma DataCon GmbH betreibt Informatiklösungen für verschiedene kleine und mittelgroße Unternehmen. Sie besitzt drei verschiedene Rechenzentren in der Schweiz. Für Backup und Langzeitarchivierung wird eine neue Lösung gesucht. Auf die Daten muss innerhalb von 1 Stunde zugegriffen werden können.

**Lösung & Analyse:**
- **Technik/Methode:** Disk-basiertes Archivsystem (HDD Storage Cluster mit Object Storage) verteilt über die Rechenzentren (Geo-Redundanz) oder vollautomatische Tape-Libraries. Aufgrund der Anforderung (Zugriff unter 1h) drängt sich "Nearline Storage" via schnellen Festplattenpools (mit Deduplizierung) oder Object-Storage in einer Private Cloud auf.
- **Kosten:** Ein redundantes Festplatten-Archiv ist teurer in Anschaffung und Stromverbrauch als ausgelagerte Tapes. Der Kunde zahlt hierbei die hohen Kosten für die ständige Verfügbarkeit / kurze Ladezeit.
- **Datensicherheit:** Die drei Standorte bieten Geo-Redundanz (falls ein RZ brennt, springt das andere ein). Durch WORM-Funktionen (Write Once Read Many) kann ungewollte Löschung bis zum Fristablauf (Ransomware-Schutz) verhindert werden.
- **Datenschutz:** Physische Sicherheit in professionellen RZs ist hoch. Da alle drei Rechenzentren in der Schweiz stehen, bleiben die Daten im Inland, was DSG-konform ist. Die gesamte Infrastruktur kann mandantenfähig und verschlüsselt umgesetzt werden.

---

### **Gütekriterien**

Der Lern- und Arbeitsauftrag ist erfüllt, wenn …

- [ ]  Sie für jedes Fallbeispiel eine Lösung zur Archivierung gefunden haben.
- [ ]  Sie die Lösung aus Sicht der Technik, Kosten, Datensicherheit und Datenschutz analysiert haben.
- [ ]  Sie den Exam.net-Test absolviert haben.

---

### **Zusätzliche Angaben zum Auftrag**

Keine

---

### **Mögliche Erweiterungsaufträge**

Keine

---

Ich hoffe, das hilft dir weiter! Wenn du noch Fragen hast oder weitere Unterstützung benötigst, lass es mich wissen. 😊

In Pages bearbeiten

Kopieren

KI-generierte Inhalte können fehlerhaft sein