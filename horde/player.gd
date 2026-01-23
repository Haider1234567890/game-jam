extends Sprite2D

@export var pulse_scale := Vector2(0.3, 0.3)
@export var pulse_time := 0.1

var base_scale := Vector2.ONE
var tween: Tween

func _ready():
	base_scale = scale

func _process(delta):
	global_position = get_global_mouse_position()

func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		pulse()

func pulse():
	if tween:
		tween.kill() # stop existing pulse so it doesn't stack

	tween = create_tween()
	tween.tween_property(self, "scale", pulse_scale, pulse_time)\
		.set_trans(Tween.TRANS_BACK)\
		.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", base_scale, pulse_time)\
		.set_trans(Tween.TRANS_BACK)\
		.set_ease(Tween.EASE_IN)
