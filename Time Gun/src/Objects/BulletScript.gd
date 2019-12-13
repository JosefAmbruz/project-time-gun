extends KinematicBody2D

var speed = 750
var target = get_global_mouse_position()
var start_position = get_global_position()
var target_direction = (start_position - target).normalized()

func _physics_process(delta: float) -> void:
	move_and_slide(target_direction * speed * delta)


func _on_Notifier_screen_exited() -> void:
	queue_free()
