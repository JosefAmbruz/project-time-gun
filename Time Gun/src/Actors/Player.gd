extends KinematicBody2D

var velocity = Vector2.ZERO
export var speed = 300
#export var speed: = 300
#var velocity = Vector2()
#
#func get_input():
#	velocity = Vector2()
#	look_at(get_global_mouse_position())
#	if Input.is_action_pressed("right"):
#		velocity.x += 1
#	if Input.is_action_pressed("left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("up"):
#		velocity.y -= 1
#	if Input.is_action_pressed("down"):
#		velocity.y += 1
#	velocity = velocity.normalized() * speed
#
#func _physics_process(delta: float) -> void:
#	get_input()
#	velocity = move_and_slide(velocity)

func get_direction():
	var direction: = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), 
		Input.get_action_strength("down") - Input.get_action_strength("up")
		)
	return direction

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if get_direction().x or get_direction().y >= 1:
		$AnimationPlayer.play("Run")
	velocity = speed * get_direction().normalized()
	move_and_slide(velocity)
	




