extends Node2D


func _ready():
	$FadeTransition/AnimationPlayer.play("FadeOut")
	


func _on_b_back_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
