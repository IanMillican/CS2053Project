extends Node2D

var turn = "student"

var start_position = Vector2(540, 614)  # Starting point
var end_position = Vector2(1097, 361)    # Ending point
var move_time = 0.85                     # Time it takes to move (in seconds)
var elapsed_time = 0.0
var attack_duration = 5

@onready var timer = $AttackTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$UI/Attack.position = start_position
	#timer.connect("timeout", self, "_on_attack_finished")
	
	# Ensure the timer is stopped initially
	timer.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$UI/Attack.position = start_position
	if timer.is_stopped():
		return  # Only update if the timer is running
	
	if elapsed_time < move_time:
		# Calculate the interpolation factor (between 0 and 1)
		var t = elapsed_time / move_time
		# Move the label using linear interpolation (lerp) between start and end positions
		$UI/Attack.position = start_position.lerp(end_position, t)
		elapsed_time += delta  # Increment elapsed time
	else:
		$UI/Attack.position = end_position
		$UI/Attack.text = ""


func _on_attack_1_pressed() -> void:
	if turn == "student":
		$UI/Attack.text = "Dominos Discount"  # Change the text for the attack label
		$UI/Attack.position = start_position  # Reset the position at the start
		elapsed_time = 0.0  # Reset elapsed time
		timer.start(attack_duration)  # Start the timer for the attack duration

		# Start the animation, wait for the attack to finish, and then handle the next turn
		#turn = "enemy"  # Switch to enemy's turn (or do whatever is necessary)
		# Here you can also apply damage to the enemy if needed
		print("Attack initiated!")  # You can add logic here for enemy damage
func _on_attack_finished() -> void:
	print("Attack finished!")
	# This is where you would handle things after the attack, such as:
	# - Ending the attack animation
	# - Switching turns (next turn)
	# - Checking if the enemy is defeated, etc.
	turn = "student"  # Set the turn back to the student
	# Resume the scene or do other actions to continue the game
	$UI/Attack.text = ""  # Clear the attack label text
		
