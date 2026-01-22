using Godot;
using System;

public partial class main : Node2D
{
	public float Difficulty = 1f;

	public override void _Process(double delta)
	{
		Difficulty += 0.05f * (float)delta;
	}
}
