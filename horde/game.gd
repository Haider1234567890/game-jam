extends Node2D


func _ready():
	$FadeTransition/AnimationPlayer.play("FadeOut")
	
var button_type = null
