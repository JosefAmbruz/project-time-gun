extends KinematicBody2D
export var speed = 800
var direction

func _ready() -> void:
	direction = get_global_mouse_position()

func _process(delta: float) -> void:
	move_and_slide(direction * speed * delta)
