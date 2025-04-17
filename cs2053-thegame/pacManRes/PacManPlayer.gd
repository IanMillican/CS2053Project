extends CharacterBody2D


const SPEED = 300.0

func _ready() -> void:
	$AnimatedSprite2D.animation = "stillRight"
	$AnimatedSprite2D.play()

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.play()
		direction.y -= 1
	if Input.is_action_just_released("up"):
		$AnimatedSprite2D.animation = "stillUp"
		$AnimatedSprite2D.play()
	if Input.is_action_pressed("down"):
		$AnimatedSprite2D.animation = "down"
		$AnimatedSprite2D.play()
		direction.y += 1
	if Input.is_action_just_released("down"):
		$AnimatedSprite2D.animation = "stillDown"
		$AnimatedSprite2D.play()
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.animation = "left"
		$AnimatedSprite2D.play()
		direction.x -= 1
	if Input.is_action_just_released("left"):
		$AnimatedSprite2D.animation = "stillLeft"
		$AnimatedSprite2D.play()
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.animation = "right"
		$AnimatedSprite2D.play()
		direction.x += 1
	if Input.is_action_just_released("right"):
		$AnimatedSprite2D.animation = "stillRight"
		$AnimatedSprite2D.play()
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	velocity = direction * SPEED
	
	move_and_slide()
