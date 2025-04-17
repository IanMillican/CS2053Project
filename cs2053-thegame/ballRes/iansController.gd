extends Node3D
var speed: float = 15.0

var direction4 = 1
var direction5 = -1
var direction9 = -1
var direction10 = 1

var maxLeftX = 23.459
var maxRightX = -23.34

func _process(delta: float) -> void:
	$Ian4.position.x += speed * direction4 * delta
	if $Ian4.position.x > maxLeftX or $Ian4.position.x < maxRightX:
		direction4 *= -1
	$Ian5.position.x += speed * direction5 * delta
	if $Ian5.position.x > maxLeftX or $Ian5.position.x < maxRightX:
		direction5 *= -1
	$Ian9.position.x += speed * direction9 * delta
	if $Ian9.position.x > maxLeftX or $Ian9.position.x < maxRightX:
		direction9 *= -1
	$Ian10.position.x += speed * direction10 * delta
	if $Ian10.position.x > maxLeftX or $Ian10.position.x < maxRightX:
		direction10 *= -1
