extends Area2D

@export var BaseSpeed: float = 60.0
@export var BaseHealth: int = 3

var current_health: int
var speed_multiplier: float = 1.0

func _ready() -> void:
	var game = get_tree().get_root().get_node("Game")
	if game:
		speed_multiplier = game.Difficulty
		current_health = BaseHealth + game.DifficultyHealthBonus
	else:
		current_health = BaseHealth

func _process(delta: float) -> void:
	position.y += BaseSpeed * speed_multiplier * delta

	# scaling effect from top to bottom (optional)
	var screen_height = get_viewport_rect().size.y
	var t = position.y / screen_height
	scale = Vector2.ONE * lerp(0.6, 1.8, t)

func _input_event(viewport, event, shape_idx) -> void:
	if event is InputEventMouseButton and event.pressed:
		take_damage(1)

func take_damage(amount: int) -> void:
	current_health -= amount
	print("Enemy HP:", current_health)
	if current_health <= 0:
		die()

func die() -> void:
	print("Enemy died!")
	queue_free()
