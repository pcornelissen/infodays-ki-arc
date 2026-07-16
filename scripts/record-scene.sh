#!/usr/bin/env bash
#
# record-scene.sh — Nimmt eine Szene in iTerm2 auf.
#
# Aufruf: record-scene.sh <szene-datei>
#
# Eine Szene ist ein Bash-Skript mit Aufrufen von type / press_enter / wait_for_prompt.
# Diese Funktionen werden vor Szenen-Ausführung geladen.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VIDEOS_DIR="$PROJECT_ROOT/videos"
SCENES_DIR="$PROJECT_ROOT/scenes"

SCENE="${1:-}"
[[ -n "$SCENE" && -f "$SCENE" ]] || { echo "Aufruf: record-scene.sh <szene.sh>" >&2; exit 2; }

SCENE_NAME="$(basename "$SCENE" .sh)"
mkdir -p "$VIDEOS_DIR"
OUT_VIDEO="$VIDEOS_DIR/${SCENE_NAME}.mov"

# ---- Bühne: neues iTerm2-Fenster mit definierter Optik --------------------
# Rows/Columns großzügig, Font gleich groß setzen, Fenster positionieren.

WIN_ID=$(osascript <<'APPLESCRIPT'
tell application "iTerm2"
  set newWin to (create window with default profile)
  set bounds of newWin to {80, 80, 1360, 880}
  tell current session of newWin
    -- Font vergrößern für Videokonferenz-Lesbarkeit
    set columns to 100
    set rows to 30
  end tell
  return id of newWin
end tell
APPLESCRIPT
)

# Fenster braucht kurz um zu positionieren
sleep 0.8

# ---- Fenster-Bounds für Region-Capture ermitteln --------------------------
# AppleScript liefert {x, y, w, h} des Fensters
BOUNDS=$(osascript <<APPLESCRIPT
tell application "iTerm2"
  set b to bounds of (first window whose id is ${WIN_ID})
  return (item 1 of b) & "," & (item 2 of b) & "," & ((item 3 of b) - (item 1 of b)) & "," & ((item 4 of b) - (item 2 of b))
end tell
APPLESCRIPT
)
# Bounds sind zurück als CSV "x,y,w,h"
REGION=$(echo "$BOUNDS" | tr -d ' ')

# ---- Aufnahme starten -----------------------------------------------------
rm -f "$OUT_VIDEO"
screencapture -v -R"$REGION" -o "$OUT_VIDEO" &
CAP_PID=$!

# Kurze Aufwärmphase für die Aufnahme
sleep 1.5

# ---- Hilfsfunktionen für die Szene ----------------------------------------

# Text in aktive iTerm-Session „tippen", zeichen-für-zeichen mit Pause.
# type "text" [chars-per-second]
# Der Umweg über eine UTF-8-Datei ist nötig, weil `osascript -e "..."` mit
# Multi-Byte-Umlauten kollidiert (ä → √§).
type() {
  local text="$1"
  local cps="${2:-25}"
  local delay_s
  delay_s=$(awk "BEGIN{printf \"%.3f\", 1/$cps}")
  local tmpfile
  tmpfile=$(mktemp -t typetext.XXXXXX)
  printf '%s' "$text" > "$tmpfile"
  osascript >/dev/null <<APPLESCRIPT
set theText to (read POSIX file "${tmpfile}" as «class utf8»)
tell application "iTerm2"
  tell current session of (first window whose id is ${WIN_ID})
    repeat with i from 1 to (length of theText)
      write text (character i of theText) newline NO
      delay ${delay_s}
    end repeat
  end tell
end tell
APPLESCRIPT
  rm -f "$tmpfile"
}

press_enter() {
  osascript -e "tell application \"iTerm2\" to tell current session of (first window whose id is ${WIN_ID}) to write text \"\"" >/dev/null
}

pause() {
  sleep "${1:-1}"
}

# Warte bis ein neues Prompt-Zeichen sichtbar ist (heuristisch über Zeit)
# Für einfache Fälle: geben wir dem Kommando eine feste Wartezeit mit
wait_for() {
  sleep "${1:-2}"
}

# ---- Szene ausführen ------------------------------------------------------
# shellcheck disable=SC1090
source "$SCENE"

# Kurzer Nach-Puffer, damit man das Endergebnis im Video sieht
sleep 2

# ---- Aufnahme stoppen -----------------------------------------------------
kill -INT "$CAP_PID" 2>/dev/null || true
wait "$CAP_PID" 2>/dev/null || true

# ---- Fenster schließen (das Video ist gesichert) --------------------------
osascript <<APPLESCRIPT
tell application "iTerm2"
  close (first window whose id is ${WIN_ID})
end tell
APPLESCRIPT

echo "Video gespeichert: $OUT_VIDEO"
ls -lh "$OUT_VIDEO"
