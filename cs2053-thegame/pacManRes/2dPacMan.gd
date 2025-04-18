extends Node2D
@export var score = 0
var canExit = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().root.content_scale_size = Vector2(1120,1560)
	DisplayServer.window_set_size(Vector2(1104,1560))
	$Pinky/AnimatedSprite2D.material.set_shader_parameter("tint_color", Color(1.0, 0.75, 0.8)) # pink
	$Blinky/AnimatedSprite2D.material.set_shader_parameter("tint_color", Color(1.0, 0.0, 0.0)) # red
	$Inky/AnimatedSprite2D.material.set_shader_parameter("tint_color", Color(0.0, 1.0, 1.0)) # cyan
	$Clyde/AnimatedSprite2D.material.set_shader_parameter("tint_color", Color(1.0, 0.65, 0.0)) # orange
	DisplayServer.window_set_position(Vector2i(0, 0))
	get_tree().paused = false
	$IntroMusic.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if score >= 30:
		$Control/Exit.visible = true
		canExit = true
	if canExit and $player.position.x > 1120:
		get_tree().change_scene_to_file("res://pacManRes/Pac-ManCutScene.tscn")


func _on_lose_timer_timeout() -> void:
	$Control/LoseScreen.visible = true
	get_tree().paused = true

func _on_lose_screen_confirmed() -> void:
	get_tree().reload_current_scene()


func _on_intro_music_finished() -> void:
	$AudioStreamPlayer2D.play()


func _on_enemy_body_entered(body: Node2D) -> void:
	if body.name != "player":
		return
	$Control/LoseScreen.visible = true
	get_tree().paused = true
