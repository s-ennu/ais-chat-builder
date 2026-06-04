# CLAUDE.md

Diese Datei gibt Claude Code den Kontext und die Regeln für dieses Projekt.
Claude Code liest sie zu Beginn jeder Session automatisch.
Kommunikation, Arbeitsweise und Kenntnisstand stehen global in `~/.claude/CLAUDE.md`.

## Autor und Verantwortung

- **Autor**: Martin Kurz
- **Institution**: Hessische Lehrkräfteakademie (HLA), Dezernat II.3 Medien
- **Rolle**: Beauftragt für die Produktion von Bildungsmedien in der Lehrkräftebildung, sekundär Unterrichtsmaterialien im Kontext der Lehrkräftefortbildung
- **Dienstliche E-Mail**: martin.kurz@bildung.hessen.de
- **GitHub (privat)**: mgkurz
- Die Verantwortung als Autor wird wahrgenommen, auch im Datenschutz. Transparenz ist wichtig.
- Hinweis zum Status: privat erstellt mit dienstlichem Bezug, ohne formale Anbindung an einen Datenschutzbeauftragten der HLA. Die Verantwortung liegt beim Autor.
- Jede Veröffentlichung braucht Impressum, Datenschutzerklärung und Nutzungsbedingungen.

## Projektkontext

- **Was**: Claude-Skill `ais-chat-builder`. Anleitungspaket, das Claude befähigt, fertige, copy-paste-fähige Vorlagen für den Schul-KI-Chatbot AIS.chat zu erzeugen. Drei Vorlagentypen: **Lernszenario**, **Dialogpartner**, **Assistent**. Besonderheit: in jede Vorlage werden wortgleich **Knappheitsregeln** (Pflichtbausteine gegen Schwätzigkeit) eingebaut, damit AIS.chat im Einsatz nicht floskelhaft oder weitschweifig antwortet. Dieses Repo ist also keine Vorlage, sondern das Werkzeug, das Vorlagen baut.
- **Quelle der Wahrheit**: `SKILL.md` im Repo-Root (versioniert), zusammen mit den Spezifikationen in `references/` (`lernszenario.md`, `dialogpartner.md`, `assistent.md`). SKILL.md verweist relativ auf `references/...`. Im Repo liegen diese Dateien flach im Root, kein Skill-Unterordner.
- **Release-Build (`.skill`)**: Die `.skill`-Datei ist ausschließlich das Auslieferungspaket (ZIP) für ein GitHub-Release, nie von Hand bearbeitet, nicht in `main` committet (siehe `.gitignore`). Beim Packen müssen SKILL.md und `references/` in einen Top-Level-Ordner `ais-chat-builder/` gelegt werden, denn Claude lädt einen Skill als benannten Ordner hoch. Das ZIP enthält also `ais-chat-builder/SKILL.md` und `ais-chat-builder/references/...`, obwohl das Repo selbst flach ist.
- **Zielgruppe (Nutzende der erzeugten Vorlagen)**: Bei Lernszenario und Dialogpartner Schülerinnen und Schüler (in der Regel Minderjährige), die direkt mit AIS.chat arbeiten. Beim Assistenten die Lehrkraft selbst als Werkzeug.
- **Zielgruppe (Nutzende des Skills)**: Lehrkräfte, die mit Claude AIS.chat-Vorlagen erstellen.
- **Einsatzkontext**: Die erzeugten Vorlagen werden 1:1 in die Formulare von AIS.chat (`https://app.ais-chat.schule`) kopiert und dort per QR-Code/Link an Lernende oder an andere Lehrkräfte geteilt. Der Skill selbst wird in Claude (Free-Plan reicht, Code-Ausführung aktiviert) bzw. Claude Code / Desktop genutzt. Veröffentlichung als öffentliches GitHub-Repo (OER): `https://github.com/mgkurz/ais-chat-builder`.

## Lizenz

- **Dieses Repo: CC BY-SA 4.0.** Der Skill ist im Kern Anleitungstext (OER-Inhalt), daher Creative Commons mit Share-Alike.
- **Autor und Bearbeitung**: Martin Kurz, Hessische Lehrkräfteakademie.
- Allgemeine Regel für anderen Code ohne OER-Inhalt: in der Regel MIT. Kontextabhängig, im Zweifel kurz nachfragen.

## Tech-Stack und Veröffentlichung

- HTML5, CSS3, Vanilla JavaScript
- Veröffentlichung aktuell über GitHub Pages. Was dort technisch möglich ist, darf genutzt werden, besonders bei höherer Komplexität.
- Übergang zu React erst nach Rücksprache.
- Datenspeicherung bei Bedarf: Supabase (EU/Frankfurt). Noch keine Praxiserfahrung, daher die nötigen Schritte erklären, wenn es relevant wird.

## Datenschutz (DSGVO): nicht verhandelbar

- Keine externen CDNs, Analytics oder Tracker einbinden.
- Schriften lokal einbinden, notfalls mitliefern. Keine Remote-Fonts.
- Bilder, Medien und alle weiteren Assets lokal halten und mitliefern.
- Keine personenbezogenen Daten in Code, Kommentaren oder Commits.
- Keine echten Schülerdaten in Beispielen. Immer Dummy-Daten.
- Bei jeder externen Abhängigkeit, die du vorschlagen willst: erst nennen und begründen, nicht ungefragt einbauen.
- **Spezifisch für erzeugte Assistenten**: Systemprompts dürfen keine personenbezogenen Daten enthalten. Die Bots fordern von Schülerinnen und Schülern keine persönlichen Angaben (Name, Adresse, Kontaktdaten) an, sondern weisen dezent darauf hin, keine persönlichen Daten einzugeben.

## Design

- Es gibt mehrere Design-Sets.
- Für AIS.chat liegt ein Styleguide als PDF vor, dazu Vorlagen-Dateien für Logo, Signets und Hintergründe.
- Assets werden lokal abgelegt oder diskret im Repo gehalten.
- **Für dieses Repo: kein Design-Set.** Es ist ein reines Skill-/Textpaket ohne eigene UI. Die Ausgabe sind reine Textfelder, die in die AIS.chat-Formulare kopiert werden; visuelle Gestaltung, Logo und Layout liefert AIS.chat selbst. Inhaltliche Vorgaben (Feldstruktur, Block-Schreibweise nach FWU-Konvention, Knappheitsbausteine, Zeichenlimits) stehen in der SKILL.md und den `references/`.

## Barrierefreiheit

- Semantisches HTML (heading-Hierarchie, button statt div mit onclick, alt-Texte).
- Ausreichende Farbkontraste, Tastaturbedienbarkeit.
- Grundlegende Konformität, kein WCAG-AAA-Aufwand.

## Code-Konventionen

- Kommentare und UI-Texte auf Deutsch.
- Kurze, lesbare Funktionen. Sprechende Namen.
- Lesbarkeit vor Performance. Performance ist hier zweitrangig.
- Keine vorzeitige Optimierung.

## Git

- Kurze, sinnvolle Commit-Messages auf Deutsch.
- `.env` und Konfigdateien mit Secrets gehören in `.gitignore`, niemals committen.
- Vor jedem Commit prüfen: keine personenbezogenen Daten, keine Keys.
</content>
</invoke>
