# ais-chat-builder

Ein Claude-Skill für Lehrkräfte, der fertige, copy-paste-fähige Vorlagen für den Schul-KI-Chatbot [AIS.chat](https://ais-chat.schule) erzeugt: Lernszenarien, Dialogpartner und Assistenten.

Der Skill enthält **Knappheitsregeln (Pflichtbausteine gegen Schwätzigkeit)**: kurze, wortgleich eingebaute Anweisungen, die im Instruktionsfeld der AIS.chat-Vorlage landen. Dadurch antwortet AIS.chat im späteren Einsatz deutlich knapper: keine Floskeln, keine ausufernden Erklärungen, keine ungefragten Zusatzideen.

## Was der Skill kann

- Erkennt automatisch, welcher Vorlagentyp gebraucht wird (Lernszenario, Dialogpartner, Assistent)
- Generiert die fertigen Feldinhalte gemäß der aktuellen AIS.chat-Formularstruktur (Stand Mai 2026)
- Hält die Zeichenlimits ein (Name 50, Kurzbeschreibung 500, Instruktionen 10000, Pflichtfelder ca. 500)
- Folgt der FWU-Konvention zur Block-Schreibweise (Großbuchstaben bei Lernszenario und Assistent, Mixed Case bei Dialogpartner)
- Baut die Knappheitsregeln wortgleich in den passenden Block ein
- Schlägt Sprachmodell sowie Empfehlungen für Tokenvolumen, Nutzungszeit und Hintergrundwissen vor

## Voraussetzungen

- Anthropic Claude (Free-Plan reicht)
- Code-Ausführung im Chat aktivieren (Einstellungen → Code-Ausführung)

## Installation

1. Diesen Repository-Inhalt herunterladen oder klonen
2. In Claude → Einstellungen → Capabilities → Skills → Skill hinzufügen
3. Den Ordner `ais-chat-builder` hochladen oder den `.skill`-Container aus dem [neuesten Release](../../releases/latest) verwenden

## Verwendung

Im Claude-Chat den Skill aufrufen und das Anliegen beschreiben:

- „Erstelle ein Lernszenario für Klasse 9, Geschichte, Industrialisierung."
- „Ich brauche einen Dialogpartner: eine fiktive Astronautin, die zu einer 8. Klasse spricht."
- „Bau mir einen Assistenten, der Aufgaben für meine Mathe-Klasse differenziert."

Der Skill liefert die fertigen Feldinhalte. Diese direkt in [AIS.chat](https://app.ais-chat.schule) in die entsprechenden Vorlagenfelder kopieren.

## Lizenz

[CC BY-SA 4.0](LICENSE)

Beiträge und Inspirationsquellen siehe [CHANGELOG.md](CHANGELOG.md).
