extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var fall_speed = 10

func _ready():
	translation.z -= 100
	pass

func _process(delta):
	translation.z += fall_speed * delta
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_glass_capsul_area_area_entered(other_area):
	if other_area.get_name() == "space_ship_area":
		self.queue_free()
