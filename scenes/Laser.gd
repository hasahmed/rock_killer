extends Spatial

var speed = 400
# var speed = 50

func _ready():
	pass

func _process(delta):
	self.translation.z -= speed * delta
	if self.translation.z < -($'/root/Main/Globals'.viewport_size.y / 5): destory()


func destory():
	self.queue_free()