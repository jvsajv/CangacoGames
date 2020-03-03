extends Node


var score1 = 0
var score2 = 0


func _ready():
	$HUD.show_start()
	pass 
func _process(delta):
	if Input.is_action_pressed("ui_end"):
		get_tree().quit()
	if $Ball.position.x < 0:
		score2 += 1
		if score2 == 10:
			$HUD.win_P2()
			new_game()
		if score2 < 10:
			$HUD.update_score2(score2)
			$Ball.position.x = 512.5
			$Ball.position.y = 300
			$Ball.velocity.x = 0
			$Ball.velocity.y = 0
			$Ball.speed = 0
	if $Ball.position.x > 1025:
		score1 += 1
		if score1 == 10:
			$HUD.win_P1()
			new_game()
		if score1 < 10:
			$HUD.update_score1(score1)
			$Ball.position.x = 512.5
			$Ball.position.y = 300
			$Ball.velocity.x = 0
			$Ball.velocity.y = 0
			$Ball.speed = 0

func new_game():
	var score = 0
	$HUD.update_score1(score)
	$HUD.update_score2(score)
	$P1.start_position()
	$P2.start_position()
	$Ball.start_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
