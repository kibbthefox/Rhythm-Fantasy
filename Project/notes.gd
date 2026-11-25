extends Sprite2D

var going = false


func _ready() -> void:
	position.y = -39.0


func start():
	going = true


func _physics_process(_delta: float) -> void:
	if going == true:
		position.y += 5


func _process(_delta: float) -> void:
	if position.y >= 686.0:
		going = false
		miss()
		position.y = -39.0


func miss():
	pass
