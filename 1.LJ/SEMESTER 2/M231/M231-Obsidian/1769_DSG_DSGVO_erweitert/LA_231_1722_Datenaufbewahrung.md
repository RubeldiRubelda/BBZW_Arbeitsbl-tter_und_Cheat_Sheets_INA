

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

## **Lern- und Arbeitsauftrag LA_231_1722_Datenaufbewahrung.docx**

### **Metadaten**

| Eigenschaft        | Inhalt                                                                                                   |
| ------------------ | -------------------------------------------------------------------------------------------------------- |
| **Titel**          | Wissen, wie lange Daten in der Schweiz und der EU aufbewahrt werden müssen bzw. aufbewahrt werden dürfen |
| **Modul**          | 231 Informatiker/in EFZ                                                                                  |
| **Autor/Version**  | Davor Vukelic / V1.0                                                                                     |
| **Hilfsmittel**    | • Notebook  <br>• Präsentation: 1769_DSG_DSGVO_erweitert  <br>• Evtl. DSG und DSGVO                      |
| **Nachweis**       | Exam.net-Test (Einzelarbeit) mit 3 Fragen  <br>3 Punkte                                                  |
| **Sozialform**     | Einzelarbeit / Partnerarbeit                                                                             |
| **Leistungsziele** | LZ 5.1                                                                                                   |

---

### **Ausgangslage**

Die Aufbewahrung von Daten orientiert sich an wenigen Indikatoren. Sind es personenbezogene Daten? Werden die Daten noch benötigt? Gibt es eine gesetzliche Aufbewahrungsfrist?

---

## **Aufgabenstellung**

### **Teilaufgabe 1: Grundsätze**

Listen Sie hier mit Hilfe der Präsentation und evtl. anderen Quellen die Grundsätze der Aufbewahrung von personenbezogenen Daten noch einmal auf.

**Lösung:**
1. **Zweckbindung und Verhältnismässigkeit:** Personenbezogene Daten dürfen nur so lange aufbewahrt werden, wie es der Zweck, für den sie ursprünglich erhoben wurden, zwingend erfordert (Art. 6 DSG / Art. 5 DSGVO).
2. **Gesetzliche Aufbewahrungsfristen (Legalitätsprinzip):** Wenn Gesetze eine Aufbewahrung vorschreiben (z.B. 10 Jahre für Buchhaltungsbelege nach Schweizer OR, 20 Jahre für Immobilien-MWST), gehen diese Fristen dem Löschanspruch vor.
3. **Speicherbegrenzung:** Es dürfen keine personenbezogenen Daten «auf Vorrat» gespeichert werden, für die kein aktueller Zweck oder keine rechtliche Grundlage mehr besteht. 
4. **Vernichtung/Anonymisierung:** Fällt der Aufbewahrungszweck weg und bestehen keine gesetzlichen Fristen mehr, müssen die Daten unwiderruflich gelöscht oder effektiv anonymisiert werden.

### **Teilaufgabe 2: Kleine Fallbeispiele**

Beurteilen Sie die kleinen Fallbeispiele, ob die Daten aufbewahrt werden müssen/dürfen oder nicht.

**Lösungen:**

1. Die Firma Klein GmbH bewahrt die Bewerbungsunterlagen für die Lehrstellen immer auf, damit sie im Folgejahr nachsehen kann, ob sich diese Person bereits einmal beworben hat.
   **Beurteilung: Nicht erlaubt.** Nach Ablehnung/Abschluss des Bewerbungsverfahrens fällt der Zweck weg. Die Unterlagen müssen gelöscht werden, ausser der Bewerber hat explizit der längeren Aufbewahrung in einem "Bewerberpool" zugestimmt.

2. Die Firma Glücklich AG hat auf ihrer Webseite zum Firmenjubiläum eine Verlosung organisiert. Kunden konnten sich mit E-Mail und Name registrieren, und dann wurden 3 glückliche Gewinner*innen ausgelost. Das Gewinnspiel ist vorbei.
   **Beurteilung: Nicht erlaubt.** Mit dem Abschluss des Gewinnspiels entfällt der Zweck. Die Daten (vor allem der Nicht-Gewinner) müssen sofort gelöscht werden. 

