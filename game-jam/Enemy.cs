using Godot;
using System;

public partial class Enemy : Node2D
{
	[Export] public float BaseSpeed = 60f;
	public float SpeedMultiplier = 1f;

	public override void _Process(double delta)
	{
		Position = new Vector2(Position.X, Position.Y + (float)delta * BaseSpeed * SpeedMultiplier);
		var screenHeight = GetViewportRect().Size.Y;
		
		float t = Position.Y / screenHeight;
		float minScale = 0.6f;
		float maxScale = 1.8f;
				
		Scale = Vector2.One * Mathf.Lerp(minScale, maxScale, t);
	}
	
	public override void _Ready()
	{
		var game = GetTree().Root.GetNode<main>("res://main.cs");
		SpeedMultiplier = game.Difficulty;
	}
}
