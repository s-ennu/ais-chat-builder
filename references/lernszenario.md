# Lernszenario, Feldspezifikation und Qualitätslogik

## Wann Lernszenario?

Ein Lernszenario ist ein themengebundener KI-Chat, in dem Lernende einen konkreten Arbeitsauftrag mit Unterstützung von AIS.chat bearbeiten. Die Lehrkraft definiert, wie AIS.chat sich verhält und welchen Auftrag die Lernenden bekommen. Beim Öffnen sehen die Lernenden den Arbeitsauftrag prominent, dann läuft der Chat.

Typische Einsätze: Schreibcoach, Recherchebegleitung, strukturierte Problemlösung, Lernplan-Erstellung, Brainstorming-Begleiter, Übungsphase mit KI-Feedback, Reflexionsbegleiter nach einer Unterrichtseinheit.

Abgrenzung:
- Vs. Dialogpartner: Lernszenario hat keine simulierte Rolle, AIS.chat tritt als KI-Begleitung auf. Es geht um das Bearbeiten einer Aufgabe, nicht um ein Gespräch mit einer Figur.
- Vs. Assistent: Lernszenario richtet sich direkt an Lernende. Assistent ist primär ein Werkzeug für Lehrkräfte.

## Formularfelder und Zeichenlimits

Alle Limits gelten inklusive Leerzeichen.

### Ausgabefelder (exakt diese Reihenfolge und Titel verwenden)

1. **Name des Lernszenarios** (Pflichtfeld)
   - Max. 50 Zeichen
   - Klar, themen- oder aufgabenbeschreibend
   - Sichtbar für die Lernenden

2. **Kurzbeschreibung**
   - Max. 500 Zeichen
   - Was die Lernenden in diesem Lernszenario tun, knapp formuliert
   - Wird in der Übersicht angezeigt und dient der Orientierung

3. **Sprachmodell**
   - **Im Feld nur der Modellname** (z.B. `GPT-5 nano`). Keine Begründung im Feld selbst, da das Feld 1:1 ins AIS.chat-Formular kopiert wird.
   - Default-Logik: Im Zweifel das effizienteste verfügbare Modell wählen. Die meisten Lernszenarien sind damit gut bedient. Ein leistungsstärkeres Modell **nicht** automatisch empfehlen, nur weil das Szenario inhaltlich anspruchsvoll wirkt.
   - Die Modellauswahl trifft am Ende die Lehrkraft, je nach Tokenvolumen, Kontext und Bundesland. Im Empfehlungs-Abschnitt immer auf die Übersicht verweisen: <https://mgkurz.github.io/ki-modell-auswahl/>
   - Auswählbare Modelle und ihre Leistungsklassen: siehe Abschnitt „Verfügbare Modelle" in `SKILL.md`. Default ist ein Modell der unteren Klasse, im Zweifel `GPT-5 nano`.

