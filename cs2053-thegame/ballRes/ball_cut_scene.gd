extends Node3D

var dialogue_count = 0

func _ready() -> void:
	get_tree().root.content_scale_size = Vector2(1920,1080)
	DisplayServer.window_set_size(Vector2(1920,1080))
	$PlayerBall.set_physics_process(false)
	$PlayerBall.set_process(false)
	$PlayerBall/JetCamera.current = false
	$IanMobArea/IanCamera.current = true
	#$AudioListener3D/AudioStreamPlayer3D.stream = preload("res://jetRes/Ludum Dare 30 04.ogg")
	#$AudioListener3D/AudioStreamPlayer3D.loop = true
	#$AudioListener3D/AudioStreamPlayer3D.play()
	if GameScoreControllerJet.grade_score < 55:
		$Dialogue/Label.text = "I knew you wouldn't pass the gauntlet, you will never pass this class ha!"
	else:
		$Dialogue/Label.text = "Hmm, I didn't expect you to make it through the gauntlet..."
	
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	dialogue_count += 1
	print(dialogue_count)
	print(GameScoreControllerJet.grade_score)
	if GameScoreControllerJet.grade_score < 55:
		print("Inside first if statement")
		if dialogue_count == 1:
			$IanMobArea/IanCamera.current = false
			$PlayerBall/JetCamera.current = true
			$Dialogue/Label.text = "I will never give up! This gauntlet is the only thing standing between me and passing the exam!"
		if dialogue_count == 2:
			print("Inside second if statement")
			GameScoreControllerJet.grade_score = 0
			get_tree().change_scene_to_file("res://ballRes/BallLvl.tscn")
	
	else:
		if dialogue_count == 1:
			$IanMobArea/IanCamera.current = false
			$PlayerBall/JetCamera.current = true
			$Dialogue/Label.text = "Honestly, I thought it was pretty easy. I'm so ready for the exam tomorrow."
		if dialogue_count == 2:
			$PlayerBall/JetCamera.current = false
			$IanMobArea/IanCamera.current = true
			$Dialogue/Label.text = "..."
		if dialogue_count == 3:
			$Dialogue/Label.text = "You will never pass this class! Face me student!!!"
		if dialogue_count == 4:
			get_tree().change_scene_to_file("res://finalRes/FinalLvl.tscn")


func _on_audio_stream_player_3d_finished() -> void:
	$AudioListener3D/AudioStreamPlayer3D.play()
