extends Node2D

const Level = preload("res://src/level.gd").Level

func _ready():
	var level = Level.load_from_file("0.txt")
	var tilemap = get_node("tilemap")