extends Area2D
signal hit
@export var speed = 300
var screenSize


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screenSize = get_viewport_rect().size
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	elif Input.is_action_pressed("down"):
		velocity.y += 1
	elif Input.is_action_pressed("left"):
		velocity.x -= 1
	elif Input.is_action_pressed("right"):
		velocity.x += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized()
		velocity = velocity * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position.x = fposmod(position.x, screenSize.x)
	position.y = fposmod(position.y, screenSize.y)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0

func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()
	#Waits until collision is fully handled before disable
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
