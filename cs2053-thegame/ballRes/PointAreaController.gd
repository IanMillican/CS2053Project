extends Area3D

signal hitGoal(name: String)

func _on_body_entered(body: Node3D) -> void:
	print("Didn't enter")
	if body.is_in_group("player"):
		hitGoal.emit(name)
		print("HEEEE")
