extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().root.content_scale_size = Vector2(1104,1240)
	DisplayServer.window_set_size(Vector2(1104,1240))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
