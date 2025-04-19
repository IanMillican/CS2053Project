extends CharacterBody3D

var speed = 20
var isRotatedLeft = false
var isRotatedRight = false
var isRotatedUp = false
var isRotatedDown = false

var target_roll: float = 0.0
var target_pitch: float = 0.0

@export var grade_score: int

# How quickly the jet rotates towards the target angles.
var roll_interp_speed: float = 5.0
var pitch_interp_speed: float = 5.0

signal collidedWall
signal unCollidedWall
var isCollidedWall = false
var isCollidedGround = false
signal shootProjectile

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	#$OmniLight3D.look_at(velocity.normalized().rotated(Vector3(0, 1, 0), -180))
	$OmniLight3D.position = ($OmniLight3D.position + position) * delta
	#if Input.is_action_just_pressed("shoot"):
		#shootProjectile.emit()
	
func _physics_process(delta: float) -> void:
	var vel = Vector3.ZERO
	vel.z += 1
	
	
	if Input.is_action_pressed("ui_left") and not isCollidedWall:
		vel.x += 1
		target_roll = deg_to_rad(-10)
		#if not isRotatedLeft:
			#isRotatedLeft = true
			#transform = transform.rotated_local(Vector3.FORWARD, -25)
	#if Input.is_action_just_released("ui_left"):
		#transform = transform.rotated_local(Vector3.FORWARD, 25)
		#isRotatedLeft = false
	elif Input.is_action_pressed("ui_right") and not isCollidedWall:
		vel.x -= 1
		target_roll = deg_to_rad(10)
		#if not isRotatedRight:
			#isRotatedRight = true
			#transform = transform.rotated_local(Vector3.FORWARD, 25)
	#if Input.is_action_just_released("ui_right"):
		#transform = transform.rotated_local(Vector3.FORWARD, -25)
		#isRotatedRight = false
	else:
		target_roll = 0
		
		
	if Input.is_action_pressed("ui_up") and not isCollidedGround:
		vel.y += 1
		target_pitch = deg_to_rad(-10)
		#if not isRotatedUp:
			#isRotatedUp = true
			#transform = transform.rotated_local(Vector3.RIGHT, 25)
	#if Input.is_action_just_released("ui_up"):
		#transform = transform.rotated_local(Vector3.RIGHT, -25)
		#isRotatedUp = false
	elif Input.is_action_pressed("ui_down") and not isCollidedGround:
		vel.y -= 1
		target_pitch = deg_to_rad(10)
		#if not isRotatedDown:
			#isRotatedDown = true
			#transform = transform.rotated_local(Vector3.LEFT, 25)
	#if Input.is_action_just_released("ui_down"):
		#transform = transform.rotated_local(Vector3.LEFT, -25)
		#isRotatedDown = false
	else:
		target_pitch = 0
	
	rotation.z = lerp_angle(rotation.z, target_roll, roll_interp_speed * delta)
	rotation.x = lerp_angle(rotation.x, target_pitch, pitch_interp_speed * delta)
	
	if vel != Vector3.ZERO:
		vel= vel.normalized() * speed
	velocity = vel
	move_and_slide()


func _on_collision_area_body_entered(body: Node3D) -> void:
	if body.name != "Jet" and body.is_in_group("walls"):
		print("Hit")
		#collidedWall.emit()
		isCollidedWall = true
	if body.name != "Jet" and body.is_in_group("ground"):
		print("Hit")
		isCollidedGround = true

func _on_collision_area_body_exited(body: Node3D) -> void:
	if body.name != "Jet" and body.is_in_group("walls"):
		#unCollidedWall.emit()
		isCollidedWall = false
	if body.name != "Jet" and body.is_in_group("ground"):
		isCollidedGround = false
#func _set_Collision_Wall() -> void:
	#isCollidedWall = true
	#print("Hi")
	#
#func _set_Uncollision_Wall() -> void:
	#isCollidedWall = false
