using Godot;
using System;

public partial class Boss : Node2D
{
	[Export] public int BossHealth = 100;
	[Export] public float Speed = 40f;

	public override void _Process(double delta)
	{
		Position += Vector2.Down * Speed * (float)delta;
	}

	public void TakeDamage(int dmg)
	{
		BossHealth -= dmg;
		if (BossHealth <= 0)
			Die();
	}

	private void Die()
	{
		QueueFree();
	}
}
