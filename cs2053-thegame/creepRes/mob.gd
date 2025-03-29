extends RigidBody2D
var screenSize
@export var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screenSize = get_viewport_rect().size
	$AnimatedSprite2D.animation = "Prof"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var player = get_node("/root/Node/player")
	var playerLoc = player.position
	look_at(playerLoc)

	direction = (playerLoc - position).normalized()
	var speed = randf_range(100.0,200.0)
	linear_velocity = direction * speed


func mod_exited_screen() -> void:
	queue_free()
