using Godot;
using System;

public partial class main : Node2D
{
	public float Difficulty = 1f;
	public int DifficultyHealthBonus = 0;
	
	private float _timer = 0f;
	
	[Export] public PackedScene EnemyScene;
	private RandomNumberGenerator rng = new RandomNumberGenerator();

	public override void _Process(double delta)
	{
		_timer += (float)delta
		Difficulty += 0.05f * _timer;
		if (_timer > 10f) // every 10 seconds
		{
			_timer = 0f;
			DifficultyHealthBonus += 1;
			GD.Print($"Enemy health increased! Now: +{DifficultyHealthBonus}");
		}
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
