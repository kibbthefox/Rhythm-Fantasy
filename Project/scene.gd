extends Node2D

var beattime:int = 1
var measuretime:int = 1
var measure:int = 0
var beat:int = 1
var select:int = 0
var song:Array = G.bodys
var bp = song[0]
var playing:bool = true

# Sets note count for next measure + debug menu (DELETE)
func _process(_delta: float) -> void:
	$points.text = "Points
"+str(int(G.points))
	$combo.text = "Combo
"+str(G.combo)
	if bp != 3:
		$debug.text="debug
notes: "+str(song[select+beat])+"
bp: "+str(bp)+"
select: "+str(select)+"

measure: "+str(measure)+"
beat: "+str(beat)+"

beattime: "+str(beattime)+"
measuretime: "+str(measuretime) 


func _physics_process(_delta: float) -> void:
	if playing == true:
		bp = song[select]
		# Starts song
		if bp == 5:
			$Music.play()
			select += 1
			bp = song[select]
		# Tells notes to go
		if beattime == 1 and bp !=3 and bp !=5:
			go(song[select+beat])
		# Counts measures/beats
		beattime +=  1
		measuretime += 1
		if beattime > (240/bp) and bp !=3 and bp !=5:
			beat += 1
			beattime = 1
		if measuretime > 240 and bp !=3 and bp !=5:
			measure += 1
			beat = 1
			select += bp + 1
			measuretime = 1
		# Makes lyrics scroll
		$lyrics.position.y -= 0.075

# Tells notes to go
func go(notes:Array):
	if notes.has(1):
		for i in 4:
			if notes[i] == 1:
				get_tree().root.get_node("Scene").get_node("notes").get_node(str(i)).note(1)
	if notes.has(2):
		for i in 4:
			if notes[i] == 2:
				get_tree().root.get_node("Scene").get_node("notes").get_node(str(i)).note(2)
	if notes.has(3):
		for i in 4:
			if notes[i] == 3:
				get_tree().root.get_node("Scene").get_node("notes").get_node(str(i)).note(3)