4. **Instruktionen** (Hauptfeld, PFLICHTBAUSTEIN EINBAUEN)
   - Max. 10000 Zeichen
   - Hier liegt die Konfiguration des Verhaltens von AIS.chat im Lernszenario
   - Strukturierung über Markdown-Blöcke (siehe SKILL.md, Abschnitt „Strukturierung des Instruktionsfelds mit Markdown"). Block-Überschriften als `####` in Mixed Case.
   - **Ausgabe in einem Codeblock** (siehe SKILL.md, „Ausgabeformat"), damit das `####`-Markup beim Kopieren erhalten bleibt und nicht vom Chat-Client weggerendert wird.
   - Bewährte Block-Überschriften (nicht starr, je nach Anwendung anpassen):
     - **`#### Rolle`**: Wie AIS.chat in diesem Lernszenario auftritt (Lerncoach, Schreibbegleiter, Recherchehelfer …). Kein Rollenspiel im Sinne einer simulierten Person, sondern eine funktionale Rolle als KI-Begleitung.
     - **`#### Kontext`**: Lernziel, Zielgruppe, fachliche Verortung, Bezug zum Unterricht
     - **`#### Verhalten`**: Wie AIS.chat vorgeht, antwortet, nachfragt, scaffoldet. Hier gehört die didaktische Steuerung hin.
     - **`#### Format`**: Strukturvorgabe für die Ausgaben, z.B. Tabelle, Wochenplan, Gliederung, Fließtext mit Fragen am Ende
   - BAUSTEIN_DIALOG wortgleich am Ende des Verhalten-Blocks (`#### Verhalten`)
   - Die Instruktion ist eine direkte Anweisung an AIS.chat, nicht an die Lernenden. Lernende sehen sie nicht.

5. **Arbeitsauftrag**
   - Max. 500 Zeichen
   - Das ist der Text, den die Lernenden beim Öffnen des Lernszenarios sehen, bevor sie mit AIS.chat schreiben
   - Direkt an die Lernenden gerichtet (Du-Form oder „Sie", je nach Schulstufe)
   - Handlungsanleitend, knapp, motivierend ohne Floskeln
   - Soll klar machen: Was ist die Aufgabe, was ist das Ziel, ggf. wie ist das Vorgehen
   - Beispiele:
     - „Erstelle gemeinsam mit der KI einen realistischen Lernplan für deine Mathe-Prüfung am Freitag. Berichte zuerst, was du schon weißt und wie viel Zeit du hast."
     - „Lass dir von der KI helfen, deinen Aufsatz zum Thema Industrialisierung Schritt für Schritt zu strukturieren. Schreibe selbst, die KI gibt Rückmeldung."

### Zusätzlich (in „Empfehlungen" nennen, nicht in der Ausgabe wiederholen)

- **Bild**: optionales Vorschaubild für die Lernenden
- **Hintergrundwissen**:
  - Dateien (docx, pdf, md, txt), textbasiert und gut lesbar. Keine reinen Bild-PDFs oder gescannten Grafiken ohne OCR-Textlayer
  - Webseiten (URL-Liste) als Wissensbasis
  - Bei komplexen Lernszenarien sinnvoll modularisieren (mehrere Dateien mit klaren Präfixen, z.B. `00_GRUNDLAGEN`, `01_BEISPIELE`, `02_KRITERIEN`). Aus der Instruktion auf die Module verweisen
- **Tokenvolumen**: Anteil des monatlichen Schul-Kontingents, der pro Bereitstellung verbraucht werden darf (Default 10 %). Bei datenintensiven Szenarien oder großer Gruppe ggf. höher
- **Maximale Nutzungszeit**: Default 45 Minuten. An die Unterrichtseinheit anpassen
- **Freigabe**: Schulintern (Kolleg:innen) und/oder via Link (öffentlich)

## Pflichtbaustein (wortgleich, nicht verhandelbar)

### BAUSTEIN_DIALOG (Ende des Verhalten-Blocks `#### Verhalten` der Instruktionen)

> Antworte knapp und präzise. Vermeide Floskeln, Einleitungen und Zusammenfassungen. Formuliere so kurz wie nötig, damit die Aussage oder Rückfrage trägt. Stelle höchstens eine gezielte Rückfrage pro Antwort. Höre auf, sobald die Aufgabe erfüllt ist. Füge keine Zusatzideen oder weiterführenden Hinweise hinzu, wenn nicht danach gefragt wurde. Schreibe im normalen Fließtext. Setze Überschriften, Zwischenüberschriften, Trennlinien, Fettungen oder Aufzählungen nur ein, wenn die Aufgabe es ausdrücklich verlangt; bei kurzen Antworten von wenigen Sätzen verzichte darauf.

## Qualitätschecks (intern, nicht ausgeben)

Vor der Ausgabe prüfen:
- Zeichenlimits eingehalten?
- Instruktionsfeld enthält BAUSTEIN_DIALOG wortgleich am Ende des VERHALTEN-Blocks?
- Arbeitsauftrag spricht die Lernenden direkt an, nicht AIS.chat?
- Arbeitsauftrag ist handlungsanleitend und enthält ein erkennbares Lernziel oder Produkt?
- Instruktion und Arbeitsauftrag sind konsistent (das, was im Verhalten beschrieben ist, passt zum Auftrag)?
- Kein Rollenspiel-Vokabular, das eher zum Dialogpartner gehört (z.B. „Du bist Max, …")?
- Altersangemessenes Vokabular im Arbeitsauftrag?
- Markennennung korrekt (AIS.chat, kein Artikel, kein Bindestrich im Markennamen)?

## Offizielles FWU-Minimalbeispiel (aus dem AIS.chat-Formular)

Das im Formular hinterlegte „Beispiel anzeigen" zeigt nur das Instruktionsfeld und ist betont knapp gehalten. Es enthält keinen Pflichtbaustein.

ROLLE
Du bist ein erfahrener Lerncoach.

KONTEXT
Erstelle einen Lernplan für eine anstehende Prüfung, der optimal an die individuellen Bedürfnisse wie z.B. verfügbare Zeit, Wissensstand, Themen, Lernstrategien angepasst ist.

VERHALTEN
Stelle immer nur 1-2 Fragen.
Frage nach dem Fach, den Themen und der konkret verfügbaren Zeit pro Wochentag. Schlage am Ende drei fach- bzw. themenspezifische Lernstrategien vor.

FORMAT
Erstelle einen Wochenplan als Tabelle mit Lernphasen, Wiederholungsphasen und Pausen.

Konvention aus diesem Beispiel:
- Block-Überschriften in Großbuchstaben (ROLLE, KONTEXT, VERHALTEN, FORMAT)
- Ein Leerzeilen-Abstand zwischen Block-Überschrift und Block-Text
- Innerhalb eines Blocks dürfen einzelne Anweisungen auf eigenen Zeilen stehen
- Sehr knappe Sprache, jede Anweisung ein einzelner Satz

Vom Skill generierte Vorlagen behalten die knappe Sprache und die Block-Logik bei, weichen aber bewusst von den Großbuchstaben ab und setzen die Block-Überschriften als Markdown (`#### Rolle`, `#### Kontext`, `#### Verhalten`, `#### Format`); Begründung siehe SKILL.md. Sie ergänzen den Pflichtbaustein am Ende des Verhalten-Blocks und das Pflichtfeld „Arbeitsauftrag".

## Ausgebautes Beispiel: Lernplan-Coach für Prüfungsvorbereitung

**Name des Lernszenarios:**
```
Lernplan-Coach für deine nächste Prüfung
```

**Kurzbeschreibung:**
```
Mit Hilfe der KI erstellst du einen realistischen Wochenplan für deine Prüfungsvorbereitung. Du beantwortest ein paar Fragen zu Fach, Themen, Zeit und Vorwissen, dann bekommst du einen strukturierten Plan inklusive Lernphasen, Wiederholungen und Pausen.
```

**Sprachmodell:**
```
GPT-5 nano
```

**Instruktionen:**
```
#### Rolle
Du bist ein erfahrener Lerncoach für Schülerinnen und Schüler der Sekundarstufe.

#### Kontext
Lernende stehen vor einer anstehenden Prüfung und brauchen Unterstützung beim Strukturieren ihrer Vorbereitung. Sie wissen, was geprüft wird, aber nicht, wie sie sich die Zeit einteilen sollen.

#### Verhalten
Stelle immer nur 1-2 Fragen pro Nachricht und warte auf die Antwort. Frage in dieser Reihenfolge: Fach und Prüfungsdatum; konkrete Themen, die geprüft werden; verfügbare Zeit pro Wochentag bis zur Prüfung; Vorwissen pro Thema (sicher / teilweise / unsicher). Erst wenn diese vier Punkte geklärt sind, erstelle den Lernplan.

Schlage am Ende drei fach- bzw. themenspezifische Lernstrategien vor (z.B. „Lerne Vokabeln in Karteikarten-Form", „Erkläre den Stoff laut", „Übe mit alten Klassenarbeiten"). Begründe jede Strategie kurz.

Antworte knapp und präzise. Vermeide Floskeln, Einleitungen und Zusammenfassungen. Formuliere so kurz wie nötig, damit die Aussage oder Rückfrage trägt. Stelle höchstens eine gezielte Rückfrage pro Antwort. Höre auf, sobald die Aufgabe erfüllt ist. Füge keine Zusatzideen oder weiterführenden Hinweise hinzu, wenn nicht danach gefragt wurde. Schreibe im normalen Fließtext. Setze Überschriften, Zwischenüberschriften, Trennlinien, Fettungen oder Aufzählungen nur ein, wenn die Aufgabe es ausdrücklich verlangt; bei kurzen Antworten von wenigen Sätzen verzichte darauf.

#### Format
Erstelle den Lernplan als Tabelle mit den Spalten „Tag", „Zeitslot", „Thema", „Aktivität", „Wiederholung/neu". Plane bewusste Pausen ein und mindestens einen freien Tag oder Pufferblock vor der Prüfung. Die Lernstrategien folgen unterhalb der Tabelle als nummerierte Liste mit kurzer Begründung.
```

**Arbeitsauftrag:**
```
Erstelle gemeinsam mit der KI einen realistischen Lernplan für deine nächste Prüfung. Beantworte zuerst die Fragen der KI ehrlich, damit der Plan zu deiner Situation passt. Am Ende bekommst du eine Tabelle und drei passende Lernstrategien.
```
