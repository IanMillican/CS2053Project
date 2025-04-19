extends Node2D

var label: Label
var currentLine = 0
var leftAlign = false

var lines = [
	"Where am I?!",
	"You fell asleep while studying, so naturally \nyour subconcious has chosen to punish you",
	"Why is my subconcious my CS2053 prof",
	"WhY iS mY sUbCoNcIoUs mY cS2053 pRof???",
	"...",
	"...",
	"real mature",
	"You have to complete a series of levels \nbased on your assignments to get out of here."
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = $Label
	label.text = lines[currentLine]
	get_tree().root.content_scale_size = Vector2(1920,1080)
	DisplayServer.window_set_size(Vector2(1920,1080))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func introButton() -> void:
	print("button Pressed")
	currentLine += 1
	if currentLine == 8:
		get_tree().change_scene_to_file("res://creepRes/level1Creeps.tscn")
	else:
		if leftAlign:
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		else:
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		leftAlign = !leftAlign
		label.text = lines[currentLine]
	if currentLine == 7:
		$player.visible = true
		$AnimatedSprite2D.visible = false
