extends Sprite2D

var going:bool = false
var time:int = 16
var clonebool:bool = false


func _ready() -> void:
	position.y = -86.0


func _physics_process(_delta: float) -> void:
	if going == true:
		time +=  1
		if time > 15:
			clone()
			time = 1
	if clonebool == true:
		position.y += 5


func _process(_delta: float) -> void:
	if position.y >= 727.0:
		pass


func start():
	going = true
	print("started")
	
func end():
	going = false


func clone():
	print("clonestart")
	var copy = self.duplicate()
	copy.clonebool = true
	copy.position = position
	get_parent().add_child(copy)
	print("cloned")
