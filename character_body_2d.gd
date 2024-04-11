extends CharacterBody2D

const SPEED = 150
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	#hide()
	
func _process(delta):
	player_movement(delta)

func player_movement(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed(&"move_right"):
		velocity.x += 1
	if Input.is_action_pressed(&"move_left"):
		velocity.x -= 1
	if Input.is_action_pressed(&"move_down"):
		velocity.y += 1
	if Input.is_action_pressed(&"move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0 :
		if velocity.y == 0:
			$AnimatedSprite2D.animation = &"right"
		elif velocity.y > 0:
			$AnimatedSprite2D.animation = &"down-right"
		$AnimatedSprite2D.flip_h = velocity.x < 0
	else:
		if velocity.y > 0:
			$AnimatedSprite2D.animation = &"down"
		elif velocity.y < 0:
			$AnimatedSprite2D.animation = &"up"

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
