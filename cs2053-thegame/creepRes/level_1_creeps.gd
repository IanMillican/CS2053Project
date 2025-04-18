extends Node
@export var mobScene: PackedScene
@export var projectileScene: PackedScene
@export var score = 0
var delay = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	$player.start($startPos.position)
	$startTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		if delay % 20 == 0:
			var projectile = projectileScene.instantiate()
			projectile.position =$player.position
			projectile.dir = $player.velocity.normalized()
			projectile.speed = $player.speed + 100
			add_child(projectile)
	delay += 1

func _on_mob_timer_timeout() -> void:
	#Position the mob
	var mob = mobScene.instantiate()
	var spawnLoc = $mobPath/spawnLocation
	spawnLoc.progress_ratio = randf()
	mob.position = spawnLoc.position
	mob.look_at($player.position)
	
	#Rotate the mob
	var direction = ($player.position - mob.position).normalized()
	var speed = randf_range(150.0, 250.0)
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = direction * speed
	#Add the mob to the scene
	add_child(mob)

func gameOver() -> void:
	$scoreTimer.stop()
	$mobTimer.stop()
	
func newGame() -> void:
	score = 0
	$player.start($startPos.position)
	$startTimer.start()

func _on_start_timer_timeout() -> void:
	$mobTimer.start()
	$scoreTimer.start()
	
func _on_player_hit() -> void:
	$Control/LoseScreen.visible = true
	get_tree().paused = true

func _on_lose_screen_canceled() -> void:
	get_tree().change_scene_to_file("res://2DMainMenu/mainMenu.tscn")

func _on_lose_screen_confirmed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func _on_win():
	$Control/WinScreen.visible = true
	get_tree().paused = true


func _on_win_screen_confirmed() -> void:
	get_tree().change_scene_to_file("res://creepRes/CreepsCutScene.tscn")
