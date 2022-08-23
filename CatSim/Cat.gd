extends KinematicBody2D

export var maxSpeed = 45
export var gravity = 0.1
export var acceleration = 0.8
export var deceleration = 0.8
export var jumpPower = 1200
var velocity : Vector2 = Vector2(0, 0)

func _physics_process(delta):
	var input = Input.get_axis("leftward", "rightward")
	
	velocity -= velocity*deceleration
	if Input.is_action_just_pressed("upward") && is_on_floor():
		velocity.y -= jumpPower
	velocity += Vector2(input*acceleration, gravity)
	velocity.x = clamp(velocity.x, -maxSpeed, maxSpeed)
	velocity = move_and_slide(velocity, Vector2.UP)
