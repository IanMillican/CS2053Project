extends Node3D
var ProjectileScene = preload("res://jetRes/projectile.tscn")
var projectile_instance
var jet_position
var jet_direction

func _ready() -> void:
	ProjectileScene.set_meta("projectile", true)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		projectile_instance = ProjectileScene.instantiate()
		get_tree().current_scene.add_child(projectile_instance)
		projectile_instance.add_to_group("projectile")
		jet_position = $Jet.position
		jet_direction = $Jet.rotation

#func _on_jet_collided_wall() -> void:
	#$Jet._set_Collision_Wall()
#
#
#func _on_jet_un_collided_wall() -> void:
	#$Jet._set_Uncollision_Wall()


func _on_jet_shoot_projectile() -> void:
	if projectile_instance != null:
		projectile_instance.set_movement(jet_position, jet_direction)


func _on_ian_test_area_entered(area: Area3D) -> void:
	if area.is_in_group("projectile"):
		print("projectile")
	else:
		print("jet")
