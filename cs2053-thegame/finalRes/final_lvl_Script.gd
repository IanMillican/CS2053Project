extends Node2D

var turn = "student"

var start_position = Vector2(540, 614)  # Starting point
var end_position = Vector2(1097, 361)    # Ending point
var move_time = 1                     # Time it takes to move (in seconds)
var elapsed_time = 0.0
var attack_duration = 3.5

var ianHealth = 100
var playerHealth = 100

var ianLines = ["No technology (except calculator)", "I'll make some light versions of the slides", "Ughh why won't my eduroam work"]
var ianLinePos = 0

@onready var timer = $AttackTimer

func _ready() -> void:
	$UI/Attack.position = start_position
	timer.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$UI/IanHealth/Health.text = "HP: %s/100" % ianHealth
	$UI/PlayerHealth/Health.text = "HP: %s/100" % playerHealth
	if ianHealth <= 0:
		get_tree().change_scene_to_file("res://finalRes/FinalCutScene.tscn")


func _on_attack_1_pressed() -> void:
	if turn == "student":
		$UI/Attack.text = "Dominos Discount"
		$UI/Attack.position = start_position
		$UI/PlayerAttackBar/Attack1.disabled = true
		$UI/PlayerAttackBar/Attack2.disabled = true
		$UI/PlayerAttackBar/Attack3.disabled = true
		move_label()

func _on_attack_2_pressed() -> void:
	if turn == "student":
		$UI/Attack.text = "Lab exam from home"
		$UI/Attack.position = start_position
		$UI/PlayerAttackBar/Attack1.disabled = true
		$UI/PlayerAttackBar/Attack2.disabled = true
		$UI/PlayerAttackBar/Attack3.disabled = true
		move_label()
	

func _on_attack_3_pressed() -> void:
	if turn == "student":
		$UI/Attack.text = "The old S-Club"
		$UI/Attack.position = start_position
		$UI/PlayerAttackBar/Attack1.disabled = true
		$UI/PlayerAttackBar/Attack2.disabled = true
		$UI/PlayerAttackBar/Attack3.disabled = true
		move_label()

func move_label() -> void:
	var timer = get_tree().create_timer(move_time)
	var attack_timer = get_tree().create_timer(attack_duration) 
	while timer.time_left != 0:
		$UI/Attack.position = end_position.lerp(start_position, (timer.time_left / move_time))
		await get_tree().create_timer(0.0).timeout

	
	if $UI/Attack.text == "The old S-Club":
		ianHealth -= 20
	elif $UI/Attack.text == "Lab exam from home":
		ianHealth -= 15
	else:
		ianHealth -= 10
	$UI/Attack.text = "" 
	await attack_timer.timeout 
	turn = "enemy"  
	print("Attack finished!")
	ian_attack()
	
func ian_attack() -> void:
	if ianLinePos >= ianLines.size():
		ianLinePos = 0
		$UI/Attack.text = ianLines[ianLinePos]
	else:
		$UI/Attack.text = ianLines[ianLinePos]
		ianLinePos += 1
	var timer = get_tree().create_timer(move_time)
	var attack_timer = get_tree().create_timer(attack_duration) 
	while timer.time_left != 0: 
		$UI/Attack.position = start_position.lerp(end_position, (timer.time_left / move_time))
		await get_tree().create_timer(0.0).timeout 

	
	$UI/Attack.text = ""
	playerHealth -= 10
	await attack_timer.timeout 
	turn = "student" 
	print("Attack finished!")
	$UI/PlayerAttackBar/Attack1.disabled = false
	$UI/PlayerAttackBar/Attack2.disabled = false
	$UI/PlayerAttackBar/Attack3.disabled = false


func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.play()
