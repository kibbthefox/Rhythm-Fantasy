extends Sprite2D

var going:bool = false
var time:int = 16
var clonebool:bool = false


func _ready() -> void:
	position.y = -680.0

# Clones every beat when active
func _physics_process(_delta: float) -> void:
	if going == true:
		time +=  1
		if time > 15:
			clone()
			time = 1
	if clonebool == true:
		position.y += 10

# Deletes Clones
func _process(_delta: float) -> void:
	if position.y >= 1454.0:
		self.queue_free()

# Clones
func clone():
	var copy = self.duplicate()
	copy.clonebool = true
	get_parent().add_child(copy)
