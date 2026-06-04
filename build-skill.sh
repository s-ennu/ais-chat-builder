#!/usr/bin/env bash
#
# build-skill.sh
# Packt die Auslieferungsdatei ais-chat-builder.skill (ein ZIP) für ein GitHub-Release.
#
# Hintergrund: Claude lädt einen Skill als benannten Ordner hoch. Das Repo ist flach
# (SKILL.md und references/ liegen im Root), das ausgelieferte ZIP braucht aber einen
# Top-Level-Ordner ais-chat-builder/. Dieses Skript erzeugt genau diese Struktur.
#
# Verwendung:
#   ./build-skill.sh
#
# Ergebnis:
#   ais-chat-builder.skill im Repo-Root (in .gitignore, gehört nicht in main,
#   sondern an ein GitHub-Release).

set -euo pipefail

# Immer vom Repo-Root aus arbeiten, egal von wo das Skript aufgerufen wird.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

SKILL_NAME="ais-chat-builder"
OUTPUT="$REPO_ROOT/$SKILL_NAME.skill"

# Version aus dem CHANGELOG lesen (erste Zeile, die mit "## v" beginnt), nur zur Anzeige.
VERSION="$(grep -m1 '^## v' CHANGELOG.md | sed -E 's/^## (v[0-9.]+).*/\1/' || true)"

# Diese Inhalte gehören in den Skill.
CONTENTS=("SKILL.md" "references" "LICENSE")

# Vorhandensein prüfen.
for item in "${CONTENTS[@]}"; do
  if [[ ! -e "$item" ]]; then
    echo "Fehler: '$item' fehlt im Repo-Root." >&2
    exit 1
  fi
done

# Staging-Verzeichnis mit dem benannten Top-Level-Ordner aufbauen.
STAGING="$(mktemp -d)"
trap 'rm -rf "$STAGING"' EXIT

mkdir "$STAGING/$SKILL_NAME"
cp SKILL.md "$STAGING/$SKILL_NAME/"
cp -R references "$STAGING/$SKILL_NAME/"
cp LICENSE "$STAGING/$SKILL_NAME/"

# Altes Paket entfernen, damit zip nicht hineinpackt.
rm -f "$OUTPUT"

# ZIP bauen: -r rekursiv, -X ohne Mac-Extra-Attribute, .DS_Store ausschließen.
( cd "$STAGING" && zip -r -X -q "$OUTPUT" "$SKILL_NAME" -x '*.DS_Store' )

echo "Gebaut: $OUTPUT"
[[ -n "$VERSION" ]] && echo "Version laut CHANGELOG: $VERSION"
echo "Inhalt:"
unzip -l "$OUTPUT"
