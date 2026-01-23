extends Node2D

var Difficulty: float = 1.0
var DifficultyHealthBonus: int = 0

var _timer: float = 0.0
var boss_spawned: bool = false

@export var EnemyScene: PackedScene
@export var BossScene: PackedScene

var rng := RandomNumberGenerator.new()

func _process(delta: float) -> void:
	_timer += delta

	# Increase difficulty continuously
	Difficulty += 0.05 * delta

	# Increase enemy health every 20 seconds
	if _timer > 20.0:
		_timer = 0.0
		DifficultyHealthBonus += 1
		print("Enemy health increased! Now: +%s" % DifficultyHealthBonus)

	# Boss spawn check (based on accumulated total time)
	if _timer > 60.0 and not boss_spawned:
		spawn_boss()
		boss_spawned = true


func spawn_boss() -> void:
	var boss = BossScene.instantiate()
	boss.position = Vector2(get_viewport_rect().size.x / 2, -200)
	add_child(boss)


func _on_SpawnTimer_timeout() -> void:
	var enemy = EnemyScene.instantiate()
	var screen_width = get_viewport_rect().size.x

	var spawn_x = rng.randi_range(50, int(screen_width) - 50)
	enemy.position = Vector2(spawn_x, -50)

	add_child(enemy)
	
func _ready():
	$FadeTransition/AnimationPlayer.play("FadeOut")
	rng.randomize()
	
var button_type = null
