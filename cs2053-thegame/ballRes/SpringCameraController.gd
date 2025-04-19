extends Camera3D

@export var target : Node3D
var springConstant = 100.0
var dampConstant
var offset
var actualPosition
var velocity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dampConstant = 2.0 * sqrt(springConstant)
	offset = position - target.position
	actualPosition = position
	velocity = Vector3.ZERO
	#transform = transform.looking_at(target.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var idealPosition = target.position + offset
	var displacement = actualPosition - idealPosition
	var springAccel = (-springConstant * displacement) - (dampConstant * velocity)
	velocity += springAccel * delta
	actualPosition += velocity * delta
	position = actualPosition
	#transform = transform.looking_at(target.position)
