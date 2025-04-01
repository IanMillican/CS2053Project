extends Node3D
var ProjectileScene = preload("res://jetRes/projectile.tscn")
var projectile_instance
var jet_position
var jet_direction
var grade_score = 0

var fixed_global_rotation: Basis

var can_shoot = true
var shoot_cooldown = 0.35

var raycast
var camera 

func _ready() -> void:
	#ProjectileScene.set_meta("projectile", true)
	$Jet/GameMusic.play()
	DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN)
	raycast = $Jet/RayCast3D
	camera = $Jet/FrontCamera.get_viewport().get_camera_3d()

func _process(delta: float) -> void:
	if raycast.is_colliding():
		var collision_point = raycast.get_collision_point()
		# Convert the 3D collision point to screen coordinates.
		var screen_point = camera.unproject_position(collision_point)
		print(screen_point)
		$UI/TextureRect.position = screen_point
	else:
		$UI/TextureRect.position = get_viewport().size / 2
	#$Jet/FrontCamera.rotation = Vector3(0, 110, 0)
	if Input.is_action_pressed("ui_select") and can_shoot:
		print("Shot")
		$Jet/ShootSound.play()
		var barrel = $Jet/Barrel
		projectile_instance = ProjectileScene.instantiate()
		get_tree().current_scene.add_child(projectile_instance)
		projectile_instance.global_transform = barrel.global_transform
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
		get_tree().reload_current_scene()
	$UI/Label.text = "Current Grade: %s%%" % grade_score
	#var forward = global_transform.basis.z.normalized()
	# Move the Area3D in that direction
	$BigIan.position.z += 20.0 * delta
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


func _on_ian_mob_hit_jet(ianName: String) -> void:
	print("Hit Ian")
	grade_score -= 5
	_remove_out_of_bounds(ianName)


func _on_ian_mob_hit_goal(ianName: String) -> void:
	print("Hit goal")
	grade_score += 10
	_remove_out_of_bounds(ianName)


func _on_goal_zone_body_entered(body: Node3D) -> void:
	if body.is_in_group("jet"):
		get_tree().quit()


func _on_big_ian_body_entered(body: Node3D) -> void:
	if body.is_in_group("jet"):
		get_tree().quit()


func _on_barrier_body_entered(body: Node3D) -> void:
	if body.is_in_group("jet"):
		grade_score -= 5
		
func _remove_out_of_bounds(ianName: String):
	if ianName == "IanMob1":
		$OutOfBounds/Barrier.queue_free()
	if ianName == "IanMob2":
		$OutOfBounds/Barrier2.queue_free()
	if ianName == "IanMob3":
		$OutOfBounds/Barrier3.queue_free()
	if ianName == "IanMob4":
		$OutOfBounds/Barrier4.queue_free()
	if ianName == "IanMob5":
		$OutOfBounds/Barrier5.queue_free()
	if ianName == "IanMob6":
		$OutOfBounds/Barrier6.queue_free()
	if ianName == "IanMob7":
		$OutOfBounds/Barrier7.queue_free()
	if ianName == "IanMob8":
		$OutOfBounds/Barrier8.queue_free()
	if ianName == "IanMob9":
		$OutOfBounds/Barrier9.queue_free()
	if ianName == "IanMob10":
		$OutOfBounds/Barrier10.queue_free()


#func _on_barrier_area_entered(area: Area3D) -> void:
	#if area.is_in_group("projectiles"):
		#area.collision.disabled 
