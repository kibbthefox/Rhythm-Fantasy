extends Sprite2D

var keybind:String = "v"
var active:Array = [-1000.0,-1000.0,-1000.0,-1000.0]
var w1:int = 0
var w2:int = 0
@onready var path = get_tree().root.get_node("Scene").get_node("notes")

# sets default keybind for each key
func _ready() -> void:
	if self.name == "1":
		keybind = "b"
	elif self.name == "2":
		keybind = "n"
	elif self.name == "3":
		keybind = "m"


func _input(_event: InputEvent) -> void:
	# Visual of if note is pressed fown
	if Input.is_action_pressed(str(keybind)):
		get_tree().root.get_node("Scene").get_node("fill").get_node(str(self.name)).visible = true
	else:
		get_tree().root.get_node("Scene").get_node("fill").get_node(str(self.name)).visible = false
	# Finds the closest note
	if Input.is_action_just_pressed(str(keybind)):
		for i in 4:
			if path.get_node(str(int(self.name)+4*i)).position.y > -639.0:
				active[i] = path.get_node(str(int(self.name)+4*i)).position.y
			else:
				active[i] = -1000.0
		if abs(1176.0 - active[0]) < abs(1176.0 - active[1]):
			w1 = 0
		else:
			w1 = 1
		if abs(1176.0 - active[2]) < abs(1176.0 - active[3]):
			w2 = 2
		else:
			w2 = 3
		if abs(1176.0 - active[w1]) < abs(1176.0 - active[w2]):
			hit(int(self.name)+w1*4,path.get_node(str(int(self.name)+w1*4)).type)
		else:
			hit(int(self.name)+w2*4 ,path.get_node(str(int(self.name)+w2*4)).type)

# Adds points based on distance and tells notes they are hit
func hit(note:int,type:int):
	if path.get_node(str(note)).position.y >= 1156 and 1196 >= path.get_node(str(note)).position.y:
		path.get_node(str(note)).hit()
		get_tree().root.get_node("Scene").get_node("ratingtext").get_node(str(self.name)).display(3)
		G.points += 400
	elif path.get_node(str(note)).position.y >= 1116 and 1236 >= path.get_node(str(note)).position.y:
		path.get_node(str(note)).hit()
		get_tree().root.get_node("Scene").get_node("ratingtext").get_node(str(self.name)).display(2)
		G.points += 200
	elif path.get_node(str(note)).position.y >= 1076 and 1276 >= path.get_node(str(note)).position.y :
		path.get_node(str(note)).hit()
		get_tree().root.get_node("Scene").get_node("ratingtext").get_node(str(self.name)).display(1)
		G.points += 100
	else:
		get_tree().root.get_node("Scene").get_node("ratingtext").get_node(str(self.name)).display(0)
