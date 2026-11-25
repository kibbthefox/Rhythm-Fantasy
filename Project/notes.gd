extends Sprite2D

var going:bool = false
var type:int = 1
var time


func _ready() -> void:
	position.y = -39.0


func note(incometype):
	if position.y > -20.0:
		get_tree().root.get_node("Scene").get_node("notes").get_node(str(int(self.name)+4)).note(incometype)
	else:
		type = incometype
		if type == 2:
			get_tree().root.get_node("Scene").get_node("held").get_node(str(self.name)).start()
		going = true


func _physics_process(_delta: float) -> void:
	if going == true:
		position.y += 5


func _process(_delta: float) -> void:
	if position.y >= 686.0:
		if type == 3:
			get_tree().root.get_node("Scene").get_node("held").get_node(str(self.name)).end()
		going = false
		miss()
		position.y = -39.0


func miss():
	pass
