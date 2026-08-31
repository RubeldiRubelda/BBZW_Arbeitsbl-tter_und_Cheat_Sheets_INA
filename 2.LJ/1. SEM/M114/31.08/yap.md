### Überblick

Die Sitzung behandelte die Grundlagen von **Gleitkommazahlen** in Computersystemen und erklärte, wie sie intern aus **Vorzeichen**, **Exponent** und **Mantisse** aufgebaut sind. Ein zweiter Schwerpunkt war, warum bestimmte Dezimalzahlen in binären Floats nur näherungsweise dargestellt werden und wie man damit in der Praxis umgeht.

### Binäre Darstellung und Exponent

- Es wurde erläutert, dass Gleitkommazahlen in Computern mit festen Bit-Strukturen dargestellt werden und je nach System typischerweise als **32-Bit**- oder **64-Bit**-Formate auftreten.
- Der **Exponent** kann auch negative Werte abbilden, damit sehr kleine Zahlen darstellbar sind, etwa Zahlen im Bereich von Zehnerpotenzen unter 1.
- Für den gespeicherten Exponenten wird eine **Bias-Codierung** verwendet: Der tatsächliche Wert ergibt sich durch Abziehen von **127** bei einem 8-Bit-Exponent.
- Diese Idee wurde mit der Analogie zum Zweierkomplement verknüpft, um zu zeigen, dass das Speichern nicht direkt dem mathematischen Wert entspricht.

### Mantisse und Normalisierung

- Die **Mantisse** wurde als Teil der Zahl erklärt, der die eigentliche signifikante Stellenfolge enthält.
- Bei normalisierten Zahlen wird die führende **1** nicht gespeichert, weil sie bei binären normalisierten Zahlen ohnehin fest vorausgesetzt wird.
- Normalisierung bedeutet, dass das Binärkomma so verschoben wird, dass genau eine von null verschiedene Ziffer vor dem Komma steht.
- Dadurch kann ein Teil der Zahl komprimiert werden, ohne den Wert zu verändern, was den Speicher effizienter macht.

### Ungenauigkeit binärer Floats

- Ein zentrales Thema war, dass Zahlen wie **0,1** oder **0,2** in Binärdarstellung nicht immer exakt abgebildet werden können.
- Daraus folgt, dass Gleichheitsvergleiche in Python-Floats problematisch sein können; stattdessen wurde **isClose** als geeigneter Vergleich genannt.
- Als Alternativen wurden **Decimal** und **Fraction** erwähnt, weil sie bestimmte Zahlen exakter repräsentieren können.
- Die Ursache der Ungenauigkeit wurde mit dem Unterschied zwischen Dezimal- und Binärsystem erklärt: Manche Brüche lassen sich nur in Systemen exakt darstellen, deren Basis zu ihren Faktoren passt.

### Zahlensysteme und praktische Konsequenzen

- Im Dezimalsystem sind Zahlen mit den Faktoren **2** und **5** oft leicht darstellbar, während andere Brüche periodisch werden können.
- Im Binärsystem gelten andere Darstellungsbedingungen, weil die Basis **2** direkt eingebettet ist und dadurch andere Zahlen günstig oder ungünstig darstellbar sind.
- Als Beispiel wurde erläutert, dass bestimmte Werte wie **0,3 Liter** nur näherungsweise erscheinen können, wenn sie nicht exakt im zugrunde liegenden System repräsentierbar sind.
- Aus diesem Grund ist in der Praxis oft ein toleranter Vergleich oder ein passender Datentyp notwendig.

### Übungen und weiterführende Hinweise

- Am Ende wurde auf **Übungen** verwiesen, insbesondere auf Aufgabe 2, Teil 1 und Teil 3, sowie auf Aufgabe 3 als Vertiefung oder Hausaufgabe.
- Außerdem wurde erwähnt, dass Python-Inputs bei Aufgaben geprüft werden sollen, um ihre Qualität zu beurteilen.
- Als möglicher Weg zur Bearbeitung wurde auch ein **Google-Account** in Verbindung mit einer Entwicklungsumgebung genannt.