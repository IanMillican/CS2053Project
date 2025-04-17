extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().root.content_scale_size = Vector2(1120,1240)
	DisplayServer.window_set_size(Vector2(1104,1240))
	$Pinky/AnimatedSprite2D.material.set_shader_parameter("tint_color", Color(1.0, 0.75, 0.8)) # pink
	$Blinky/AnimatedSprite2D.material.set_shader_parameter("tint_color", Color(1.0, 0.0, 0.0)) # red
	$Inky/AnimatedSprite2D.material.set_shader_parameter("tint_color", Color(0.0, 1.0, 1.0)) # cyan
	$Clyde/AnimatedSprite2D.material.set_shader_parameter("tint_color", Color(1.0, 0.65, 0.0)) # orange

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
