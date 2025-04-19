extends Node2D

var dialogueNum = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$UI/IanText.text = ""
	$UI/PlayerText.text = "Phew, I did it, I finished all the labs for cs2053"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	dialogueNum += 1
	if dialogueNum == 1:
		$UI/IanText.text = "Yeah yeah, you did alright."
		$UI/PlayerText.text = ""
	if dialogueNum == 2:
		$UI/IanText.text = ""
		$UI/PlayerText.text = "I did so well! Look at all the hard work I did"
	if dialogueNum == 3:
		$UI/IanText.text = "Yeah I guess, how about I give you.."
		$UI/PlayerText.text = ""
	if dialogueNum == 4:
		$UI/IanText.text = ""
		$UI/PlayerText.text = "A+ A+ A+ A+"
	if dialogueNum == 5:
		$UI/IanText.text = "C+"
		$UI/PlayerText.text = ""
	if dialogueNum == 6:
		$UI/IanText.text = ""
		$UI/PlayerText.text = "...."
	if dialogueNum == 7:
		$UI/IanText.text = "...."
		$UI/PlayerText.text = ""
	if dialogueNum == 8:
		$UI/IanText.text = ""
		$UI/PlayerText.text = "Deal."
	if dialogueNum == 9:
		get_tree().quit()
