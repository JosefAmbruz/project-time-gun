extends KinematicBody2D

var speed = 750
	

func _physics_process(delta: float) -> void:
	var speed_x = 0
	var speed_y = 1
	var motion = Vector2(speed_x, speed_y) * speed
	set_position(get_position() + motion * delta)


func _on_Notifier_screen_exited() -> void:
	queue_free()
