using Godot;
using System;

public partial class Enemy : Node2D
{
	[Export] public float BaseSpeed = 60f;
	public float SpeedMultiplier = 1f;

	public override void _Process(double delta)
	{
		Position = new Vector2(Position.X, Position.Y + (float)delta * BaseSpeed * SpeedMultiplier);
	}
}
