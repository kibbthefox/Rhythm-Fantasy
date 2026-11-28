extends Sprite2D

var keybind:String = "v"
var active:Array = [-1000.0,-1000.0,-1000.0,-1000.0,-1000.0,-1000.0]
var w1:int = 0
var w2:int = 0
var w3:int = 0
var three = false
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
	# Finds the closest note when key is released
	if Input.is_action_just_released(str(keybind)):
		for i in 6:
			if path.get_node(str(int(self.name)+4*i)).position.y > -639.0:
				active[i] = path.get_node(str(int(self.name)+4*i)).position.y
			else:
				active[i] = -1000.0 - i
		if abs(1176.0 - active[0]) < abs(1176.0 - active[1]):
			w1 = 0
		else:
			w1 = 1
		if abs(1176.0 - active[2]) < abs(1176.0 - active[3]):
			w2 = 2
		else:
			w2 = 3
		if abs(1176.0 - active[w1]) < abs(1176.0 - active[w2]) and \
		abs(1176.0 - active[w1]) < abs(1176.0 - active[w3]):
			if path.get_node(str(int(self.name)+w1*4)).type == 3:
				if path.get_node(str(int(self.name)+w1*4)).position.y >= 1026 and 1326 >= path.get_node(str(int(self.name)+w1*4)).position.y:
					three = true
				hit(int(self.name)+w1*4,3)
		elif abs(1176.0 - active[w2]) < abs(1176.0 - active[w1]) and \
		abs(1176.0 - active[w2]) < abs(1176.0 - active[w3]):
			if path.get_node(str(int(self.name)+w2*4)).type == 3:
				if path.get_node(str(int(self.name)+w2*4)).position.y >= 1026 and 1326 >= path.get_node(str(int(self.name)+w2*4)).position.y:
					three = true
				hit(int(self.name)+w2*4,3)
		elif abs(1176.0 - active[w3]) < abs(1176.0 - active[w1]) and \
		abs(1176.0 - active[w3]) < abs(1176.0 - active[w2]):
			if path.get_node(str(int(self.name)+w3*4)).type == 3:
				if path.get_node(str(int(self.name)+w3*4)).position.y >= 1026 and 1326 >= path.get_node(str(int(self.name)+w3*4)).position.y:
					three = true
				hit(int(self.name)+w3*4,3)

	# Visual of if note is pressed down
	if Input.is_action_pressed(str(keybind)):
		get_tree().root.get_node("Scene").get_node("fill").get_node(str(self.name)).visible = true
		get_tree().root.get_node("Scene").get_node("fill").get_node(str(int(self.name)+4)).visible = true
	else:
		get_tree().root.get_node("Scene").get_node("fill").get_node(str(self.name)).visible = false
	# Finds the closest note when key is pressed
	if Input.is_action_just_pressed(str(keybind)):
		for i in 6:
			if path.get_node(str(int(self.name)+4*i)).position.y > -1335.0:
				active[i] = path.get_node(str(int(self.name)+4*i)).position.y
			else:
				active[i] = -1335.0 - i
		if abs(1176.0 - active[0]) < abs(1176.0 - active[1]):
			w1 = 0
		else:
			w1 = 1
		if abs(1176.0 - active[2]) < abs(1176.0 - active[3]):
			w2 = 2
		else:
			w2 = 3
		if abs(1176.0 - active[4]) < abs(1176.0 - active[5]):
			w3 = 4
		else:
			w3 = 5
		if abs(1176.0 - active[w1]) < abs(1176.0 - active[w2]) and \
		abs(1176.0 - active[w1]) < abs(1176.0 - active[w3]):
			if path.get_node(str(int(self.name)+w1*4)).type == 1 or path.get_node(str(int(self.name)+w1*4)).type == 2:
				hit(int(self.name)+w1*4,path.get_node(str(int(self.name)+w1*4)).type)
		elif abs(1176.0 - active[w2]) < abs(1176.0 - active[w1]) and \
		abs(1176.0 - active[w2]) < abs(1176.0 - active[w3]):
			if path.get_node(str(int(self.name)+w2*4)).type == 1 or path.get_node(str(int(self.name)+w2*4)).type == 2:
				hit(int(self.name)+w2*4 ,path.get_node(str(int(self.name)+w2*4)).type)
		elif abs(1176.0 - active[w3]) < abs(1176.0 - active[w1]) and \
		abs(1176.0 - active[w3]) < abs(1176.0 - active[w2]):
			if path.get_node(str(int(self.name)+w3*4)).type == 1 or path.get_node(str(int(self.name)+w3*4)).type == 2:
				hit(int(self.name)+w3*4 ,path.get_node(str(int(self.name)+w3*4)).type)

# Adds points based on distance and tells notes they are hit
func hit(note:int,type:int):
	if type != 3 or G.holdstatus[int(self.name)] == 1 and type == 3:
		if type == 2:
			G.holdstatus[int(self.name)] = 1
		if path.get_node(str(note)).position.y >= 1156 and 1196 >= path.get_node(str(note)).position.y:
			path.get_node(str(note)).hit()
			get_tree().root.get_node("Scene").get_node("ratingtext").get_node(str(self.name)).display(3)
			G.points += 40 * (1.0 + G.combo/100.0)
			G.combo += 1
		elif path.get_node(str(note)).position.y >= 1106 and 1246 >= path.get_node(str(note)).position.y:
			path.get_node(str(note)).hit()
			get_tree().root.get_node("Scene").get_node("ratingtext").get_node(str(self.name)).display(2)
			G.points += 20 * (1.0 + G.combo/100.0)
			G.combo += 1
		elif path.get_node(str(note)).position.y >= 1026 and 1326 >= path.get_node(str(note)).position.y :
			path.get_node(str(note)).hit()
			get_tree().root.get_node("Scene").get_node("ratingtext").get_node(str(self.name)).display(1)
			G.points += 10 * (1.0 + G.combo/100.0)
			G.combo += 1
		else:
			get_tree().root.get_node("Scene").get_node("ratingtext").get_node(str(self.name)).display(0)
			G.combo = 0

# deletes line+note if hold is broken
func _process(_delta: float) -> void:
	if G.holdstatus[int(self.name)] == 1:
		if Input.is_action_just_released(str(keybind)) and three == false:
			print(three)
			G.holdstatus[int(self.name)] = 2
			G.combo = 0
			G.broken[int(self.name)] = true
		elif three == true:
			print(three)
			G.holdstatus[int(self.name)] = 0
			three = false
