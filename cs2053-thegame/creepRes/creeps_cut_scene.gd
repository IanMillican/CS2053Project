extends Node2D

@onready var label = $Label
var currentLine = 0
var leftAlign = false

var lines = [
	"Okay okay that first game wasn't so hard!",
	"You just wait, they get harder",
	"What you mean they get harder? \nAren't we just mkaing fun easy games?",
	"If that's what you expect you're in a long term.",
	"Woah woah woah what just happened??",
	"What do you mean what happened?",
	"WHY AM I PAC-MAN NOW???",
	"You've literally always been Pac-Man, \nI don't know what you're so worked up about."
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = lines[currentLine]
	get_tree().root.content_scale_size = Vector2(1920,1080)
	DisplayServer.window_set_size(Vector2(1920,1080))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_button_pressed() -> void:
	currentLine += 1
	if currentLine == 8:
		get_tree().change_scene_to_file("res://pacManRes/2Dpac-man.tscn")
	else:
		if leftAlign:
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		else:
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		leftAlign = !leftAlign
		label.text = lines[currentLine]
	if currentLine == 4:
		$player.visible = false
		$AnimatedSprite2D.visible = true
