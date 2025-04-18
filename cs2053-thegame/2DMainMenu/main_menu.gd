extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().root.content_scale_size = Vector2(1920,1080)
	DisplayServer.window_set_size(Vector2(1920,1080))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
