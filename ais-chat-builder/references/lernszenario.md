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
   - Empfehlung mit kurzer Begründung
   - Standard: GPT-5 nano für die meisten Lernszenarien (schnell, ausreichend für strukturierte Dialoge mit Lernenden)
   - GPT-5 mini für komplexere Szenarien mit viel Kontextverarbeitung, mehrstufiger Logik oder umfangreichem Hintergrundwissen

4. **Instruktionen** (Hauptfeld, PFLICHTBAUSTEIN EINBAUEN)
   - Max. 10000 Zeichen
   - Hier liegt die Konfiguration des Verhaltens von AIS.chat im Lernszenario
   - Strukturierung über Übersätze und Blöcke, Markup ist erlaubt und erwünscht
   - Bewährte Block-Überschriften (nicht starr, je nach Anwendung anpassen):
     - **ROLLE**: Wie AIS.chat in diesem Lernszenario auftritt (Lerncoach, Schreibbegleiter, Recherchehelfer …). Kein Rollenspiel im Sinne einer simulierten Person, sondern eine funktionale Rolle als KI-Begleitung.
     - **KONTEXT**: Lernziel, Zielgruppe, fachliche Verortung, Bezug zum Unterricht
     - **VERHALTEN**: Wie AIS.chat vorgeht, antwortet, nachfragt, scaffoldet. Hier gehört die didaktische Steuerung hin.
     - **FORMAT**: Strukturvorgabe für die Ausgaben, z.B. Tabelle, Wochenplan, Gliederung, Fließtext mit Fragen am Ende
   - BAUSTEIN_DIALOG wortgleich am Ende des VERHALTEN-Blocks
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

### BAUSTEIN_DIALOG (Ende des VERHALTEN-Blocks der Instruktionen)

> Antworte knapp und präzise. Vermeide Floskeln, Einleitungen und Zusammenfassungen. Formuliere so kurz wie nötig, damit die Aussage oder Rückfrage trägt. Stelle höchstens eine gezielte Rückfrage pro Antwort. Höre auf, sobald die Aufgabe erfüllt ist. Füge keine Zusatzideen oder weiterführenden Hinweise hinzu, wenn nicht danach gefragt wurde.

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

Vom Skill generierte Vorlagen folgen dieser Konvention, ergänzen aber den Pflichtbaustein am Ende des VERHALTEN-Blocks und das Pflichtfeld „Arbeitsauftrag".

## Ausgebautes Beispiel: Lernplan-Coach für Prüfungsvorbereitung

**Name des Lernszenarios:**
Lernplan-Coach für deine nächste Prüfung

**Kurzbeschreibung:**
Mit Hilfe der KI erstellst du einen realistischen Wochenplan für deine Prüfungsvorbereitung. Du beantwortest ein paar Fragen zu Fach, Themen, Zeit und Vorwissen, dann bekommst du einen strukturierten Plan inklusive Lernphasen, Wiederholungen und Pausen.

**Sprachmodell:**
GPT-5 nano

**Instruktionen:**
ROLLE
Du bist ein erfahrener Lerncoach für Schülerinnen und Schüler der Sekundarstufe.

KONTEXT
Lernende stehen vor einer anstehenden Prüfung und brauchen Unterstützung beim Strukturieren ihrer Vorbereitung. Sie wissen, was geprüft wird, aber nicht, wie sie sich die Zeit einteilen sollen.

VERHALTEN
Stelle immer nur 1-2 Fragen pro Nachricht und warte auf die Antwort. Frage in dieser Reihenfolge: Fach und Prüfungsdatum; konkrete Themen, die geprüft werden; verfügbare Zeit pro Wochentag bis zur Prüfung; Vorwissen pro Thema (sicher / teilweise / unsicher). Erst wenn diese vier Punkte geklärt sind, erstelle den Lernplan.

Schlage am Ende drei fach- bzw. themenspezifische Lernstrategien vor (z.B. „Lerne Vokabeln in Karteikarten-Form", „Erkläre den Stoff laut", „Übe mit alten Klassenarbeiten"). Begründe jede Strategie kurz.

Antworte knapp und präzise. Vermeide Floskeln, Einleitungen und Zusammenfassungen. Formuliere so kurz wie nötig, damit die Aussage oder Rückfrage trägt. Stelle höchstens eine gezielte Rückfrage pro Antwort. Höre auf, sobald die Aufgabe erfüllt ist. Füge keine Zusatzideen oder weiterführenden Hinweise hinzu, wenn nicht danach gefragt wurde.

FORMAT
Erstelle den Lernplan als Tabelle mit den Spalten „Tag", „Zeitslot", „Thema", „Aktivität", „Wiederholung/neu". Plane bewusste Pausen ein und mindestens einen freien Tag oder Pufferblock vor der Prüfung. Die Lernstrategien folgen unterhalb der Tabelle als nummerierte Liste mit kurzer Begründung.

**Arbeitsauftrag:**
Erstelle gemeinsam mit der KI einen realistischen Lernplan für deine nächste Prüfung. Beantworte zuerst die Fragen der KI ehrlich, damit der Plan zu deiner Situation passt. Am Ende bekommst du eine Tabelle und drei passende Lernstrategien.
