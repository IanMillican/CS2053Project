extends RigidBody3D

var speed = 20

func _physics_process(delta: float) -> void:
	var forceDirection = Vector3(0,0,0)
	forceDirection.z+=1*delta
	#if Input.is_action_pressed("ui_up"):
		#forceDirection.z+=1
	#if Input.is_action_pressed("ui_down"):
		#forceDirection.z-=1
	if Input.is_action_pressed("ui_right"):
		forceDirection.x-=3*delta
	if Input.is_action_pressed("ui_left"):
		forceDirection.x+=3*delta
	#initial push onto the ball in the forceDirection with forcePower
	apply_impulse(forceDirection*speed)
