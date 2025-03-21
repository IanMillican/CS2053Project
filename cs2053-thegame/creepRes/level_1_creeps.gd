extends Node
@export var mobScene: PackedScene
var score
var screenSize

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mob_timer_timeout() -> void:
	#Position the mob
	var mob = mobScene.instantiate()
	var spawnLoc = $mobPath/spawnLocation
	spawnLoc.progress_ratio = randf()
	mob.position = spawnLoc.position
	#Rotate the mob
	var direction = spawnLoc.rotation + PI/2
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	#Add the mob to the scene
	add_child(mob)

func gameOver() -> void:
	$scoreTimer.stop()
	$mobTimer.stop()
	
func newGame() -> void:
	score = 0
	$player.start($startPos.position)
	$startTimer.start()

func _on_score_timer_timeout() -> void:
	score += 1

func _on_start_timer_timeout() -> void:
	$mobTimer.start()
	$scoreTimer.start()
