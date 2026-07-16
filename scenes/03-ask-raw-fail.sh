# Szene 3: Der 400-Fail. Alle 30 rohen PDFs auf einmal → passt nicht ins Kontextfenster.
# DIE Belegstelle für „Kontext-Aufbereitung ist die eigentliche Arbeit".
# Dauer: ~5 s

type "cd ~/Atvantage/Vorträge/infodays-ki-arc"
press_enter
wait_for 1

type "clear"
press_enter
wait_for 1

type "./scripts/ask.sh --mode roh prompts/fragen/f1-technologische-vorgaben.md"
press_enter
wait_for 5
