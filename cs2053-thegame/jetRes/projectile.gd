extends Area3D

var speed  = 75.0

func _ready():
	add_to_group("projectiles")

func _physics_process(delta: float) -> void:
	var forward = global_transform.basis.z.normalized()
	# Move the Area3D in that direction
	position += forward * speed * delta

func set_movement(positionIn: Vector3, directionIn: Vector3) -> void:
	position = positionIn
	rotation = directionIn
