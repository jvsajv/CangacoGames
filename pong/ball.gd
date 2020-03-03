extends Area2D


export var min_speed:int = 300
export var max_speed:int = 700
var speed = 0
var screen_size
var aux
var aux2
var aux3
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.
	
func _process(delta):
	if Input.is_action_pressed("ui_start") && speed == 0:
		position.x = 512.5
		position.y = 300
		randomize()
		aux = randf()
		speed = int(rand_range(min_speed,max_speed))
		aux2 = randi() % 2
		aux3 = randi() % 2
		if aux2 == 0:
			velocity.x = -1 * speed
		else:
			velocity.x = speed
		if aux3 == 0:
			velocity.y = -1 * speed
		else:
			velocity.y = 1 * speed
		if velocity.length() > 0:
			$Sprite.play()
		else:
			$Sprite.stop()
	position += velocity * delta
	position.y = clamp(position.y, 40, screen_size.y-40)
	if position.y == 40 || position.y == 560:
		velocity.y = velocity.y * -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func start_position():
	position.x = 512.5
	position.y = 300
	velocity.x = 0
	velocity.y = 0
	speed = 0

func _on_P1_area_entered(Ball):
	aux2 = randi()%2
	if aux2 == 0:
		velocity.y = int(rand_range(200,600)) * -1
		velocity.x = int(rand_range(200,1025))
	else:
		velocity.y = int(rand_range(200,600))
		velocity.x = int(rand_range(200,1025))
	speed = int(rand_range(min_speed,max_speed))
	
	pass # Replace with function body.


func _on_P2_area_entered(area):
	aux2 = randi()%2
	if aux2 == 0:
		velocity.y = (randi()%600) * -1
		velocity.x = randi()%1025 * -1
	else:
		velocity.y = randi()%600
		velocity.x = (randi()%1025) * -1
	speed = int(rand_range(min_speed,max_speed))
	pass # Replace with function body.
