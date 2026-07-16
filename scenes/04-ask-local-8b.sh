# Szene 4: Frage F1 gegen lokales qwen3:8b (Master-Kontext).
# Erwartet: langsam (~3 min), außerdem sichtbar halluzinierte example.com-URLs
# im Ergebnis. Der Vortragspunkt "kleines lokales Modell hat spürbare Schwächen".
# Dauer: ~3 min

type "cd ~/Atvantage/Vorträge/infodays-ki-arc"
press_enter
wait_for 1

type "clear"
press_enter
wait_for 1

type "./scripts/ask-local.sh --model qwen3:8b --mode master prompts/fragen/f1-technologische-vorgaben.md"
press_enter
wait_for 240
