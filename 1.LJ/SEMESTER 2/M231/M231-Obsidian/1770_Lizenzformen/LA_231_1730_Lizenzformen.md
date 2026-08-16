

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

## **Lern- und Arbeitsauftrag LA_231_1730_Lizenzformen.docx**

### **Metadaten**

|Eigenschaft|Inhalt|
|---|---|
|**Titel**|Lizenzformen von Software aus Sicht des Datenschutzes beurteilen können|
|**Modul**|231 Informatiker/in EFZ|
|**Autor/Version**|Davor Vukelic / V1.0|
|**Hilfsmittel**|• Notebook  <br>• Präsentation: 1770_Lizenzformen  <br>• Übersicht Lizenzen: Open-Source-Lizenzen und was ich damit machen darf (adesso.de)|
|**Nachweis**|Exam.net-Test (Einzelarbeit) mit 4 Fragen  <br>8 Punkte|
|**Sozialform**|Einzelarbeit / Partnerarbeit|
|**Leistungsziele**|LZ 6.1|

---

### **Ausgangslage**

Aus Sicht Datenschutz und Urheberrecht unterscheiden sich Software-Lizenzen stark. Nicht alle sind geeignet, um das Ziel zu erreichen.

---

## **Aufgabenstellung**

Analysieren Sie die beiden Fallbeispiele betreffend Eignung der Lizenz aus Sicht des Datenschutzes, der Datensicherheit, Lizenzeignung und bringen Sie Änderungsvorschläge an.

### **Teilaufgabe 1: Fallbeispiel UmSoft AG**

### Analyse (Datenschutz & Datensicherheit)

- **Kritischer Punkt 1 (Closed-Source Anonymisierung):** Die Anonymisierung der hochsensiblen Studentendaten (Erfolgsquoten, potenzielle Studienabbrecher fallen unter DSG/DSGVO) erfolgt über eine Closed-Source-Software. Da der Code nicht einsehbar ist, kann nicht unabhängig überprüft werden, ob die Anonymisierung _wirklich_ mathematisch sauber und irreversibel durchgeführt wird.
    
- **Kritischer Punkt 2 (Cloud-Anbieter & KI):** Die Weitergabe der Daten an einen Cloud-Anbieter zur KI-Analyse birgt massive Risiken. Wenn die Anonymisierung im Schritt davor fehlerhaft war, verlässt Personenbezug das Haus. Zudem muss geklärt sein, wo der Cloud-Anbieter sitzt (Stichwort: Drittstaatenübermittlung / US-Cloud-Act) und ob die KI mit den Daten "trainiert" wird.
    
- **Kritischer Punkt 3 (Backup-Cloud):** Auch hier gilt: Cloud-Backups von sensiblen Daten müssen zwingend **Client-Side-Encrypted (Zero-Knowledge)** sein, bevor sie die eigenen Server verlassen.
    
- **Kritischer Punkt 4 (GPLv2 & Code-Anpassung):** Die GPLv2 besitzt ein **starkes Copyleft**. Wenn die UmSoft AG die modifizierte Software an den Kunden (die Hochschule/Schule) _weitergibt_, gilt dies rechtlich als Vertrieb ("Distribution"). Das bedeutet: UmSoft **muss** dem Kunden den modifizierten Quellcode unter der GPLv2 offenlegen. Das ist für den Kunden gut, muss aber vertraglich so gewollt sein.
    
- **Kritischer Punkt 5 (Unbestimmte Programmbibliothek):** Da diese Bibliothek direkt mit der GPLv2-Software verknüpft wird, droht durch den "infektiösen" Charakter der GPLv2, dass auch diese neue Bibliothek unter der GPLv2 lizenziert werden muss (wenn sie statisch/dynamisch gelinkt wird und ein Derivat bildet).
    

### Änderungsvorschläge

1. **Anonymisierung:** Ersetzen der Closed-Source-Software durch eine bewährte, auditierte Open-Source-Lösung. Nur so ist die Korrektheit der Anonymisierung für Datenschützer nachvollziehbar.
    
2. **KI-Analyse:** Vorzugsweise eine datenschutzkonforme On-Premise-KI (z. B. ein lokales Open-Source LLM/Modell) auf den eigenen Servern betreiben, statt Daten an externe Cloud-KIs zu senden. Falls Cloud unumgänglich: Strenges AVV (Auftragsverarbeitungsvertrag) und Hosting in der Schweiz/EU erzwingen.
    
3. **Bibliothek-Lizenz:** Die neue Bibliothek direkt unter **GPLv2** (oder einer kompatiblen Lizenz wie der LGPLv3, falls sie separat gehalten werden soll) einplanen, um Lizenzkonflikte mit der Auswertungssoftware zu vermeiden.
### **Teilaufgabe 2: MixSoft GmbH**
### Analyse (Datenschutz & Datensicherheit)

- **Positiver Aspekt (Mattermost & Linux):** Die Wahl von Mattermost (Self-Hosted) auf Linux-Servern ist aus Sicht des Datenschutzes hervorragend. Die MixSoft GmbH behält die volle Datenhoheit (On-Premise), es fließen keine Chat-Protokolle unkontrolliert ab.
    
- **Kritischer Punkt 1 (Cloud-Backup):** Auch hier liegt das Risiko im Detail: Werden die Backups unverschlüsselt in die Cloud geladen, sind alle internen Firmen-Chats bei einem Datenleck beim Cloud-Anbieter einsehbar.
    
- **Kritischer Punkt 2 (MIT-Lizenz & LGPLv3 Modifikation):** Mattermost selbst nutzt die MIT-Lizenz (sehr permissiv, erlaubt fast alles). Die Integration der Windows-Benutzer soll über eine modifizierte **LGPLv3-Bibliothek** laufen. Die LGPLv3 hat ein **beschränktes Copyleft**. Wenn MixSoft diese Bibliothek modifiziert, müssen sie die Änderungen am Code der Bibliothek offenlegen, sobald sie die Software an die Partner verteilen. Wenn die Plattform aber nur rein intern als Service (SaaS-ähnlich für die Partner) bereitgestellt wird, greift das Copyleft bei der LGPL meist nicht (im Gegensatz zur AGPL).
    

### Änderungsvorschläge

1. **Backup-Verschlüsselung:** Es muss eine strikte, automatisierte Verschlüsselung (z.B. AES-256) der Backup-Dateien _vor_ dem Upload in die Cloud eingerichtet werden (Verschlüsselung "at rest" und "in transit"). Die Schlüssel dürfen nicht in der Cloud liegen.
    
2. **Lizenz-Konformität bei Partner-Anbindung:** Wenn die Windows-Partner die modifizierte LGPLv3-Bibliothek als Client-Komponente bei sich lokal installieren müssen, muss MixSoft den Quellcode dieser spezifischen Bibliotheks-Anpassungen den Partnern zur Verfügung stellen. Das sollte im Projektumfang direkt eingeplant werden. Liegt die Bibliothek nur auf dem eigenen Linux-Server, besteht kein Handlungsbedarf, es ist aber sauberer, die Änderungen intern zu dokumentieren.

---

### **Gütekriterien**

Der Lern- und Arbeitsauftrag ist erfüllt, wenn …

- [ ]  Sie die beiden Fallbeispiele unter den geforderten Gesichtspunkten analysiert haben.
- [ ]  Sie Veränderungen vorgeschlagen haben.
- [ ]  Sie die Lösung auf Moodle abgegeben haben.

---

### **Zusätzliche Angaben zum Auftrag**

Keine

---

### **Mögliche Erweiterungsaufträge**

Keine