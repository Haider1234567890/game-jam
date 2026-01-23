extends Control

#func _ready():
#	print("UI2 children:")
#	for child in get_children():
#		print(" - ", child.name)

var points := 0
var time_survived := 0.0
var player_health := 100

@onready var points_label = $pointBubble/points
@onready var time_label = $TimeBubble/TimeSurvived
#@onready var health_label = $HealthBarBubble

func _process(delta):
	time_survived += delta
	time_label.text = "TIME SURVIVED: %0.2f" % time_survived
	#health_label.text = "%d%%" % player_health
	points_label.text = "POINTS: %d" % points
