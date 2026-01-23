extends Node2D

@export var BossHealth: int = 100
@export var Speed: float = 40.0

func _process(delta: float) -> void:
	position += Vector2.DOWN * Speed * delta

func take_damage(dmg: int) -> void:
	BossHealth -= dmg
	if BossHealth <= 0:
		die()

func die() -> void:
	queue_free()
