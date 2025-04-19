extends Node3D

var gradeScore = 0

func _ready() -> void:
	get_tree().root.content_scale_size = Vector2(1920,1080)
	DisplayServer.window_set_size(Vector2(1920,1080))
	$CameraController/SpringCamera/AudioStreamPlayer3D.play()
	#DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN)

func _process(delta: float) -> void:
	$OmniLight3D2.position = $PlayerBall.position
	$OmniLight3D2.position.z -= 2
	$OmniLight3D2.position.y += 5
	
	if GameScoreControllerJet.grade_score < 0:
		get_tree().change_scene_to_file("res://ballRes/BallCutScene.tscn")
	$UI/Label.text = "Current Grade: %s%%" % GameScoreControllerJet.grade_score

func _on_point_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		GameScoreControllerJet.increase_score(10)

func _remove_out_of_bounds(name: String):
	if name == "Ian1":
		$PointAreas/PointArea1.queue_free()
	if name == "Ian2Wide":
		$PointAreas/PointArea2.queue_free()
	if name == "Ian3Wide":
		$PointAreas/PointArea3.queue_free()
	if name == "Ian4":
		$PointAreas/PointArea4.queue_free()
	if name == "Ian5":
		$PointAreas/PointArea5.queue_free()
	if name == "Ian6":
		$PointAreas/PointArea6.queue_free()
	if name == "Ian7Wide":
		$PointAreas/PointArea7.queue_free()
	if name == "Ian8":
		$PointAreas/PointArea8.queue_free()
	if name == "Ian9":
		$PointAreas/PointArea9.queue_free()
	if name == "Ian10":
		$PointAreas/PointArea10.queue_free()


func _on_ian_hit_ian(name: Variant) -> void:
	GameScoreControllerJet.decreae_score(5)
	_remove_out_of_bounds(name)
	
func _on_goal_zone_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://ballRes/BallCutScene.tscn")
