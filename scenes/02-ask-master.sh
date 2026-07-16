# Szene 2: Frage F1 gegen den aufbereiteten Master-Kontext (Stackit-Frontier)
# Zeigt: schnelle, saubere Antwort auf eine architekturrelevante Frage.
# Dauer: ~25 s

type "cd ~/Atvantage/Vorträge/infodays-ki-arc"
press_enter
wait_for 1

type "clear"
press_enter
wait_for 1

type "./scripts/ask.sh --mode master prompts/fragen/f1-technologische-vorgaben.md"
press_enter
wait_for 30
