extends Area3D

var health = 3

func _process(delta: float) -> void:
	if health <= 0:
		queue_free()

func _on_area_entered(area: Area3D) -> void:
	print("hello")
	if area.is_in_group("projectiles"):
		print("hi")
		area.queue_free()
		health -= 1
