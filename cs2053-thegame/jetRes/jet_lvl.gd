extends Node3D
var ProjectileScene = preload("res://jetRes/projectile.tscn")
var projectile_instance
var jet_position
var jet_direction
var grade_score = 0

var can_shoot = true
var shoot_cooldown = 0.5

func _ready() -> void:
	#ProjectileScene.set_meta("projectile", true)
	$Jet/GameMusic.play()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and can_shoot:
		print("Shot")
		$Jet/ShootSound.play()
		projectile_instance = ProjectileScene.instantiate()
		get_tree().current_scene.add_child(projectile_instance)
		jet_position = $Jet.position
		jet_direction = $Jet.rotation
		projectile_instance.set_movement(jet_position, jet_direction)
		can_shoot = false
		await get_tree().create_timer(shoot_cooldown).timeout
		can_shoot = true
	if Input.is_action_pressed("rear_cam"):
		$Jet/BackCamera.current = true
		$Jet/FrontCamera.current = false
	else:
		$Jet/BackCamera.current = false
		$Jet/FrontCamera.current = true
	if grade_score < 0:
		get_tree().quit()
	$UI/Label.text = "Current Grade (%%): %s%%" % grade_score
	#var forward = global_transform.basis.z.normalized()
	# Move the Area3D in that direction
	$BigIan.position.z += 1.0 * delta
#func _on_jet_collided_wall() -> void:
	#$Jet._set_Collision_Wall()
#
#
#func _on_jet_un_collided_wall() -> void:
	#$Jet._set_Uncollision_Wall()

#func shoot_projectile() -> void:
	#projectile_instance = ProjectileScene.instantiate()
	#get_tree().current_scene.add_child(projectile_instance)
	#jet_position = $Jet.position
	#jet_direction = $Jet.rotation

func _on_jet_shoot_projectile() -> void:
	if projectile_instance != null:
		projectile_instance.set_movement(jet_position, jet_direction)


func _on_ian_mob_hit_jet() -> void:
	print("Hit Ian")
	grade_score -= 5


func _on_ian_mob_hit_goal() -> void:
	print("Hit goal")
	grade_score += 10


func _on_goal_zone_body_entered(body: Node3D) -> void:
	if body.is_in_group("jet"):
		get_tree().quit()
