extends KinematicBody2D

export var speed = 10
export var max_speed = 300
export var acceleration = 1
var velocity = Vector2.ZERO
var bullet = preload("res://src/Objects/Bullet.tscn")


func get_direction():
	#direction player is moving
	var direction: = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), 
		Input.get_action_strength("down") - Input.get_action_strength("up")
		)
	return direction

func fire():
	if Input.is_action_pressed("mouse_left"):
		var Bullet = bullet.instance()
		get_parent().add_child(Bullet)
		Bullet.set_position($Position2D.get_global_position())
		Bullet.set_rotation($Position2D.get_global_rotation())

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())	#mouse movement
	fire()
	
	
	if get_direction().x or get_direction().y != 0:	#if is player moving, play the animation
		$AnimationPlayer.play("Run")
		print("accelerating")
		speed += acceleration
		if speed > max_speed:
			print("walking")
			speed = max_speed
	else:
		speed -= acceleration
		if speed < 0:
			speed = 0
			print("slowing down")
	
	velocity = speed * get_direction().normalized()
	move_and_slide(velocity)
	




