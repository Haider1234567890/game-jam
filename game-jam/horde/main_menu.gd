extends Node2D

func _ready():
	$FadeTransition/AnimationPlayer.play("FadeOut")

var button_type = null

func _on_b_start_pressed():
	button_type = "start"
	$FadeTransition.show()
	$FadeTransition/FadeTimer.start()
	$FadeTransition/AnimationPlayer.play("FadeIn") 

func _on_b_options_pressed():
	button_type = "options"
	$FadeTransition.show()
	$FadeTransition/FadeTimer.start()
	$FadeTransition/AnimationPlayer.play("FadeIn")

func _on_b_exit_pressed():
	get_tree().quit()

func _on_fade_timer_timeout():
	if button_type == "start" :
		get_tree().change_scene_to_file("res://game.tscn")
		
	elif button_type == "options" :
		get_tree().change_scene_to_file("res://options.tscn")
