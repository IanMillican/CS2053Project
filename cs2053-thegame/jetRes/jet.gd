extends CharacterBody3D

var speed = 10
var isRotatedLeft = false
var isRotatedRight = false
var isRotatedUp = false
var isRotatedDown = false

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var vel = Vector3.ZERO
	vel.z += 1
	
	
	if Input.is_action_pressed("ui_left"):
		vel.x += 1
		if not isRotatedLeft:
			isRotatedLeft = true
			transform = transform.rotated_local(Vector3.FORWARD, -25)
	if Input.is_action_just_released("ui_left"):
		transform = transform.rotated_local(Vector3.FORWARD, 25)
		isRotatedLeft = false
		
		
	if Input.is_action_pressed("ui_right"):
		vel.x -= 1
		if not isRotatedRight:
			isRotatedRight = true
			transform = transform.rotated_local(Vector3.FORWARD, 25)
	if Input.is_action_just_released("ui_right"):
		transform = transform.rotated_local(Vector3.FORWARD, -25)
		isRotatedRight = false
		
		
	if Input.is_action_pressed("ui_up"):
		vel.y += 1
		if not isRotatedUp:
			isRotatedUp = true
			transform = transform.rotated_local(Vector3.RIGHT, 25)
	if Input.is_action_just_released("ui_up"):
		transform = transform.rotated_local(Vector3.RIGHT, -25)
		isRotatedUp = false
		
		
	if Input.is_action_pressed("ui_down"):
		vel.y -= 1
		if not isRotatedDown:
			isRotatedDown = true
			transform = transform.rotated_local(Vector3.LEFT, 25)
	if Input.is_action_just_released("ui_down"):
		transform = transform.rotated_local(Vector3.LEFT, -25)
		isRotatedDown = false
		
	
	if vel != Vector3.ZERO:
		vel= vel.normalized() * speed
	velocity = vel
	move_and_slide()
