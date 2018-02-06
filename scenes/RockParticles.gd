extends Spatial


var speed = Vector2(0, 0)

func _ready():
	self.get_node('particles').emitting = true


func _process(delta):
	self.translation.z += speed.x * delta
	self.translation.x += speed.y * delta

func init(rot_speed, translation):
	self.translation = translation
	self.speed = rot_speed.speed