3. Die Firma Gross AG hat den Jahresabschluss mit allen buchhalterischen Prozessen abgeschlossen.
   **Beurteilung: Muss aufbewahrt werden.** Nach Schweizer Obligationenrecht (OR) müssen Geschäftsbücher und Buchungsbelege für 10 Jahre aufbewahrt werden.

4. Die Firma Testlich GmbH bietet PCR-Tests an. Die Daten werden nach Bekanntgabe der Testresultate pseudonymisiert archiviert.
   **Beurteilung: Nicht erlaubt.** Gesundheitsdaten sind besonders schützenswert. Pseudonymisierte Daten erlauben über einen Schlüssel immer noch eine Personenidentifikation. Wenn es keinen rechtfertigenden Zweck (z.B. gesetzliche Gesundheitspflicht) mehr gibt, müssen die Daten nach Testabschluss vollständig anonymisiert oder vernichtet werden.

5. Die Firma Zeitlich AG löscht alle personenbezogenen Daten zu den Mitarbeitenden 5 Jahre nach Austritt aus der Firma.
   **Beurteilung: Unzulässig (zu kurze Aufbewahrung).** Nach OR beträgt die allgemeine Verjährungsfrist für arbeitsrechtliche Ansprüche 10 Jahre. Arbeitsverträge und Lohnabrechnungen müssen/dürfen daher 10 Jahre aufbewahrt werden.

6. Die Schule MeineSchule bewahrt Zeugnisnoten der SchülerInnen unbeschränkt auf.
   **Beurteilung: In der Regel erlaubt/gefordert.** Öffentliche Schulen unterliegen meist kantonalen Archivgesetzen (öffentliches Interesse), bei denen z.T. Fristen von 50 Jahren oder eine unbeschränkte kantonalrechtliche Archivierung vorgesehen sind.

7. Die Firma TipTop GmbH vernichtet die Personaldossiers 10 Jahre nach Austritt der Mitarbeitenden aus der Firma.
   **Beurteilung: Erlaubt und korrekt.** Dies entspricht der 10-jährigen Aufbewahrungspflicht / Verjährungsfrist gemäss Regelungen im OR.

8. Der OnlineShop MySuperShop.ch speichert die Daten über seine Kunden auch dann, wenn der Kunde die Löschung des Kontos veranlasst hat.
   **Beurteilung: Teils müssen, teils nicht erlaubt.** Bestell- und Rechnungsdaten MÜSSEN aus buchhalterischen Gründen 10 Jahre aufbewahrt werden (gesetzliche Pflicht überwiegt Löschwunsch). Andere Daten (wie Werbeprofile, Passwörter, reine Account-Informationen) MÜSSEN jedoch wunschgemäss gelöscht werden.

9. Die Immobilienfirma MeineWohnung GmbH bewahrt die Mehrwertsteuerberechnung der Mietwohnungen für 20 Jahre auf.
   **Beurteilung: Erlaubt und vorgeschrieben.** Bei unbeweglichen Gegenständen (Immobilien) gilt nach Schweizer MWST-Gesetz eine Aufbewahrungsfrist von 20 Jahren.

10. Das Restaurant IssGut organisiert ein Essen für eine Heirat. Sie erhält vom Brautpaar eine Gästeliste. Diese wird im Ordner «Events» abgelegt.
    **Beurteilung: Nicht erlaubt.** Die Gästeliste (Personaldaten der Hochzeitsgäste) erfüllt hier einen einmaligen Zweck für die Platzierung/Planung. Ohne ausdrückliche Einwilligung des Brautpaares muss sie nach dem Anlass gelöscht werden.

---

### **Gütekriterien**

Der Lern- und Arbeitsauftrag ist erfüllt, wenn …

- [ ]  Sie in eigenen Worten die Grundsätze der Aufbewahrung formuliert haben.
- [ ]  Sie die Fallbeispiele beurteilt haben.
- [ ]  Sie den Exam.net-Test absolviert haben.

---

### **Zusätzliche Angaben zum Auftrag**

Keine

---

### **Mögliche Erweiterungsaufträge**

Keine