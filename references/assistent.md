# Assistent, Feldspezifikation und Qualitätslogik

## Wann Assistent?

Ein Assistent ist ein konfigurierbares KI-Werkzeug, das primär Lehrkräfte bei der Unterrichtsvorbereitung und -durchführung unterstützt. Anders als Lernszenario und Dialogpartner richtet sich der Assistent nicht direkt an Lernende, sondern an die Lehrkraft selbst. Er kann aber auch von Lernenden genutzt werden, z.B. als Schreibcoach.

Typische Einsätze: Materialerstellung (Arbeitsblätter, Quizfragen), Rollenspiel-Generator, Differenzierungshilfe, Korrekturassistent, Stundenplanungshilfe, Textübersetzer, Aufgabenvariation.

## Formularfelder und Zeichenlimits

Alle Limits gelten inklusive Leerzeichen.

### Ausgabefelder (exakt diese Reihenfolge und Titel verwenden)

1. **Name des Assistenten** (Pflichtfeld)
   - Max. 50 Zeichen
   - Klar, funktionsbeschreibend
   - Kann kreativ sein, muss aber sofort verständlich machen, was der Assistent tut

2. **Kurzbeschreibung**
   - Max. 500 Zeichen
   - Was der Assistent tut und für wen
   - Dient in der Übersicht der Assistenten als Orientierung
   - Kann auch als Mini-Steckbrief mit Platzhaltern formuliert sein, wenn der Assistent als Master-Prompt gedacht ist

3. **Sprachmodell**
   - **Im Feld nur der Modellname** (z.B. `GPT-5 nano`). Keine Begründung im Feld selbst, da das Feld 1:1 ins AIS.chat-Formular kopiert wird.
   - Default-Logik: Im Zweifel das effizienteste verfügbare Modell wählen. Die meisten Assistenten sind damit gut bedient. Ein leistungsstärkeres Modell **nicht** automatisch empfehlen, nur weil die Generierungs-Aufgabe anspruchsvoll wirkt.
   - Die Modellauswahl trifft am Ende die Lehrkraft, je nach Tokenvolumen, Kontext und Bundesland. Im Empfehlungs-Abschnitt immer auf die Übersicht verweisen: <https://mgkurz.github.io/ki-modell-auswahl/>
   - Auswählbare Modelle und ihre Leistungsklassen: siehe Abschnitt „Verfügbare Modelle" in `SKILL.md`. Default ist ein Modell der unteren Klasse, im Zweifel `GPT-5 nano`.

