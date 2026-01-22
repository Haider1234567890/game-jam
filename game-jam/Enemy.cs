using Godot;
using System;

public partial class Enemy : Node2D
{
	[Export] public float BaseSpeed = 60f;
	[Export] public int BaseHealth = 3;
	private int _currentHealth;
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
		_currentHealth = BaseHealth + game.DifficultyHealthBonus;
	}
	
	public override void _InputEvent(Viewport viewport, InputEvent @event, int shape_idx)
	{
		if (@event is InputEventMouseButton mouseEvent && mouseEvent.Pressed)
		{
			TakeDamage(1); // 1 damage per click
		}
	}
	
	private void TakeDamage(int dmg)
	{
		_currentHealth -= dmg;

		if (_currentHealth <= 0)
			Die();
	}

	private void Die()
	{
		QueueFree();
	}
}
