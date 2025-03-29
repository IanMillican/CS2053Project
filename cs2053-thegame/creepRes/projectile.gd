extends Area2D
@export var dir = Vector2.ZERO
var screenSize = get_viewport_rect().size
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screenSize = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 
	
func _physics_process(delta: float) -> void:
	var vel = dir*speed*delta
	position += vel
	if position.x > screenSize.x or position.x < 0:
		queue_free()
	elif position.y > screenSize.y or position.y < 0:
		queue_free()


func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
