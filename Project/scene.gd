extends Node2D

var time:int = 1
var time2:int = 1
var measure:int = 0
var beat:int = 1
var select:int = 0
var song:Array = G.song1
var bp = song[0]


func _physics_process(_delta: float) -> void:
	time +=  1
	time2 += 1
	if time > (240/bp):
		beat += 1
		time = 1
	if time2 > 240:
		measure += 1
		beat = 1
		select += bp + 1
		time2 = 1


func _process(_delta: float) -> void:
	if select == -1:
		pass
	bp = song[select]
