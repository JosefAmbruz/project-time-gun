extends KinematicBody2D

var speed = 750
var velocity = Vector2()

func start(pos, dir):
	position = pos
	rotation = dir
	velocity = Vector2(speed, 0).rotated(rotation)
	

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			


func _on_Notifier_screen_exited() -> void:
	queue_free()
