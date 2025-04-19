extends AcceptDialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_child(1, true).horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER 
	get_child(1, true).vertical_alignment = VERTICAL_ALIGNMENT_CENTER 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
