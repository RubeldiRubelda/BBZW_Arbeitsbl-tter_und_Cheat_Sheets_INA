
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

## **Lern- und Arbeitsauftrag LA_231_1717_Datenspeicher_Verfuegbarkeit.docx**

### **Metadaten**

|Eigenschaft|Inhalt|
|---|---|
|**Titel**|Die Verfügbarkeit, Datensicherheit und Datenschutz von Datenspeichern einschätzen können|
|**Modul**|231 Informatiker/in EFZ|
|**Autor/Version**|Davor Vukelic / V1.0|
|**Hilfsmittel**|• Notebook  <br>• Präsentation: 1767_Datenspeicher  <br>• Angebot Speicher Amazon S3: Objektspeicherklassen – Amazon S3|
|**Nachweis**|Exam.net-Test (Einzelarbeit) mit 3 Fragen  <br>3 Punkte|
|**Sozialform**|Einzelarbeit / Partnerarbeit|
|**Leistungsziele**|LZ 3.3 (ExZ)|

---

### **Ausgangslage**

Datenspeicher unterscheiden sich betreffend Sicherheit, Verfügbarkeit und den Möglichkeiten des Datenschutzes. Als Informatik-Fachpersonen können Sie bekannte Datenspeicher hinsichtlich dieser 3 Faktoren beurteilen.

---

# Analyse von Datenspeicher-Eigenschaften

## Teilaufgabe 1: Einschätzung der Datenspeicher

| Datenspeicher | Verfügbarkeit | Datensicherheit | Datenschutz |
| :--- | :--- | :--- | :--- |
| **Externe HDD/SSD** | Muss erst angeschlossen werden; nicht immer sofort vor Ort. | Risiko von Diebstahl oder Defekt; keine Redundanz ohne manuelles Backup. | Hoch, da offline; Kontrolle liegt beim Nutzer (Verschlüsselung empfohlen). |
| **DVD** | Physischer Zugriff nötig; langsame Lesegeschwindigkeit. | Schutz vor Ransomware (Read-only); Risiko durch Kratzer oder Alterung. | Sehr hoch, da kein Netzwerkzugriff möglich ist. |
| **NAS** | Hoch im lokalen Netzwerk; Fernzugriff oft möglich. | Gut durch RAID-Konfiguration; Risiko durch Hardware-Defekte oder Ransomware. | Hoch, da Datenhoheit im eigenen Haus liegt; sicherer Fernzugriff nötig. |
| **SAN** | Permanent verfügbar für Server; extrem hohe Performance. | Sehr hoch durch Redundanz und professionelles Management. | Hoch, da meist im isolierten Unternehmensnetzwerk betrieben. |
| **Tape** | Sehr gering (muss aus Archiv geholt und eingelegt werden). | Höchste Sicherheit gegen Cyberangriffe (Air Gap); physisch robust. | Sehr hoch; ideal für revisionssichere Langzeitarchivierung. |
| **Cloud** | Überall mit Internetverbindung sofort verfügbar. | Hoch beim Anbieter (Redundanz), aber Risiko durch Account-Hacking. | Problematisch (Drittanbieter); Standort des Rechenzentrums ist entscheidend. |

---

## Teilaufgabe 2: Datenspeicher in der Cloud (Beispiel Amazon S3)

| Speichertyp | Verfügbarkeit (SLA) | Art der Daten | Datensicherheit (Haltbarkeit) |
| :--- | :--- | :--- | :--- |
| **S3 Standard** | **99,99 %** | Häufig genutzte Daten (Active Storage), Webseiten-Content. | 99,999999999 % (11 Neuner) durch Speicherung in mind. 3 Zonen. |
| **S3 Standard-IA** (Infrequent Access) | **99,9 %** | Langzeitdaten, die selten, aber bei Bedarf sofort nötig sind (z. B. Backups). | Identisch hoch (11 Neuner); Daten über mehrere Verfügbarkeitszonen verteilt. |
| **S3 Glacier Flexible Retrieval** | **99,9 %** (nach Abrufzeit) | Archivdaten (Cold Storage); Abruf dauert Minuten bis Stunden. | Extrem hoch; Schutz durch physische Trennung und Verschlüsselung. |
---

### **Gütekriterien**

Der Lern- und Arbeitsauftrag ist erfüllt, wenn …

- [ ]  Sie die Speicherarten hinsichtlich Verfügbarkeit, Datensicherheit und Datenschutz eingeschätzt haben.
- [ ]  Sie 3 Cloud-Speicher-Arten hinsichtlich Verfügbarkeit, Art der Daten und Datensicherheit eingeschätzt haben.
- [ ]  Sie die eigene Lösung mit der Musterlösung verglichen haben.
- [ ]  Sie den Exam.net-Test absolviert haben.

---

### **Zusätzliche Angaben zum Auftrag**

Keine

---

### **Mögliche Erweiterungsaufträge**

Keine