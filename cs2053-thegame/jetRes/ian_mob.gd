extends Node3D

var health = 3

signal hitJet
signal hitGoal

func _process(delta: float) -> void:
	if health <= 0 and $IanMobArea:
		$IanMobArea.queue_free()
	elif health == 2:
		var material = $IanMobArea/MeshInstance3D.get_active_material(0)
		if material:
			# Duplicate the material so that changes only affect this instance.
			material = material.duplicate()
			material.resource_local_to_scene = true
			$IanMobArea/MeshInstance3D.set_surface_override_material(0, material)
			material.albedo_color = Color("#ffadad")
	elif health == 1:
		var material = $IanMobArea/MeshInstance3D.get_active_material(0)
		if material:
			material = material.duplicate()
			material.resource_local_to_scene = true
			$IanMobArea/MeshInstance3D.set_surface_override_material(0, material)
			material.albedo_color = Color("#c40034")

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("projectiles"):
		print("hit")
		area.queue_free()
		$LaserHit.play()
		health -= 1


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("jet"):
		if $Obstacle/Area3D:
			$Obstacle/Area3D.queue_free()
			hitJet.emit()


func _on_obstacle_hit_goal() -> void:
	hitGoal.emit()
