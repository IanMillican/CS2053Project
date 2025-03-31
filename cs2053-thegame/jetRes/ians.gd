extends Node3D

var speed: float = 5.0

var direction4 = 1
var direction5 = -1
var direction6 = 1
var direction7 = 1
var direction8 = -1
var direction9 = 1
var direction101 = 1
var direction102 = 1

var maxLeftX = 38.919
var maxRightX = -38.919

var maxUpY = 41.819
var maxDownY = 5.369

func _process(delta: float) -> void:
	
	$IanMob4.position.x += speed * direction4 * delta
	if $IanMob4.position.x > maxLeftX or $IanMob4.position.x < maxRightX:
		direction4 *= -1
	$IanMob5.position.x += speed * direction5 * delta
	if $IanMob5.position.x > maxLeftX or $IanMob5.position.x < maxRightX:
		direction5 *= -1
	$IanMob6.position.y += speed * direction6 * delta
	if $IanMob6.position.y > maxUpY or $IanMob6.position.y < maxDownY:
		direction6 *= -1
	$IanMob7.position.x += speed * direction7 * delta
	if $IanMob7.position.x > maxLeftX or $IanMob7.position.x < maxRightX:
		direction7 *= -1
	$IanMob8.position.x += speed * direction8 * delta
	if $IanMob8.position.x > maxLeftX or $IanMob8.position.x < maxRightX:
		direction8 *= -1
	$IanMob9.position.y += speed * direction9 * delta
	if $IanMob9.position.y > maxUpY or $IanMob9.position.y < maxDownY:
		direction9 *= -1
	$IanMob10.position.y += speed * direction101 * delta
	if $IanMob10.position.y > maxUpY or $IanMob10.position.y < maxDownY:
		direction101 *= -1
	$IanMob10.position.x += speed * direction102 * delta
	if $IanMob10.position.x > maxLeftX or $IanMob10.position.x < maxRightX:
		direction102 *= -1
