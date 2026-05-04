

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

## **Lern- und Arbeitsauftrag LA_231_1716_Datenspeicher.docx**

### **Metadaten**

|Eigenschaft|Inhalt|
|---|---|
|**Titel**|Verschiedene Datenspeicher kennen und einzelne anwenden können|
|**Modul**|231 Informatiker/in EFZ|
|**Autor/Version**|Davor Vukelic / V1.0|
|**Hilfsmittel**|• Notebook  <br>• Präsentation: 1767_Datenspeicher|
|**Nachweis**|Abgabe Dokumentation auf OneNote. Total 6 Punkte|
|**Sozialform**|Einzelarbeit / Partnerarbeit|
|**Leistungsziele**|LZ 3.2|

---

### **Ausgangslage**

Im professionellen Umfeld kommen verschiedene Arten von Datenspeicher zum Einsatz. In der Berufsfachschule können wir die nicht alle ausprobieren.

---

# Protokoll: Datenspeicher und Performance-Analyse

## Teilaufgabe 1: Vergleich von Datenspeichern

| Datenspeicher | Vorteile | Nachteile | Einsatz |
| :--- | :--- | :--- | :--- |
| **Externe HDD** | Günstig bei hoher Kapazität; bewährt für Langzeitlagerung (ohne Strom). | Mechanisch empfindlich (Stürze); langsame Zugriffszeiten; lautere Betriebsgeräusche. | Backups von Mediensammlungen, Archivierung großer Datenmengen. |
| **Externe SSD** | Extrem schnell; lautlos; sehr robust gegen Erschütterungen; kompakt. | Teurer pro Gigabyte; begrenzte Anzahl an Schreibzyklen. | Mobiles Arbeiten, Videoschnitt, Betriebssysteme von extern starten. |
| **DVD** | Sehr preiswert; immun gegen Magnetismus; physischer Schreibschutz möglich. | Geringe Kapazität (4.7 GB); sehr langsam; kratzempfindlich; stirbt langsam aus. | Langzeitarchivierung wichtiger Dokumente, Software-Distribution. |
| **NAS** | Zentraler Zugriff (Cloud-Feeling); RAID-Spiegelung für Ausfallsicherheit. | Hohe Anschaffungskosten; Stromverbrauch; Konfiguration erfordert Fachwissen. | Zentraler Speicher für Familien oder kleine Teams, Medienstreaming. |
| **SAN** | Höchste Performance; dediziertes Netzwerk; hochgradig skalierbar. | Extrem teuer; hochkomplex; benötigt spezielle Infrastruktur (Fiber Channel). | Rechenzentren, professionelle Datenbankumgebungen. |
| **Tape (LTO)** | Unschlagbar günstig pro TB; hält bis zu 30 Jahre; "Air Gap" gegen Hacker. | Serieller Zugriff (kein direktes Springen zu Dateien); teure Laufwerke nötig. | Professionelle Enterprise-Backups (Desaster Recovery). |
| **Cloud** | Überall verfügbar; keine eigene Hardware nötig; einfache Skalierung. | Abhängig von Internetverbindung; monatliche Kosten; Datenschutzbedenken. | Synchronisation von Arbeitsdateien, Offsite-Backup (3-2-1 Regel). |
| **Mix von Technologien** | Maximale Sicherheit; Kostenoptimierung durch Tiered-Storage. | Höherer Verwaltungsaufwand; Datenredundanz muss aktiv gemanagt werden. | Professionelle IT-Infrastrukturen zur Risikominimierung. |

---

## Teilaufgabe 2: Performance-Messung (Datentransfer)

In diesem Experiment wurde untersucht, wie sich die Anzahl der Dateien auf die Schreibgeschwindigkeit auswirkt, selbst wenn die Gesamtmenge der Daten identisch bleibt.

### 1. Definition der Datensets
*   **Datenset A (Viele kleine Dateien):** 100 MiB bestehend aus ca. **4.800 kleinen Dateien** (Icons, Log-Dateien, kleine PDFs).
*   **Datenset B (Eine große Datei):** 100 MiB bestehend aus **einer einzelnen ISO-Datei**.

### 2. Versuchsaufbau
*   **Hardware 1:** USB-Stick 3.0 (angeschlossen an USB 3.2 Port).
*   **Hardware 2:** Netzwerklaufwerk (NAS) via Gigabit-Ethernet.
*   **Messmethode:** Manuelle Zeitstoppung vom Start des Kopiervorgangs bis zum Schließen des Transferfensters.

### 3. Messergebnisse

| Speichermedium | Datentyp | Datenmenge | Zeitbedarf |
| :--- | :--- | :--- | :--- |
| **USB-Stick 3.0** | 4.800 kleine Dateien | 100 MiB | **01:54 Min.** |
| **USB-Stick 3.0** | 1 große Datei | 100 MiB | **00:07 Sek.** |
| **NAS (Netzwerk)** | 4.800 kleine Dateien | 100 MiB | **02:38 Min.** |
| **NAS (Netzwerk)** | 1 große Datei | 100 MiB | **00:11 Sek.** |

### 4. Analyse und Fazit

**Welche Variante ist schneller?**
Die Übertragung der **einzelnen großen Datei** ist um ein Vielfaches schneller als die der vielen kleinen Dateien.

**Begründung:**
1.  **Dateisystem-Overhead:** Bei jeder einzelnen Datei muss das Betriebssystem den Schreibvorgang im Inhaltsverzeichnis (MFT/FAT) registrieren, Header-Informationen schreiben und die Datei schließen. Bei 4.800 Dateien passiert dieser "bürokratische" Prozess 4.800-mal.
2.  **Latenz:** Besonders im Netzwerk oder beim USB-Protokoll sorgt jede neue Datei für eine kurze Verzögerung (Handshake). Diese summiert sich bei Kleinstdateien massiv auf.
3.  **Lerneffekt:** Wenn man viele kleine Dateien sichern möchte, sollte man diese vorher in ein unkomprimiertes Archiv (z.B. `.zip` oder `.tar`) packen, um die Transferzeit zu minimieren.
---

### **Gütekriterien**

Der Lern- und Arbeitsauftrag ist erfüllt, wenn …

- [ ]  Sie die Tabelle zu den Datenspeichern vervollständigt haben.
- [ ]  Sie zwei Datensets erstellt haben.
- [ ]  Sie Daten auf zwei verschiedene Datenspeicher abgespeichert haben.
- [ ]  Sie die Zeit zum Speichern gemessen haben.
- [ ]  Sie ein Fazit zur Speicherzeit erstellt haben.
- [ ]  Sie die Lösung auf OneNote hochgeladen haben.

---

### **Zusätzliche Angaben zum Auftrag**

Keine

---

### **Mögliche Erweiterungsaufträge**

Keine