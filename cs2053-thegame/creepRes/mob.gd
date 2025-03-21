extends RigidBody2D
var screenSize
@export var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screenSize = get_viewport_rect().size
	var spritePick = randi() % 3 + 1
	if spritePick == 1:
		$AnimatedSprite2D.animation = "fly"
	elif spritePick == 2:
		$AnimatedSprite2D.animation = "swim"
	else:
		$AnimatedSprite2D.animation = "walk"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func mod_exited_screen() -> void:
	queue_free()
