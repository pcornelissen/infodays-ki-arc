# Szene 5: Frage F1 gegen lokales qwen3:14b (Master-Kontext).
# Erwartet: ähnlich langsam wie 8b, aber KEINE halluzinierten URLs mehr.
# Der Vortragspunkt "Sprung von 8B auf 14B eliminiert eine Klasse Halluzinationen".
# Dauer: ~3 min

type "cd ~/Atvantage/Vorträge/infodays-ki-arc"
press_enter
wait_for 1

type "clear"
press_enter
wait_for 1

type "./scripts/ask-local.sh --model qwen3:14b --mode master prompts/fragen/f1-technologische-vorgaben.md"
press_enter
wait_for 320
