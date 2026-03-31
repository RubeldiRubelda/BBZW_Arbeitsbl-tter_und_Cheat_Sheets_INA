### Aufgaben vom 31.03.2026


# Modulokunst mit Kreisbildern

Öffne GeoGebra im Browser:
[https://www.geogebra.org/classic](https://www.geogebra.org/classic)

## Ziel

Du erzeugst mathematische Muster auf einem Kreis und untersuchst, wie sich diese verändern.

## GeoGebra richtig einstellen

Damit du arbeiten kannst, brauchst du 2 Bereiche:

- rechts: das Koordinatensystem (Grafik)
- links: Eingabezeile mit Liste oben

### So stellst du das ein

1. Klicke oben rechts auf **Menü (☰)**
2. Klicke auf **Perspektiven**
3. Wähle **Grafikrechner**

## Schritt 1: Grundaufbau in GeoGebra

Gib die folgenden Befehle **der Reihe nach** ein:

```geogebra
n = 24
```

```geogebra
k = 2
```

```geogebra
r = 1
```

Danach:

* für  n , k und r jeweils Schieberegler anzeigen (Rechtsklick auf z.B. n)

## Schritt 2: Kreis erstellen

```geogebra
Circle((0,0), r)
```

## Schritt 3: Punkte auf dem Kreis

```geogebra
points = Sequence(
  (r*cos(2*pi*j/n), r*sin(2*pi*j/n)),
  j, 0, n - 1
)
```

## Schritt 4: Verbindungen (Muster)

```geogebra
segments = Sequence(
  Segment(
    Element(points, j + 1),
    Element(points, Mod(k*j, n) + 1)
  ),
  j, 0, n - 1
)
```

# Experimentieren

Verändere die Regler:

* *r ziehen → Kreis wächst / schrumpft*
* *n ändern → Anzahl Punkte*
* *k ändern → Muster verändert sich*

# Aufgaben

## Aufgabe 1

Setze:

* n = 24

Teste verschiedene Werte für k:

* k = 2, 3, 4, 5, 6, 7, 8

Beschreibe:

* Welche Muster entstehen?
* Was fällt dir auf?

## Aufgabe 2

Verändere n:

Teste:

* n = 20
* n = 24
* n = 30
* n = 31

Beschreibe:

* Wann wirkt das Muster gleichmässig?
* Wann entstehen Teilmuster?

## Aufgabe 3

Finde selbst Beispiele für:

* ein schönes Muster
* ein sehr symmetrisches Muster
* ein ungewöhnliches Muster

Notiere:

* n = ______
* k = ______

## Zusatz (schwieriger)

Was passiert, wenn:

* n und k einen gemeinsamen Teiler haben?
* n und k teilerfremd sind?

Vermutung:

---

---

# Erklärung

## Was bedeutet „mod“?

Beispiel:

```
7 mod 5 = 2
```

Wir teilen 7 durch 5 und nehmen den Rest.

## Was passiert im Bild?

* Du hast n Punkte auf einem Kreis
* Jeder Punkt bekommt eine Nummer:
  0, 1, 2, 3, ...
* Dann rechnest du:

```
k * i mod n
```

Das sagt dir, zu welchem Punkt eine Linie geht

## Beispiel

n = 10, k = 2

Punkt 3:

```
2 * 3 = 6
```

Linie von 3 zu 6

## Warum entstehen Muster?

* Wenn sich Zahlen  wiederholen, entstehen Formen
* Manche Verbindungen springen immer ähnlich weiter
* Dadurch entstehen Sterne, Kreise oder Muster

## Wichtige Idee

Wenn zwei Zahlen gut „zusammenpassen“, entsteht ein schönes Muster

Wenn nicht, entstehen oft mehrere kleine Teilmuster

## Verbindung zur Mathematik

Das hat mit folgendem zu tun:

* Teiler
* ggT (grösster gemeinsamer Teiler)

Das schauen wir später genauer an

# Abschlussfrage

Was verändert das Muster stärker:

* n (Anzahl Punkte)?
* oder k (Rechenregel)?

Begründe deine Antwort.