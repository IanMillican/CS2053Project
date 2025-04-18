extends Node2D

@onready var label = $Label
var currentLine = 0
var leftAlign = false

var lines = [
	"Where'd the other three of you go???",
	"Don't worry about that",
	"That level was hard, man oh man!",
	"You think that was hard you just wait",
	".....",
	".....",
	"Why am I Mario now?",
	"You'll see"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = lines[currentLine]
	get_tree().root.content_scale_size = Vector2(1920,1080)
	DisplayServer.window_set_size(Vector2(1920,1080))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	currentLine += 1
	if currentLine == 8:
		get_tree().change_scene_to_file("res://2DMainMenu/mainMenu.tscn")
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
