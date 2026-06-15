# Lern- und Arbeitsauftrag LA_231_1730_Lizenzformen

## Metadaten

| Eigenschaft | Inhalt |
|---|---|
| **Titel** | Lizenzformen von Software aus Sicht des Datenschutzes beurteilen können |
| **Modul** | 231 Informatiker/in EFZ |
| **Autor/Version** | Davor Vukelic / V1.0 |
| **Hilfsmittel** | • Notebook<br>• Präsentation: 1770_Lizenzformen<br>• Übersicht Lizenzen: Open-Source-Lizenzen und was ich damit machen darf (adesso.de) |
| **Nachweis** | Exam.net-Test (Einzelarbeit) mit 4 Fragen – 8 Punkte |
| **Sozialform** | Einzelarbeit / Partnerarbeit |
| **Leistungsziele** | LZ 6.1 |

---

## Ausgangslage

Aus Sicht Datenschutz und Urheberrecht unterscheiden sich Software-Lizenzen stark. Nicht alle sind geeignet, um das Ziel zu erreichen.

---

## Aufgabenstellung

Analysieren Sie die beiden Fallbeispiele betreffend Eignung der Lizenz aus Sicht des Datenschutzes, der Datensicherheit, Lizenzeignung und bringen Sie Änderungsvorschläge an.

---

### Teilaufgabe 1: Fallbeispiel UmSoft AG

**Ausgangssituation:**
Die UmSoft AG muss für einen Kunden eine neue Plattform für die Analyse von Leistungen von Studenten_innen erstellen. Damit soll in Zukunft die Erfolgsquote von Studierenden errechnet werden. Damit können potenzielle Studienabbrecher_innen frühzeitig erkannt werden.

**Vorgesehene Komponenten:**
- Plattform auf der Basis von Linux
- Anonymisierungssoftware als Closed-Source Lösung
- Cloudanbieter für KI-Analysen
- Weiterer Cloudanbieter für Archivierung und Backup
- Auswertungssoftware unter GPLv2 (mit Codeanpassungen nötig)
- Zusätzlich zu programmierende Programmbibliothek (Lizenz noch offen)

#### Analyse

| Komponente | Lizenz / Modell | Datenschutz | Datensicherheit | Lizenzeignung | Änderungsvorschlag |
|---|---|---|---|---|---|
| **Plattform (Linux)** | Open Source (z. B. GPL) | ✅ Quellcode einsehbar, keine versteckten Datenweitergaben | ✅ Sicherheitslücken durch Community schnell erkannt | ✅ Geeignet | Keine Änderung nötig |
| **Anonymisierungssoftware (Closed Source)** | Proprietär | ⚠️ Quellcode nicht einsehbar – unklar, ob Daten weitergegeben werden | ⚠️ Sicherheitslücken nicht selbst prüfbar | ❌ Kritisch bei Personendaten | Wechsel zu einer Open-Source-Lösung (z. B. ARX) – Quellcode muss bei Personendaten prüfbar sein |
| **Cloud-KI für Analysen** | SaaS / extern | ❌ Personendaten verlassen die eigene Infrastruktur | ❌ Datentransfer ins Ausland möglich – DSG/DSGVO-Risiko | ⚠️ Nur wenn Daten vollständig anonymisiert sind | Sicherstellen, dass Daten vor dem Transfer vollständig de-identifiziert sind; Datenverarbeitungsvertrag (DPA) abschliessen |
| **Backup-Cloud** | SaaS / extern | ⚠️ Speicherort unklar – evtl. Drittland | ⚠️ Abhängigkeit vom Anbieter | ⚠️ Nur mit Vertrag geeignet | Schweizer oder EU-Anbieter wählen; Verschlüsselung vor dem Upload sicherstellen |
| **Auswertungssoftware (GPLv2)** | Open Source (Copyleft) | ✅ Quellcode einsehbar | ✅ Transparente Sicherheitsstruktur | ⚠️ Anpassungen am Code müssen unter GPLv2 veröffentlicht werden | Wenn Code geheim bleiben soll: Alternative mit permissiver Lizenz prüfen |
| **Programmbibliothek (Lizenz offen)** | Noch nicht bestimmt | – | – | – | Kompatible Lizenz zu GPLv2 wählen (z. B. LGPLv2.1 oder GPLv2), um Lizenzkonflikte zu vermeiden |

