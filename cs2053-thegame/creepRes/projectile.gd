extends Area2D
@export var dir = Vector2.ZERO
var screenSize = get_viewport_rect().size
@export var speed = 300
signal win 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var main = get_node("/root/main")
	connect("win",Callable(main, "_on_win"))
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
	if body.hit == true:
		return
	body.hit = true
	var parent = get_parent()
	parent.score += 1
	var score = parent.score
	var grade = float(score) / 20
	print(grade)
	parent.get_node("Control/ScoreLabel").text = "Grade: %.2f%% (%s)" % [grade*100, calcGrade(grade*100)]
	if score == 20:
		win.emit()
	body.queue_free()
	queue_free() 
	
func calcGrade(percent: int) -> String:
	if percent <= 45:
		return "F"
	elif percent <= 50:
		return "D"
	elif percent <= 55:
		return "C"
	elif percent <= 60:
		return "C+"
	elif percent <= 65:
		return "B-"
	elif percent <= 70:
		return "B"
	elif percent <= 75:
		return "B+"
	elif percent <= 80:
		return "A-"
	elif percent <= 90:
		return "A"
	else:
		return "A+"
