extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var laser_tscn: PackedScene
@onready var animated_sprite =$AnimatedSprite2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Fire"):
		print("Spawn that laser!")
		var new_laser = laser_tscn.instantiate()
		add_sibling(new_laser)
		
		if animated_sprite.flip_h:
			new_laser.global_position = global_position + Vector2(-80, -20)
			new_laser.direction = Vector2.LEFT
		else:
			new_laser.global_position = global_position + Vector2(80, -20)
			new_laser.direction = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.play("Run")
		animated_sprite.flip_h=direction<0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("Idle")

	move_and_slide()
	
