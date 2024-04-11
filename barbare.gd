extends CharacterBody2D

func _process(delta):
	$AnimatedSprite2D.play()
	$AnimatedSprite2D.animation = &"front_attack"
