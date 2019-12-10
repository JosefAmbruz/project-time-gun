extends KinematicBody2D
export var speed = 600

func get_direction():
	var direction = get_global_mouse_position()
	return direction

func is_outside_screen():
	if not get_node("Notifier").is_on_screen():
		queue_free()

func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	get_direction()
	move_and_slide(get_direction()* speed * delta) 
	is_outside_screen()
	
