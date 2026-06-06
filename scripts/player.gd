extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -250.0

var ladderDetect = false
var ladderSpeed = 200

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	
	var directionY := Input.get_axis("up", "down")
	
	#Ladder Climbing
	if ladderDetect:
		if directionY:
			velocity.y = directionY * ladderSpeed
		else:
			velocity.y = move_toward(velocity.y, 0, ladderSpeed)
	#Gravity
	elif not is_on_floor():
		velocity += get_gravity() * delta
	
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var directionX := Input.get_axis("left", "right")
	
	# Flips sprite
	if directionX > 0:
		animated_sprite.flip_h = false
	elif directionX < 0:
		animated_sprite.flip_h = true
	
	# Plays animations
	if is_on_floor():
		if directionX == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	elif ladderDetect:
		if directionY == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("climbladder")
	else:
		animated_sprite.play("jump")
	
	# Movement speed
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

#Detect ladder climbing
func _on_area_2d_body_entered(body: Node2D) -> void:
	ladderDetect = true
func _on_area_2d_body_exited(body: Node2D) -> void:
	ladderDetect = false
