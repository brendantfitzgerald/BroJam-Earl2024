extends CharacterBody2D

var rotation_speed = 350
var SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_speed = randf_range(350 * 0.5, 350 * 1.5)
	print("spawn bullet")

func _process(delta):
	$Sprite2D.rotation_degrees += rotation_speed * delta
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Vector2(1000, 0)
	move_and_slide()
	
func _on_despawn_timer_timeout():
	print("despawn bbullet")
	queue_free()

