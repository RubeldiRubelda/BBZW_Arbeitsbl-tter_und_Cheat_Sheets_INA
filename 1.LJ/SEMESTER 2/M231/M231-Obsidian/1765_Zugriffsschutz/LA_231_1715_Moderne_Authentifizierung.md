
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

# Lern- und Arbeitsauftrag: Moderne Authentifizierung

| Titel | Modul | Autor/Version | Hilfsmittel | Nachweis | Sozialform | Leistungsziele |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Moderne Authentifizierungsmethoden und Zugriffsschutz evaluieren und implementieren | 231 Informatiker/in EFZ | Davor Vukelic / V1.0 | Notebook, Präsentation, Authentifizierungstools | Präsentation und Demo auf Teams | Gruppenarbeit (2-3 Personen) | LZ 2.7, LZ 2.8, LZ 2.9 |

## Ausgangslage
Unternehmen müssen Authentifizierungslösungen finden, die den Spagat zwischen maximaler Sicherheit (Zero Trust) und hoher Benutzerakzeptanz (Usability) schaffen.

---

## Aufgabenstellung

### Teilaufgabe 1: Recherche & Vergleich
Vergleich moderner Authentifizierungskonzepte:

| Methode | Funktionsweise | Sicherheitsniveau | Benutzerfreundlichkeit | Aufwand (Impl.) |
| :--- | :--- | :--- | :--- | :--- |
| **Passwortlos (FIDO2/WebAuthn)** | Kryptographische Schlüsselpaare; lokaler Unlock via Biometrie/PIN. | **Sehr Hoch** (Phishing-resistent) | Hoch (Kein Passwort merken) | Mittel (Webserver-Anpassung) |
| **Zero Trust Modelle** | "Never trust, always verify"; ständige Prüfung von Gerät, Ort und User. | **Maximum** | Mittel (evtl. häufige Re-Authentisierung) | Sehr Hoch (Netzwerkumbau) |
| **Adaptive MFA** | Risikoanalyse (z.B. neue IP-Adresse) triggert zusätzliche Faktoren. | **Hoch** | Sehr Hoch (nur bei Risiko aktiv) | Mittel (Cloud-Konfiguration) |

---

### Teilaufgabe 2: Praktische Implementierung (Beispiel: FIDO2/Passkeys)
**Gewählte Methode:** Passwortlose Anmeldung via FIDO2 (Passkeys)

**Schritt-für-Schritt Dokumentation:**
1. **Vorbereitung:** Nutzung eines Test-Accounts auf einer Plattform, die WebAuthn unterstützt (z.B. WebAuthn.io oder ein Microsoft-Test-Tenant).
2. **Registrierung:** In den Sicherheitseinstellungen "Sicherheitsschlüssel" wählen. Der Browser fordert zur Interaktion mit dem OS auf (Windows Hello oder TouchID).
3. **Schlüsselerzeugung:** Das Gerät generiert ein lokales Schlüsselpaar. Der öffentliche Teil wird zum Server übertragen.
4. **Verifizierung:** Test des Logins. Statt Passwort wird nun nur noch der Fingerabdruck am Notebook verlangt.
5. **Ergebnis:** Erfolgreicher Login ohne Übertragung von Geheimnissen über das Netzwerk.

---

### Teilaufgabe 3: Kritische Bewertung
Bewertung der **FIDO2-Implementierung**:

* **Sicherheit:** Eliminiert Phishing-Angriffe fast vollständig, da der private Schlüssel das Gerät nie verlässt.
* **Benutzerfreundlichkeit:** Extrem schnell; Nutzer müssen keine komplexen Passwörter mehr ändern oder vergessen.
* **Datenschutz:** Biometrische Daten verbleiben lokal auf dem Sicherheitschip (TPM) des Nutzers; der Server sieht nur den Public Key.
* **Skalierbarkeit:** Gut für Web-Dienste, erfordert aber moderne Hardware/Browser bei allen Endnutzern.
* **Kosten:** Gering, wenn vorhandene Hardware (Smartphones/Laptops) genutzt wird; teurer bei Rollout von Hardware-Tokens (YubiKeys).

---

### Teilaufgabe 4: Präsentation und Demo
* **Struktur:** 1. Intro (Problem Passwörter), 2. Vergleichstabelle, 3. Demo FIDO2-Login, 4. Fazit & Empfehlung.
* **Demo:** Videoaufnahme des Bildschirms, die den Login-Vorgang ohne Tastatureingabe zeigt.

---

## Gütekriterien
* [ ] Drei moderne Methoden recherchiert und verglichen.
* [ ] Eine Methode praktisch implementiert und dokumentiert.
* [ ] Kritische Bewertung (Vor-/Nachteile) durchgeführt.
* [ ] Präsentationsfolien und Demo-Video auf Teams hochgeladen.

## Zusätzliche Angaben
* **Datenschutz:** Es wurden ausschliesslich Test-Identitäten ohne Personenbezug verwendet.