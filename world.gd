extends Node2D

func _ready():
	$Player.start($StartPosition.position)
