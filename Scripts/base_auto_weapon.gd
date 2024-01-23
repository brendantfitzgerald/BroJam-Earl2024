extends Node2D
#Might need to be a different type of node? Is area2D best?

# Preloads:
var bullet_scene = preload("res://Scenes/bullet.tscn")

@onready var fire_point = $FirePoint
@onready var fire_timer = $FireTimer

var bullet_count
#every x amount of time, spawn bullet
#bullet has its own logic, based on its type
#gun fires bullet in unique ways?
#any reason to have the logic separated out like that?

# Called when the node enters the scene tree for the first time.
func _ready():
	# set weapon type
	# init weapon vars 
	#Turn on fireTimer
	fire_timer.start()
	pass # Replace with function body.

#if timer finished
func fire_weapon():
	#How many?  What other settings?  direction?
	var my_bullet = bullet_scene.instantiate()
	#print("FP:", $FirePoint.position)
	my_bullet.global_position = $FirePoint.global_position
	get_tree().get_root().add_child(my_bullet)

func stop_timer():
	$FireTimer.stop()
	pass

func init_weapon():
	#bullet_size
	bullet_count = 3
	#fire_rate
	#bullet_type
	#bullet_damage
	#bullet_speed
	pass
