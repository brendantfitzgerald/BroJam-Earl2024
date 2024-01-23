extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemies")
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var playerPosition = get_parent().get_node("Player").position
	var angleToPlayer = global_position.direction_to(playerPosition).angle()
	#rotation = move_toward(rotation, angleToPlayer, delta)
	look_at(playerPosition)
	velocity = position.direction_to(playerPosition) * 100
	move_and_slide()
	pass
