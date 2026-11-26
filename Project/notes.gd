extends Sprite2D

var going:bool = false
var type:int = 1


func _ready() -> void:
	position.y = -78.0

# Selects which note sprite to send down
func note(incometype):
	if position.y > -60.0:
		# Redirects movement to the next sprite because it is already moving
		get_tree().root.get_node("Scene").get_node("notes").get_node(str(int(self.name)+4)).note(incometype)
	else:
		type = incometype
		if type == 2: # Starts cloning
			get_tree().root.get_node("Scene").get_node("held").get_node(str(int(int(self.name) - 4*floor(float(self.name) / 4.0)))).going = true
		if type == 3: # Ends cloning
			get_tree().root.get_node("Scene").get_node("held").get_node(str(int(int(self.name) - 4*floor(float(self.name) / 4.0)))).going = false
		going = true

# Moves note down
func _physics_process(_delta: float) -> void:
	if going == true:
		position.y += 10

# Resets note once it goes offscreen
func _process(_delta: float) -> void:
	if position.y >= 1372.0:
		going = false
		position.y = -78.0
