extends KinematicBody2D

var Player = preload("res://src/Actors/Player.tscn")
onready var area = get_node("Detection")

func _physics_process(delta: float) -> void:
	var body = area.get_overlapping_bodies()
	for b in body:
		if b.is_in_group("player"):
			pass
