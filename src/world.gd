extends Node2D

const Level = preload("res://src/level.gd")

func _ready():
	var level = Level.load_from_file("0.txt")
	var tilemap = get_node("tilemap")
	
	# fill tilemap with level contents
	level.initialize(tilemap)
