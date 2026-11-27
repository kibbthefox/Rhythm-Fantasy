extends RichTextLabel

var ratings:Array = ["</3","eh","swag","my boy"]
var ratings2:Array = ["</3","eh","swag","gay"]
var inprogress:bool = false
var tween
var gayrating:bool = false


func _ready() -> void:
	modulate.a = 0.0

# Makes rating text appear + changes it
func display(rating):
	if inprogress == true:
		tween.kill()
	if gayrating == false:
		self.text = ratings[rating]
	else:
		self.text = ratings2[rating]
	inprogress = true
	modulate.a = 1.0
	tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
	await tween.finished
	inprogress = false
