# Szene 1: Ein PDF kondensieren
# Zeigt: die Bühne (Zeitmarken, Modell-Name, Tokens), Live-Kondensation eines
# einzelnen Dokuments mit dem Frontier-Modell auf Stackit.
# Dauer: ~20 s

type "cd ~/Atvantage/Vorträge/infodays-ki-arc"
press_enter
wait_for 1

type "clear"
press_enter
wait_for 1

type "./scripts/condense.sh demo-material/fitko/1_Leistungsbeschreibung_v.1.0.pdf"
press_enter
wait_for 25
