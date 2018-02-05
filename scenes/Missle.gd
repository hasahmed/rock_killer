extends Spatial

var speed = 100
var rot_speed = rand_range(100, 1000)

func _ready():
	pass

func _process(delta):
	self.translation.z -= speed * delta
	self.rotation_degrees.z += rot_speed * delta

func destory():
	self.queue_free()