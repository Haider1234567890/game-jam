using Godot;
using System;

public partial class main : Node2D
{
	public float Difficulty = 1f;
	public int DifficultyHealthBonus = 0;
	
	private float _timer = 0f;
	
	[Export] public PackedScene EnemyScene;
	[Export] public PackedScene BossScene;
	private RandomNumberGenerator rng = new RandomNumberGenerator();
	private bool bossSpawned = false;

	public override void _Process(double delta)
	{
		base.Process(delta)
		_timer += (float)delta
		Difficulty += 0.05f * _timer;
		if (_timer > 20f) // every 20 seconds
		{
			_timer = 0f;
			DifficultyHealthBonus += 1;
			GD.Print($"Enemy health increased! Now: +{DifficultyHealthBonus}");
		}
		
		if(_timer > 60 && !bossSpawned)
		{
			SpawnBoss();
			bossSpawned = true;
		}
	}
	
	private void SpawnBoss()
	{
		var boss = BossScene.Instantiate<Node2D>();
		boss.Position = new Vector2(GetViewportRect().Size.X / 2, -200);
		AddChild(boss);
	}
	
	public override void _Ready()
	{
		rng.Randomize();
	}

	private void OnSpawnTimerTimeout()
	{
		var enemy = EnemyScene.Instantiate<Enemy>();
		float screenWidth = GetViewportRect().Size.X;

		float spawnX = rng.RandiRange(50, (int)screenWidth - 50);
		enemy.Position = new Vector2(spawnX, -50);

		AddChild(enemy);
	}
}
