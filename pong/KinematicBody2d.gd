extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('p1_down'):
		velocity.y += 1
		print("down")
		print(Vector2())
	if Input.is_action_pressed('p1_up'):
		velocity.y -= 1
		print("up")
		print(Vector2())
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
