extends Node2D


export var speed = 400
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("p2_up"):
		velocity.y -= 1
	if Input.is_action_pressed("p2_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$Sprite.play()
	else:
		$Sprite.stop()
	position += velocity * delta
	position.y = clamp(position.y, 40, screen_size.y-40)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
