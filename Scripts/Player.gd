extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# I like functions for organization and we probably won't hit issues with this at the moment
	# but once we start needing to pass in arguments from other places in the p process, it'll get annoying.
	handle_input(delta)
	handle_movement(delta)

func handle_input(delta):
	# Get the input direction and handle the movement/deceleration.
	# not sure how bad the performance hit would is, but as it is these inputs are mapped to 4 different options.
	# ideally, you'd look for the type of input being used instead of checking against 4 types every p frame
	# Get the input direction for both x and y in one go.
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	
	if direction.length() != 0:
		direction = direction.normalized()
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		# Decelerate if no input is given.
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

func handle_movement(delta):
	move_and_slide()
