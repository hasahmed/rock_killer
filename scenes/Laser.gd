extends Spatial

var speed = 400

func _ready():
	pass

func _process(delta):
	self.translation.z -= speed * delta

func destory():
	self.queue_free()