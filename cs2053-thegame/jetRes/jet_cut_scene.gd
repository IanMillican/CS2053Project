extends Node3D

var dialogue_count = 0

func _ready() -> void:
	get_tree().root.content_scale_size = Vector2(1920,1080)
	DisplayServer.window_set_size(Vector2(1920,1080))
	$Jet.set_physics_process(false)
	$Jet.set_process(false)
	$Jet/JetCamera.current = false
	$IanMobArea/IanCamera.current = true
	#$AudioListener3D/AudioStreamPlayer3D.stream = preload("res://jetRes/Ludum Dare 30 04.ogg")
	#$AudioListener3D/AudioStreamPlayer3D.loop = true
	#$AudioListener3D/AudioStreamPlayer3D.play()
	if GameScoreControllerJet.grade_score < 55:
		$Dialogue/Label.text = "Ha! Looks like you weren't cut out for flying a jet."
	else:
		$Dialogue/Label.text = "Wow, looks like you passed the Jet lab... Congratulations."
	
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	dialogue_count += 1
	if GameScoreControllerJet.grade_score < 55:
		if dialogue_count == 1:
			$IanMobArea/IanCamera.current = false
			$Jet/JetCamera.current = true
			$Dialogue/Label.text = "I'll be sure to get it right this time!"
		if dialogue_count == 2:
			GameScoreControllerJet.grade_score = 0
			get_tree().change_scene_to_file("res://jetRes/JetLvl.tscn")
	else:
		if dialogue_count == 1:
			$IanMobArea/IanCamera.current = false
			$Jet/JetCamera.current = true
			$Dialogue/Label.text = "I can't believe it. What's next?"
		if dialogue_count == 2:
			$Jet/JetCamera.current = false
			$IanMobArea/IanCamera.current = true
			$Dialogue/Label.text = "Now you have to pass the gauntlet of the ball lab! Goodluck hehe..."
		if dialogue_count == 3:
			GameScoreControllerJet.grade_score = 0
			get_tree().change_scene_to_file("res://ballRes/BallLvl.tscn")


func _on_audio_stream_player_3d_finished() -> void:
	$AudioListener3D/AudioStreamPlayer3D.play()
