extends Area3D

signal hitIan(name)


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		hitIan.emit(name)