#### Fazit UmSoft AG

Das grösste Risiko liegt bei der **Closed-Source-Anonymisierungssoftware** und der **externen Cloud-KI**. Bei Personendaten von Studierenden gelten strenge DSG/DSGVO-Anforderungen. Closed-Source-Lösungen sind für sicherheitskritische Verarbeitung ungeeignet, da keine Prüfbarkeit besteht. Der Einsatz von Cloud-Diensten erfordert zwingend Datenverarbeitungsverträge und sollte auf Anbieter im DSGVO-Raum beschränkt werden.

---

### Teilaufgabe 2: Fallbeispiel MixSoft GmbH

**Ausgangssituation:**
Die MixSoft GmbH installiert für sich eine neue Collaborations-Plattform. Die Wahl ist auf Mattermost gefallen (MIT-Lizenz), betrieben auf eigenem Server mit Linux. Backup wird in eine Cloud gespeichert. Eine bestehende Programmbibliothek unter LGPLv3 muss für die Integration von Windows-Server-Umgebungen der Partner angepasst werden.

#### Analyse

| Komponente | Lizenz / Modell | Datenschutz | Datensicherheit | Lizenzeignung | Änderungsvorschlag |
|---|---|---|---|---|---|
| **Mattermost** | MIT-Lizenz | ✅ Self-Hosted: Daten bleiben im eigenen Haus | ✅ Quellcode offen und prüfbar | ✅ MIT ist sehr permissiv – geeignet | Keine Änderung nötig |
| **Linux (Betriebssystem)** | Open Source | ✅ Transparent und sicher | ✅ Aktiv gepflegt | ✅ Geeignet | Keine Änderung nötig |
| **Backup in Cloud** | SaaS / extern | ⚠️ Kommunikationsdaten verlassen die eigene Infrastruktur | ⚠️ Abhängigkeit vom Cloud-Anbieter | ⚠️ Nur mit Vertrag geeignet | Daten vor dem Upload Ende-zu-Ende verschlüsseln; Schweizer oder EU-Anbieter bevorzugen |
| **Programmbibliothek (LGPLv3) anpassen** | LGPL v3 | ✅ Quellcode einsehbar | ✅ Sicherheitsprüfung möglich | ⚠️ Anpassungen an der Bibliothek müssen unter LGPLv3 bleiben | Angepassten Bibliothekscode unter LGPLv3 veröffentlichen; MIT-Hauptprojekt bleibt davon unberührt |

#### Fazit MixSoft GmbH

Die Wahl von **Mattermost (MIT) auf eigenem Server mit Linux** ist aus Datenschutzsicht sehr gut – Daten verbleiben in der eigenen Infrastruktur. Das **Cloud-Backup** ist der kritischste Punkt: verschlüsselt übertragen und ein vertrauenswürdiger Anbieter im DSGVO-Raum ist Pflicht. Die Anpassung der **LGPLv3-Bibliothek** ist lizenzrechtlich unproblematisch, solange die Änderungen am Bibliothekscode offengelegt werden; das Hauptprogramm muss nicht unter LGPL stehen.

---

## Gütekriterien

Der Lern- und Arbeitsauftrag ist erfüllt, wenn …

- [x] Sie die beiden Fallbeispiele unter den geforderten Gesichtspunkten analysiert haben.
- [x] Sie Veränderungen vorgeschlagen haben.
- [ ] Sie die Lösung auf Moodle abgegeben haben.

---

## Zusätzliche Angaben zum Auftrag

Keine

---

## Mögliche Erweiterungsaufträge

Keine
