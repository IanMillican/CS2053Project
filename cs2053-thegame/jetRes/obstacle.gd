extends Node3D

signal hitGoal

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("jet") and $Area3D:
		hitGoal.emit()
		$Area3D.queue_free()


func _on_walls_area_entered(area: Area3D) -> void:
	print(area.name)
	if area.is_in_group("projectiles"):
		print("BGGF")
		area.queue_free()
