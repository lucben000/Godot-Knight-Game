extends CharacterBody2D

#Etc
var credits: Control
var pause: Control
var fade: CanvasLayer
var gameNode: Node2D
var levelNode: Node
@onready var sfx: AudioStreamPlayer2D = $SFX
@onready var hud: CanvasLayer = $HUD

#Player
@export var player: CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
enum playerState { ALIVE, DEAD }
@export var playerStatus : playerState
const SPEED = 200.0
const JUMP_VELOCITY = -325.0

#Objects
var ladderDetect: bool = false
var ladderSpeed: int = 200
var levelDoor: Node2D
var doorPassable: bool
var doorDetect: bool = false



func _ready() -> void:
	playerStatus = playerState.ALIVE
	gameNode = get_tree().root.get_node("/root/Game")
	levelNode = gameNode.get_child(1)
	pause = load("res://scenes/pause_ui.tscn").instantiate()
	credits = load("res://scenes/credits.tscn").instantiate()
	fade = load("res://scenes/fade.tscn").instantiate()
	levelDoor = levelNode.get_node("./Door")
	#doorPassable = levelDoor.doorPassable

#Physics
func _physics_process(delta: float) -> void:
	doorPassable = levelDoor.doorPassable
	
	# Get the input direction and handle the movement/deceleration.
	var directionY := Input.get_axis("up", "down")
	var directionX := Input.get_axis("left", "right")
	
	#Ladder Climbing
	if ladderDetect:
		if directionY:
			velocity.y = directionY * ladderSpeed
		else:
			velocity.y = move_toward(velocity.y, 0, ladderSpeed)
	#Gravity
	elif not is_on_floor():
		velocity += get_gravity() * delta
	
	#Go through the level door to go to the next level
	if doorPassable:
		if doorDetect:
			if Input.is_action_just_pressed("up"):
				get_tree().root.add_child(fade)
				await get_tree().create_timer(1.0).timeout
				gameNode.add_child(credits)
				get_parent().queue_free()
				#print("Next level")
	
	#ALIVE = move or if DEAD = can't move
	if playerStatus == playerState.ALIVE:
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			sfx.play()
			velocity.y = JUMP_VELOCITY
		# Movement speed
		if directionX:
			velocity.x = directionX * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
	#When dead, de-accelerates to 0 speed
	else:
		directionX = 0.0
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		directionY = 0.0
	
	#Pause game
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		add_child(pause)
		#print("paused")
	
	
	playAnimations(directionX, directionY)
	move_and_slide()
	

#--------------------------Animations--------------------------------------#
# Plays animations
func playAnimations(directionX, directionY):
	if playerStatus == playerState.DEAD:
		animated_sprite.play("death")
	else:
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
	
	# Flips sprite
	if directionX > 0:
		animated_sprite.flip_h = false
	elif directionX < 0:
		animated_sprite.flip_h = true

#--------------------------Signals--------------------------------------#
#Detect ladder climbing
func _on_area_2d_body_entered(body: Node2D) -> void:
	ladderDetect = true
	#print('climbing')
func _on_area_2d_body_exited(body: Node2D) -> void:
	ladderDetect = false
	#print('not climbing')

#Detect death
func _on_area_2d_area_entered(area: Area2D) -> void:
	playerStatus = playerState.DEAD
	#print(playerStatus)

func _on_door_area_entered(area: Area2D) -> void:
	doorDetect = true
	#print("I'm in a door")
func _on_door_area_exited(area: Area2D) -> void:
	doorDetect = false
	#print("Exited door")
