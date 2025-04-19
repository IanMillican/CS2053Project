extends Node3D
signal increment
var strings = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_landing_1_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes1/GreenPipe1/landing1.queue_free()
		$/root/main/grounds/tiers/tier.queue_free()
		
	


func _on_landing_2_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes1/GreenPipe2/landing2.queue_free()
		$/root/main/grounds/tiers/tier3.queue_free()


func _on_landing_3_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes1/GreenPipe3/landing3.queue_free()
		$/root/main/grounds/tiers/tier2.queue_free()


func _on_landing_4_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes1/GreenPipe4/landing4.queue_free()
		$/root/main/grounds/tiers/tier4.queue_free()


func _on_landing_5_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes1/GreenPipe5/landing5.queue_free()
		$/root/main/grounds/tiers/tier6.queue_free()


func _on_landing_6_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes1/GreenPipe6/landing6.queue_free()
		$/root/main/grounds/tiers/tier8.queue_free()


func _on_landing_7_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes1/GreenPipe7/landing7.queue_free()
		$/root/main/grounds/tiers/tier5.queue_free()


func _on_landing_8_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes1/GreenPipe8/landing8.queue_free()
		$/root/main/grounds/tiers/tier7.queue_free()


func _on_landing_9_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes2/GreenPipe9/landing9.queue_free()
		$/root/main/grounds/tiers/tier16.queue_free()


func _on_landing_10_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes2/GreenPipe10/landing10.queue_free()
		$/root/main/grounds/tiers/tier14.queue_free()


func _on_landing_11_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes2/GreenPipe11/landing11.queue_free()
		$/root/main/grounds/tiers/tier15.queue_free()


func _on_landing_12_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes2/GreenPipe12/landing12.queue_free()
		$/root/main/grounds/tiers/tier13.queue_free()


func _on_landing_13_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes2/GreenPipe13/landing13.queue_free()
		$/root/main/grounds/tiers/tier11.queue_free()


func _on_landing_14_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes2/GreenPipe14/landing14.queue_free()
		$/root/main/grounds/tiers/tier9.queue_free()


func _on_landing_15_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes2/GreenPipe15/landing15.queue_free()
		$/root/main/grounds/tiers/tier12.queue_free()


func _on_landing_16_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
		strings = strings +1;
		print(strings);
		increment.emit();
		$/root/main/grounds/pipes/pipes2/GreenPipe16/landing16.queue_free()
		$/root/main/grounds/tiers/tier10.queue_free()


func _on_tier_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
		if body is CharacterBody3D:
			print("LOSE");
			get_tree().reload_current_scene()


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
			print("WIN");
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().change_scene_to_file("res://jetRes/JetLvl.tscn")


func _on_out_of_bounds_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody3D:
			print("LOSE");
			get_tree().reload_current_scene()
