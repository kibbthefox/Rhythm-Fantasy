extends Sprite2D

var going:bool = false
var time:int = 16
var clonebool:bool = false


func _ready() -> void:
	position.y = -1096.0

# Clones every beat when active and moves them forward
func _physics_process(_delta: float) -> void:
	if going == true:
		time +=  1
		if time > 15:
			clone()
			time = 1
	if clonebool == true:
		position.y += 10
	# Deletes all clones if the key is lifted

# Deletes Clones
func _process(_delta: float) -> void:
	if position.y >= 1454.0:
		queue_free()
	if clonebool == false:
		if G.broken[int(self.name)] == true:
			G.holdstatus[int(self.name)] = 2
			going = false
			get_tree().call_group("clones", "queue_free")

# Clones
func clone():
	var copy = self.duplicate()
	copy.clonebool = true
	copy.add_to_group("clones")
	get_parent().add_child(copy)
