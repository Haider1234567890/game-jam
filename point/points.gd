extends Node2D



var points : int = 0
var item_cost : int = 10 
var points_label : Label

func _ready() :
	print("Initial Points: ", points)
	points_label == Label

func increment_points(amount : int) :
	points += amount
	print("Points after increment: ", points)

func buy_item():
	if points >= item_cost:
		points -= item_cost
		print("Item bought! Remaining points: ", points)
	else:
		print("Not enought points!")
