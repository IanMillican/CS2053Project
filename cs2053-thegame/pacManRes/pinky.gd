extends Area2D

@onready var nav_agent = $NavigationAgent2D
@export var player: Node2D
@export var speed: float = 100.0
@export var lookahead_distance: float = 320.0  
@export_enum("blinky", "pinky", "inky", "clyde") var ghost_type: String
@export var scatter_corner: Vector2 = Vector2.ZERO

func _ready():
	match ghost_type:
		"pinky":
			speed = 100
		"blinky":
			speed = 110
		"inky":
			speed = 90
		"clyde":
			speed = 118
	nav_agent.target_position = get_pinky_target()

func _process(delta):
	nav_agent.target_position = get_target()

	if nav_agent.is_navigation_finished():
		return

	var next_point = nav_agent.get_next_path_position()
	var direction = (next_point - global_position).normalized()
	global_position += direction * speed * delta

func get_target():
	match ghost_type:
		"blinky":
			return player.global_position
		"pinky":
			return get_pinky_target()
		"inky":
			return get_inky_target()
		"clyde":
			return get_clyde_target()
		_:
			return player.global_position

func get_inky_target() -> Vector2:
	var blinky = get_tree().get_first_node_in_group("blinky") 
	if not blinky:
		return player.global_position
	if not player.has_method("getLastFacingDirection"):
		return player.global_position
	var dir = player.getLastFacingDirection().normalized()
	var ahead = player.global_position + dir * (lookahead_distance / 2)
	var vector = ahead - blinky.global_position
	return blinky.global_position + vector * 2

	
func get_clyde_target() -> Vector2:
	var distance = global_position.distance_to(player.global_position)
	if distance > 128:  # 8 tiles * 16 pixels
		return player.global_position
	else:
		return scatter_corner
	
func get_pinky_target() -> Vector2:
	if not player.has_method("getLastFacingDirection"):
		return player.global_position
	var dir = player.getLastFacingDirection()  # Vector2: e.g., (1, 0), (-1, 0), etc.
	return player.global_position + dir.normalized() * lookahead_distance
