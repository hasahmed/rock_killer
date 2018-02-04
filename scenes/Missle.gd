extends Spatial

var speed = 100
var rot_speed = rand_range(100, 1000)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	self.translation.z -= speed * delta
	self.rotation_degrees.z += rot_speed * delta
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func destory():
	self.queue_free()
