
extends Node2D
@onready var profAnimation = $CanvasLayer2/prof/AnimatedSprite2D
@onready var label = $CanvasLayer3/Label
var currentLine = 0
var leftAlign = false

var lines = [
	"I recognized the mario level, but why was it sideways?",
	"You mixed up your axis on your assignment",
	"Ah.. well why did I stop being mario?",
	"You changed the location of your mario sprite in your directory.",
	"I see...Well why am I a cartoon again?",
	"With the frizz, no way!!",
	"What are you even talking about..."
	,"Are you a jets fan?"
	
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
		get_tree().change_scene_to_file("res://jetRes/JetLvl.tscn")
	else:
		if leftAlign:
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		else:
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		leftAlign = !leftAlign
		label.text = lines[currentLine]
		if currentLine % 2 != 0:
			profAnimation.play("profAnimation")
		else:
			profAnimation.stop()
		