4. **Instruktionen** (Hauptfeld, PFLICHTBAUSTEIN EINBAUEN)
   - Max. 10000 Zeichen
   - Hier liegt die eigentliche Konfiguration des Assistenten
   - Strukturierung über Markdown-Blöcke (siehe SKILL.md, Abschnitt „Strukturierung des Instruktionsfelds mit Markdown"). Block-Überschriften als `####` in Mixed Case.
   - **Ausgabe in einem Codeblock** (siehe SKILL.md, „Ausgabeformat"), damit das `####`-Markup beim Kopieren erhalten bleibt und nicht vom Chat-Client weggerendert wird.
   - Bewährte Block-Überschriften (nicht starr, je nach Anwendung anpassen):
     - **`#### Rolle`**: Wer oder was die KI in diesem Kontext sein soll
     - **`#### Kontext`**: Hintergrund, Zielgruppe, didaktisches Setting, ggf. Verweis auf Hintergrundwissen
     - **`#### Verhalten`**: Wie die KI vorgehen, antworten, nachfragen soll
     - **`#### Format`**: Strukturvorgabe für die Ausgabe (Tabelle, Abschnitte, Fließtext, Drehbuch …)
   - Alternative Strukturen sind zulässig, wenn sie zur Aufgabe besser passen (z.B. nummerierte Arbeitsschritte, „Didaktische Anforderungen" mit Liste, „Erwünschtes Ausgabeformat" als Tabellenkopf)
   - **BAUSTEIN_WERKZEUG wortgleich** am Ende, durch Absatzumbruch abgesetzt. Wenn ein FORMAT-Block vorhanden ist, gehört der Baustein direkt darunter, ansonsten ans Ende des Instruktionsfelds
   - Die Instruktion ist eine direkte Anweisung AN die KI, nicht eine Beschreibung für die Lehrkraft
   - Lange Instruktionen nur dann, wenn echter Kontext oder Inhalt (z.B. Literatur, Fachtexte) eingebaut werden muss. Sonst kurz und strukturiert halten

5. **Promptvorschläge** (bis zu 10 einzelne Felder)
   - Max. 500 Zeichen pro Vorschlag (geschätzt, kein hartes Limit aus dem Backend bestätigt)
   - Werden oberhalb des Eingabefelds angezeigt, wenn Nutzer den Assistenten öffnen
   - Sollen typische Anwendungsfälle des Assistenten abbilden
   - Konkret und direkt verwendbar formulieren, nicht abstrakt. Platzhalter wie „[Thema]" möglichst vermeiden, lieber ein konkretes Beispiel
   - Jeder Vorschlag ist ein eigenständiger Prompt, der ohne weitere Eingabe funktioniert
   - Empfehlung: mindestens 3 Vorschläge, die verschiedene typische Einsätze abdecken (Fächer, Klassenstufen, Aufgabenarten)

### Zusätzlich (nicht in der Ausgabe, aber als Empfehlung nennen)

- **Bild**: Optionales Vorschaubild
- **Hintergrundwissen**:
  - Dateien (docx, pdf, md, txt), textbasiert und gut lesbar. Keine reinen Bild-PDFs oder gescannten Grafiken ohne OCR-Textlayer
  - Webseiten (URL-Liste), die der Assistent als Wissensbasis nutzen darf
- **Freigabe**: Schulintern und/oder via Link

## Pflichtbaustein (wortgleich, nicht verhandelbar)

### BAUSTEIN_WERKZEUG (Ende des Instruktionsfelds)

> Liefere direkt das angeforderte Ergebnis, ohne Einleitung, Rückversicherung oder abschließende Zusammenfassung. Keine Floskeln, kein Meta-Text über die Aufgabe. Wenn Informationen fehlen, stelle höchstens eine gezielte Rückfrage, bevor du startest. Nutze das vorgegebene Ausgabeformat strikt. Strukturiere nur das Ergebnis selbst, kein dekoratives Beiwerk und keine Trennlinien zwischen kurzen Abschnitten. Stoppe, wenn die Aufgabe erfüllt ist.

## Qualitätschecks (intern, nicht ausgeben)

Vor der Ausgabe prüfen:
- Zeichenlimits eingehalten?
- Instruktionsfeld enthält BAUSTEIN_WERKZEUG wortgleich am Ende?
- Instruktion ist eine klare Anweisung an die KI, nicht eine Beschreibung für die Lehrkraft?
- Ausgabeformat eindeutig festgelegt?
- Promptvorschläge sind konkret und direkt nutzbar?
- Promptvorschläge decken verschiedene typische Anwendungsfälle ab?
- Keine Widersprüche zwischen Kurzbeschreibung und Instruktion?
- Markennennung korrekt (AIS.chat, kein Artikel, kein Bindestrich im Markennamen)?

## Offizielles FWU-Minimalbeispiel (aus dem AIS.chat-Formular)

Das im Formular hinterlegte „Beispiel anzeigen" zeigt nur das Instruktionsfeld und ist betont knapp gehalten. Es enthält keinen Pflichtbaustein.

ROLLE
Du bist Experte für die Erstellung von differenziertem Lernmaterial.

KONTEXT
Passe das im Hintergrundwissen hochgeladene Arbeitsmaterial an drei unterschiedliche Lernniveaus an. (leicht, mittel, schwer)

VERHALTEN
Formuliere sachlich, klar und praxisnah.

FORMAT
Strukturiere die Antwort in Abschnitte.

Konvention aus diesem Beispiel:
- Block-Überschriften in Großbuchstaben (ROLLE, KONTEXT, VERHALTEN, FORMAT)
- Ein Leerzeilen-Abstand zwischen Block-Überschrift und Block-Text
- Sehr knappe Sprache, ein Satz pro Block reicht
- Bezug auf Hintergrundwissen direkt im KONTEXT formuliert

Vom Skill generierte Vorlagen behalten die knappe Sprache und die Block-Logik bei, weichen aber bewusst von den Großbuchstaben ab und setzen die Block-Überschriften als Markdown (`#### Rolle`, `#### Kontext`, `#### Verhalten`, `#### Format`); Begründung siehe SKILL.md. Sie ergänzen den Pflichtbaustein am Ende des Instruktionsfelds und mindestens drei Promptvorschläge.

## Ausgebautes Beispiel: Differenzierungshilfe Lesetext

**Name des Assistenten:**
```
Lesetext differenzieren
```

**Kurzbeschreibung:**
```
Erzeugt zu einem vorgegebenen Lesetext drei Fassungen für unterschiedliche Leseniveaus: vereinfacht (A), original (B) und sprachlich angereichert (C). Für Lehrkräfte aller Fächer, die heterogene Klassen mit einem gemeinsamen Text arbeiten lassen wollen.
```

**Sprachmodell:**
```
GPT-5 nano
```

**Instruktionen:**
```
#### Rolle
Du unterstützt Lehrkräfte beim Differenzieren von Lesetexten für heterogene Lerngruppen.

#### Kontext
Die Lehrkraft fügt einen Ausgangstext ein. Ziel ist es, daraus drei Fassungen für unterschiedliche Leseniveaus zu erzeugen, ohne den inhaltlichen Gehalt zu verändern.

#### Verhalten
1. Analysiere den Ausgangstext auf Satzlänge, Fachbegriffe und Konjunktionsgebrauch.
2. Erstelle Fassung A (vereinfacht): Sätze maximal 12 Wörter, keine Schachtelsätze, Fachbegriffe erklärt in Klammern, Aktiv statt Passiv.
3. Gib Fassung B (original) unverändert wieder.
4. Erstelle Fassung C (angereichert): Fachsprache leicht erhöht, 1-2 zusätzliche Fachbegriffe eingeführt, eine vertiefende Zusatzfrage am Ende.

Regeln: Länge jeder Fassung innerhalb ±20 % der Originallänge halten. Inhaltliche Aussagen dürfen nicht verändert werden, nur sprachliche Komplexität. Keine neuen Informationen in Fassung A, keine Kürzungen in Fassung C.

#### Format
Drei Abschnitte mit Überschriften „Fassung A (vereinfacht)", „Fassung B (original)", „Fassung C (angereichert)". Darunter jeweils der Text als Fließtext. Am Schluss eine Tabelle mit drei Zeilen (A/B/C) und drei Spalten: „durchschnittliche Satzlänge (Wörter)", „Anzahl Fachbegriffe", „empfohlene Klassenstufe".

Liefere direkt das angeforderte Ergebnis, ohne Einleitung, Rückversicherung oder abschließende Zusammenfassung. Keine Floskeln, kein Meta-Text über die Aufgabe. Wenn Informationen fehlen, stelle höchstens eine gezielte Rückfrage, bevor du startest. Nutze das vorgegebene Ausgabeformat strikt. Strukturiere nur das Ergebnis selbst, kein dekoratives Beiwerk und keine Trennlinien zwischen kurzen Abschnitten. Stoppe, wenn die Aufgabe erfüllt ist.
```

**Promptvorschlag 1:**
```
Differenziere diesen Sachtext zur Photosynthese für Klasse 7.
```

**Promptvorschlag 2:**
```
Erstelle drei Fassungen dieses Zeitungsartikels zum Klimagipfel.
```

**Promptvorschlag 3:**
```
Differenziere den folgenden Auszug aus „Emil und die Detektive" für Klasse 5.
```

**Promptvorschlag 4:**
```
Passe diesen Geschichtstext zur Industrialisierung in drei Niveaustufen an.
```

**Promptvorschlag 5:**
```
Erzeuge drei Fassungen dieser Aufgabenstellung in Mathematik (Textaufgabe).
```
