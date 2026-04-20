
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

## **Lern- und Arbeitsauftrag LA_231_1712_Zugriffsschutz.docx**

### **Metadaten**

|Eigenschaft|Inhalt|
|---|---|
|**Titel**|Verschiedene Zugriffsschutz-Verfahren kennen|
|**Modul**|231 Informatiker/in EFZ|
|**Autor/Version**|Davor Vukelic / V1.0|
|**Hilfsmittel**|• Notebook  <br>• Präsentation: 1765_Zugriffsschutz|
|**Nachweis**|Exam.net (Einzelarbeit) mit 6 Fragen  <br>6 Punkte|
|**Sozialform**|Einzelarbeit / Partnerarbeit|
|**Leistungsziele**|LZ 2.7 (ExZ)|

---

### **Ausgangslage**

Es gibt verschiedene Formen von Zugriffsschutz auf Daten. Wissen, Besitz oder ein biometrisches Merkmal werden heute als Zugriffsverfahren eingesetzt. Nicht immer geregelt ist vor allem die Speicherung biometrischer Daten.

---

# Lern- und Arbeitsauftrag: Zugriffsschutz

| Titel | Modul | Autor/Version | Hilfsmittel | Nachweis | Sozialform | Leistungsziele |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Verschiedene Zugriffsschutz-Verfahren kennen | 231 Informatiker/in EFZ | Davor Vukelic / V1.0 | Notebook, Präsentation: 1765_Zugriffsschutz | Exam.net (Einzelarbeit) mit 6 Fragen | Einzelarbeit / Partnerarbeit | LZ 2.7 (ExZ) |

## Ausgangslage
Es gibt verschiedene Formen von Zugriffsschutz auf Daten. Wissen, Besitz oder ein biometrisches Merkmal werden heute als Zugriffsverfahren eingesetzt. Nicht immer geregelt ist vor allem die Speicherung biometrischer Daten.

## Aufgabenstellung

### Teilaufgabe 1: Arten von Zugriffen
Ermitteln Sie jeweils einen Vorteil und einen Nachteil zu folgenden Zugriffsverfahren.

| Verfahren | Vorteil | Nachteil |
| :--- | :--- | :--- |
| **Benutzername & Passwort** | Kostengünstig, einfach zu implementieren. | Passwort kann vergessen, erraten oder gestohlen werden. |
| **Mikrochip Implantat** | Kann nicht verloren gehen oder zu Hause vergessen werden. | Chirurgischer Eingriff nötig; ethische/datenschutzrechtliche Bedenken. |
| **Chipkarte und PIN** | Kombination aus Besitz und Wissen erhöht die Sicherheit. | Karte kann verloren gehen oder mechanisch beschädigt werden. |
| **Token mit OneTimePassword** | Hohe Sicherheit, da das Passwort nur einmalig gültig ist. | Zusätzliche Hardware (Token) muss mitgeführt werden. |
| **Token mit OTP und Chipkarte** | Sehr hohes Sicherheitsniveau (Mehrfaktor). | Hoher administrativer Aufwand und Kosten für Hardware. |
| **Fingerprint** | Einmalig, bequem, da kein Passwort gemerkt werden muss. | Sensoren können überlistet werden (Fälschung); Verletzung am Finger. |
| **Gesichtserkennung** | Berührungslos und schnell. | Probleme bei schlechtem Licht, Brillen oder Alterung; Datenschutz. |
| **Handvenenscanner** | Sehr sicher, da Venenmuster im Inneren der Hand liegen. | Teure Hardware; Akzeptanz der Nutzer teilweise gering. |
| **Iriserkennung** | Nahezu fälschungssicher und extrem genau. | Teure Kamerasysteme; wird von Nutzern oft als unangenehm empfunden. |
| **Spracherkennung** | Einfache Handhabung über bestehende Mikrofone. | Anfällig für Hintergrundgeräusche oder Aufnahmen (Replay-Attacke). |
| **Zero-Login (Verhaltensmuster)** | Höchster Benutzerkomfort (völlig transparent). | Erfordert konstante Überwachung des Nutzerverhaltens (Privatsphäre). |

---

### Teilaufgabe 2: Zweifaktorauthentisierung
In der Praxis werden zur Sicherheit Faktoren kombiniert. Beschreiben Sie für die aufgelisteten Zweifaktorauthentisierungen den Ablauf und mögliche Schwachstellen.

| Verfahren | Ablauf | Schwachstelle |
| :--- | :--- | :--- |
| **Username/Passwort + Smartphone (SMS/App)** | Login mit Passwort, dann Eingabe eines per SMS/Push empfangenen Codes. | Smartphone-Diebstahl, SIM-Swapping oder kein Netzempfang. |
| **Username/Passwort + Token** | Login mit Passwort, dann Eingabe des vom Hardware-Token generierten Codes. | Verlust des Tokens; Synchronisationsfehler zwischen Token und Server. |
| **Username/Passwort + Kartenlesegerät** | Passwort-Login, dann Karte in Leser stecken und ggf. Challenge-Response. | Hardwareabhängigkeit; Karte oder Leser können verloren gehen. |
| **Username/Passwort + Liste (TAN)** | Login mit Passwort, dann Eingabe einer spezifischen Nummer von einer Papierliste. | Liste kann fotografiert/kopiert werden; unpraktisch für unterwegs. |
| **Username/Passwort + ZeroLogin** | Login mit Passwort; System prüft im Hintergrund Standort/Tippverhalten. | Fehlalarm bei ungewöhnlichem Verhalten (z.B. Verletzung der Hand). |
| **Chipkarte und Iriserkennung** | Karte stecken zur Identifikation, dann Scan des Auges zur Verifikation. | Hohe Kosten für Lesegeräte; Sensorverschmutzung. |
| **Chipkarte und Stimmerkennung** | Identifikation per Karte, Bestätigung durch Sprechen einer Phrase. | Umgebungsgeräusche verhindern Erkennung; Erkältung verändert Stimme. |

---

## Gütekriterien
* Die Vor- und Nachteile von Authentisierungsarten wurden beschrieben.
* Der Ablauf verschiedener 2FA wurde erläutert.
* Vergleich mit der Musterlösung (nach Erhalt).
* Absolvierung des Moodletests.