extends Sprite2D

var going:bool = false
var type:int = 1
@onready var resetpos = position.y

# Selects which note sprite to send down
func note(incometype):
	if position.y > resetpos:
		# Redirects movement to the next sprite because it is already moving
		get_tree().root.get_node("Scene").get_node("notes").get_node(str(int(self.name)+4)).note(incometype)
	else:
		type = incometype
		if type == 2: # Starts cloning
			G.broken[int(int(self.name) - 4*floor(float(self.name) / 4.0))] = false
			get_tree().root.get_node("Scene").get_node("held").get_node(str(int(int(self.name) - 4*floor(float(self.name) / 4.0)))).going = true
		if type == 3: # Ends cloning
			get_tree().root.get_node("Scene").get_node("held").get_node(str(int(int(self.name) - 4*floor(float(self.name) / 4.0)))).going = false
		going = true

# Moves note down
func _physics_process(_delta: float) -> void:
	if going == true:
		position.y += 10

# Resets note once it goes offscreen + tells text if note is missed + resets if a held note is broken
func _process(_delta: float) -> void:
	if G.holdstatus[int(int(self.name) - 4*floor(float(self.name) / 4.0))] == 2 and type == 3:
		going = false
		position.y = resetpos
	if position.y >= 1296.0:
		get_tree().root.get_node("Scene").get_node("ratingtext").get_node(str(int(int(self.name) - 4*floor(float(self.name) / 4.0)))).display(0)
		if type == 2:
			G.broken[int(int(self.name) - 4*floor(float(self.name) / 4.0))] = true
	if position.y >= 1372.0:
		if type == 3: 
			get_tree().root.get_node("Scene").get_node("fill").get_node(str(int(int(self.name) - 4*floor(float(self.name) / 4.0)) + 4)).visible = false
		going = false
		position.y = resetpos

# Resets note once it is hit
func hit():
	going = false
	position.y = resetpos
