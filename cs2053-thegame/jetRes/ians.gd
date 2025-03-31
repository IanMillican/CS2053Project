extends Node3D

var speed: float = 5.0

var direction = 1

var maxLeft = 38.919
var maxRight = -38.919

func _process(delta: float) -> void:
	
	
	$IanMob2.position.x += speed * direction * delta
	if $IanMob2.position.x > maxLeft or $IanMob2.position.x < maxRight:
		direction *= -1
