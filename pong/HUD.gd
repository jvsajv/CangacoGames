extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Input.is_action_pressed("ui_start"):
		emit_signal("start_game")
		$MessageLabel.hide()
	pass # Replace with function body.
signal start_game
func show_message(text):
	$MessageLabel.text = text
func show_start():
	$MessageLabel.text = "Press 'ENTER' to start!"
	$MessageLabel.show()
func _process(delta):
	if Input.is_action_pressed("ui_start"):
		$MessageLabelP1.hide()
		$MessageLabelP2.hide()
		$MessageLabel.hide()
func update_score1(score):
	$Score1.text = str(score)
	$MessageLabelP1.text = "Player1's GOAL! Press 'ENTER' to continue!"
	$MessageLabelP1.show()
func win_P1():
	$win_P1.text = "Player1 WON! Press 'ENTER' to start a new game!"
	$win_P1.show()
	$MessageLabelP1.hide()
	$MessageLabelP2.hide()
	$MessageLabel.hide()
func win_P2():
	$win_P2.text = "Player2 WON! Press 'ENTER' to start a new game!"
	$win_P2.show()
	$MessageLabelP1.hide()
	$MessageLabelP2.hide()
	$MessageLabel.hide()
func update_score2(score):
	$Score2.text = str(score)
	$MessageLabelP2.text = "Player2's GOAL! Press 'ENTER' to continue!"
	$MessageLabelP2.show()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
