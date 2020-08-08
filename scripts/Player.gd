extends Area2D

export (int) var speed
var velocity = Vector2()
var screensize = Vector2(480,720)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

func _process(delta):
	get_input()
	position += velocity * delta
	position.x = clamp(position.x, 20, screensize.x -20)
	position.y = clamp(position.y, 20, screensize.y -20)
	determine_animation()

func determine_animation():
	if velocity.length() > 0:
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.animation = "idle"
