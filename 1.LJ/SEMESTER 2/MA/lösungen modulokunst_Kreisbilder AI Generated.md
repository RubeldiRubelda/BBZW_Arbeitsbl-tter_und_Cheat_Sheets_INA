# Modulokunst mit Kreisbildern

## 1. Anleitung: Grundaufbau in GeoGebra

Öffne GeoGebra im Browser: [https://www.geogebra.org/classic](https://www.geogebra.org/classic)

1.  Klicke oben rechts auf **Menü (☰)** -> **Perspektiven** -> **Grafikrechner**.
2.  Gib nacheinander folgende Befehle in die Eingabezeile ein:
    * `n = 24`
    * `k = 2`
    * `r = 1`
    * *Rechtsklick auf n, k und r -> Schieberegler anzeigen.*
3.  **Kreis erstellen:** `Circle((0,0), r)`
4.  **Punkte auf dem Kreis:** `points = Sequence((r*cos(2*pi*j/n), r*sin(2*pi*j/n)), j, 0, n - 1)`
5.  **Verbindungen (Muster):** `segments = Sequence(Segment(Element(points, j + 1), Element(points, Mod(k*j, n) + 1)), j, 0, n - 1)`

---

## 2. Aufgaben und Lösungen

### Aufgabe 1
Setze **n = 24**. Teste verschiedene Werte für **k**: 2, 3, 4, 5, 6, 7, 8.
Beschreibe: Welche Muster entstehen? Was fällt dir auf?

**Lösung:**
* Bei **k = 2** entsteht eine Herzform im Inneren (mathematisch: eine Kardioide).
* Bei **k = 3** sieht man zwei "Blätter" oder Ausbuchtungen (Nephroide).
* Bei **k = 5** Rechtecke.
* Bei **k = 7** Ein Sechseck.
* Bei **k = 8** Aufteilung in mehrere gleiche Teile.
* Bei steigendem **k** entstehen immer mehr Spitzen im Zentrum. Die Anzahl der Spitzen oder "Blätter" entspricht dabei in der Regel dem Wert $k - 1$.
* **Beobachtung:** Die Linien berühren im Inneren eine unsichtbare Kurve (Hüllkurve), die die geometrische Form definiert.



---

### Aufgabe 2
Verändere **n**. Teste: n = 20, 24, 30, 31.
Beschreibe: Wann wirkt das Muster gleichmäßig? Wann entstehen Teilmuster?

**Lösung:**
* **Gleichmäßigkeit:** Das Muster wirkt bei **n = 31** sehr gleichmäßig und fein gewebt. Da 31 eine Primzahl ist, gibt es keine einfachen Teilerverhältnisse, die das Muster frühzeitig abbrechen lassen.
* **Teilmuster:** Bei Zahlen wie **n = 20, 24 oder 30** entstehen oft klare Teilmuster (z. B. Quadrate oder Sterne innerhalb des Kreises). Das liegt daran, dass diese Zahlen viele Teiler haben. Wenn $n$ durch $k$ teilbar ist, "springt" die Verbindung oft zu den gleichen Punkten zurück.

---

### Aufgabe 3
Finde selbst Beispiele für:
* Ein schönes Muster: **n = 200, k = 2** (Sehr feine Herzform)
* Ein sehr symmetrisches Muster: **n = 60, k = 31** (Dichter Stern)
* Ein ungewöhnliches Muster: **n = 127, k = 50** (Komplexes Geflecht)

---

### Zusatz (schwieriger)
Was passiert, wenn $n$ und $k$ einen gemeinsamen Teiler haben? Was, wenn sie teilerfremd sind?

**Vermutung:**
* Haben $n$ und $k$ einen **gemeinsamen Teiler**, werden nicht alle Punkte auf dem Kreis "genutzt" oder es entstehen mehrere getrennte, geschlossene Figuren.
* Sind $n$ und $k$ **teilerfremd** (ggT = 1), ist das Muster oft zusammenhängender und "füllt" den Kreis optisch besser aus, da die Linien mehr Punkte anlaufen, bevor sie sich wiederholen.

---

## 3. Hintergrundwissen

### Was bedeutet „mod“?
Es steht für den Rest einer Division. 
*Beispiel:* `7 mod 5 = 2` (7 geteilt durch 5 ist 1, Rest **2**).
Im Kreis bedeutet das: Wenn ein Punkt über die Nummer $n$ hinausgeht, fängt er wieder bei 0 an zu zählen.



### Abschlussfrage: Was verändert das Muster stärker?
**Antwort:** Eindeutig **k**. 
Während **n** lediglich die "Auflösung" (die Feinheit) des Bildes bestimmt, entscheidet die Rechenregel **k** über die grundlegende Form. Ändert man $k$ nur um den Wert 1, verwandelt sich das komplette Bild (z. B. von einer Herzform zu einer Kleeblattform).
