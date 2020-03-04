extends KinematicBody2D

export (int) var speed = 400
export (float) var rotation_speed = 1.5
var screen_size

var velocity = Vector2()
var rotation_dir = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	screen_size = get_viewport_rect().size
	pass # Replace with function body.
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
func _process(delta):
	pass
func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		$AnimatedSprite.animation = "right"
		rotation_dir += 1
	if Input.is_action_pressed('left'):
		$AnimatedSprite.animation = "left"
		rotation_dir -= 1
	if Input.is_action_pressed('up'):
		$AnimatedSprite.animation = "front"
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed(""):
		$AnimatedSprite.animation = "stop"
func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
