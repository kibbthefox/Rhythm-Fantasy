extends Node2D

var time:int = 1
var time2:int = 1
var measure:int = 0
var beat:int = 1
var select:int = 0
var song:Array = G.song1
var bp = song[0]


func _process(_delta: float) -> void:
	if bp == 0:
		pass
	bp = song[select]
	#print(song[select+beat])


func _physics_process(_delta: float) -> void:
	time +=  1
	time2 += 1
	if time > (240/bp):
		go(song[select+beat])
		print(song[select+beat])
		beat += 1
		time = 1
	if time2 > 240:
		measure += 1
		beat = 1
		select += bp + 1
		time2 = 1
	#if start = true:


func update():
	print(song[select+beat])
	
	
#var start:bool = false


#func _ready() -> void:
#	if self.name == "0":
#		go([1,0,0,0])


func go(notes:Array):
	var which
	if notes.has(1):
		which = notes.find(1)
#	start = true
	pass
