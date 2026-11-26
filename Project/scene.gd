extends Node2D

var beattime:int = 1
var measuretime:int = 1
var measure:int = 0
var beat:int = 1
var select:int = 0
var song:Array = G.song1
var bp = song[0]
var playing:bool = true

# Sets note count for next measure + debug menu (DELETE)
func _process(_delta: float) -> void:
	bp = song[select]
	if bp != 3:
		$debug.text="debug
notes: "+str(song[select+beat])+"
bp: "+str(bp)+"
select: "+str(select)+"

measure: "+str(measure)+"
beat: "+str(beat)+"

beattime: "+str(beattime)+"
measuretime: "+str(measuretime) 

# Counts measures/beats
func _physics_process(_delta: float) -> void:
	if playing == true:
		beattime +=  1
		measuretime += 1
		if beattime > (240/bp) and bp !=3:
			go(song[select+beat])
			beat += 1
			beattime = 1
		if measuretime > 240 and bp !=3:
			measure += 1
			beat = 1
			select += bp + 1
			measuretime = 1

# Tells notes to go
func go(notes:Array):
	if notes.has(1):
		for i in range(0,4):
			if notes[i] == 1:
				get_tree().root.get_node("Scene").get_node("notes").get_node(str(i)).note(1)
	if notes.has(2):
		for i in range(0,4):
			if notes[i] == 2:
				get_tree().root.get_node("Scene").get_node("notes").get_node(str(i)).note(2)
	if notes.has(3):
		for i in range(0,4):
			if notes[i] == 3:
				get_tree().root.get_node("Scene").get_node("notes").get_node(str(i)).note(3)
