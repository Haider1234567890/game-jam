extends Node2D

@export var BaseSpeed: float = 60.0
@export var BaseHealth: int = 3

var _current_health: int
var SpeedMultiplier: float = 1.0

func _ready() -> void:
	var game = get_tree().root.get_node("main") # adjust if needed
	SpeedMultiplier = game.Difficulty
	_current_health = BaseHealth + game.DifficultyHealthBonus

func _process(delta: float) -> void:
	position.y += BaseSpeed * SpeedMultiplier * delta

	var screen_height = get_viewport_rect().size.y
	var t: float = position.y / screen_height

	var min_scale: float = 0.6
	var max_scale: float = 1.8

	scale = Vector2.ONE * lerp(min_scale, max_scale, t)

func _input_event(viewport, event, shape_idx) -> void:
	if event is InputEventMouseButton and event.pressed:
		take_damage(1)

func take_damage(dmg: int) -> void:
	_current_health -= dmg
	if _current_health <= 0:
		die()

func die() -> void:
	queue_free()
