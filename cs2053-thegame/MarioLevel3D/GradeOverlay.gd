extends Label

var grade = 0;
var jumps = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Grade: %s" % grade


func _on_main_increment() -> void:
	jumps = jumps + 1;
	grade = (jumps/16.0)*100.0;
