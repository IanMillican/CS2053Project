extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	var mainNode = get_parent().get_parent()
	mainNode.score += 1
	var score = mainNode.score
	var scoreLabel = mainNode.get_node("Control/Score")
	scoreLabel.text = "Score: %d" % score
	queue_free()
