extends CharacterBody2D

var lastDirection = Vector2.RIGHT
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
		lastDirection = direction
	velocity = direction * SPEED
	var screen_size = get_viewport_rect().size

	if position.x < 0:
		position.x = screen_size.x
	elif position.x > screen_size.x:
		position.x = 0
	move_and_slide()
	
func getLastFacingDirection():
	return lastDirection


func _on_object_body_entered(body: Node2D) -> void:
	if not body.is_class("CharacterBody2D"):
		print(body.get_class())
		return
	var scoreLabel = get_parent().get_node("Control/Score")
	get_parent().score += 5
	var score = get_parent().score
	scoreLabel.text = "Score %d" % score
	if position.x > 500:
		if position.y < 500:
			get_parent().get_node("Object2").queue_free()
		else:
			get_parent().get_node("Object4").queue_free()
	else:
		if position.y < 500:
			get_parent().get_node("Object").queue_free()
		else:
			get_parent().get_node("Object3").queue_free()
