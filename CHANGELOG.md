# Changelog

## v2.0.1 (2026-05-18) — Patch

Präzisierungen an den Spezifikationen, keine Funktionsänderungen.

### Geändert

- Sprachmodell-Feld enthält nur noch den Modellnamen, keine Begründung im Feld selbst
- Modellempfehlung entschärft: Default ist das effizienteste verfügbare Modell, keine automatische Hochstufung auf ein stärkeres Modell wegen empfundener Komplexität. Im Empfehlungs-Abschnitt der Ausgabe wird auf die Modell-Übersicht https://mgkurz.github.io/ki-modell-auswahl/ verwiesen
- Block-Überschriften im Instruktionsfeld ohne Markdown-Heading-Syntax und ohne Fettmarkierung, da AIS.chat das Feld als Plaintext behandelt
- Anti-Anhängsel-Regel im Ausgabeformat: nach dem Empfehlungs-Abschnitt folgt nichts mehr (keine Selbst-Kritik, keine Meta-Reflexion)
- Ausgebautes Assistenten-Beispiel „Lesetext differenzieren" auf GPT-5 nano umgestellt, damit es zur neuen konservativen Default-Logik passt

## v2.0.0 (2026-05-13) — Breaking Change

Komplette Überarbeitung wegen Umstellung der Plattform und der Vorlagen-Formularstruktur. Vorlagen aus v1.x sind nicht mehr direkt kompatibel.

### Breaking

- Skill- und Repository-Name auf `ais-chat-builder`
- Anpassung an die neue Formularstruktur: ein großes Instruktionsfeld statt mehrerer Einzelfelder pro Vorlagentyp
- Neue Zeichenlimits: Name 50, Kurzbeschreibung 500, Instruktionen 10000, Pflichtfelder ca. 500
- Neue Pflichtfelder pro Vorlagentyp: Arbeitsauftrag (Lernszenario), Einstiegsfrage (Dialogpartner), bis zu 10 Promptvorschläge (Assistent)
- Block-Konvention im Instruktionsfeld nach FWU: Großbuchstaben bei Lernszenario und Assistent, Mixed Case bei Dialogpartner
- Sprachmodell ist eigenes Ausgabefeld vor den Instruktionen
- Begriff `Tokenvolumen` ersetzt vorherige Kontingent-Begriffe
- Neue URLs in Empfehlungen: `app.ais-chat.schule` und `ais-chat.schule`

### Neu

- Konzept der **Knappheitsregeln** als zentrales Skill-Merkmal explizit beschrieben und benannt
- Drei Pflichtbausteine `BAUSTEIN_DIALOG`, `BAUSTEIN_DIALOG_NEG`, `BAUSTEIN_WERKZEUG` mit klarer Platzierungslogik
- `BAUSTEIN_DIALOG_NEG` nur noch bei explizitem Anti-Verhalten-Block (vorher in eigenem Feld)
- Offizielle FWU-Minimalbeispiele in jeder Referenzdatei, gefolgt von ausgebauten Skill-Beispielen mit Knappheitsregel
- Sammelbegriff **Vorlagen** für Lernszenarien, Dialogpartner und Assistenten durchgängig verwendet (entspricht FWU-Sprachgebrauch seit der Sharing-Funktion)
- Zwei valide Strukturlogiken für Dialogpartner-Instruktionen dokumentiert: personenorientiert (Standard) und funktional (für komplexe Lernbegleiter)
- Routing-Logik (welcher Vorlagentyp ist gemeint) und Modus-Logik (Direkt vs. Interview) explizit beschrieben

### Inspiration

Die Knappheitsregeln und die Idee eines strukturierten Builder-Skills für Schul-KI-Vorlagen entstanden in fachlichen Diskussionen im Kollegium der Hessischen Lehrkräfteakademie. Initial inspiriert durch einen geteilten Prompt von Marcus Krogmann.
