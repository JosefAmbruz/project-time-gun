extends KinematicBody2D

export var speed = 10
export var max_speed = 300
export var acceleration = 1
var velocity = Vector2.ZERO
var BulletSlow = preload("res://src/Objects/Bullets/BulletSlow.tscn")
var can_shoot = true

signal shoot


func get_direction():
	#direction player is moving
	var direction: = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), 
		Input.get_action_strength("down") - Input.get_action_strength("up")
		)
	return direction

func fire():
	if can_shoot:
		can_shoot = false
		$Cooldown.start()
		var dir = Vector2(1, 0).rotated($Position2D.global_rotation)
		var bullet_slow = BulletSlow.instance()
		get_parent().add_child(bullet_slow)
		bullet_slow.start($Position2D.global_position, dir)
		#bullet_slow.set_position($Position2D.get_global_position())
		#bullet_slow.set_rotation($Position2D.get_global_rotation())


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())	#mouse movement
	if Input.is_action_pressed("mouse_left"):
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
	


func _on_Cooldown_timeout() -> void:
	can_shoot = true
