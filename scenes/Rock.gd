extends Spatial

var rotation_x = rand_range(-50, 50)
var rotation_y = rand_range(-50, 50)
var rotation_z = rand_range(-50, 50)
var speed = rand_range(10, 50)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	self.translation.z += speed * delta
	rotate(delta)


func _on_rock_area_area_entered(other_area):
	if other_area.get_name() == "missle_area":
		Globals.increment_score()
		other_area.get_parent().destory()
		self.queue_free()

func rotate(delta):
	self.rotation_degrees.x += rotation_x * delta
	self.rotation_degrees.y += rotation_y * delta
	self.rotation_degrees.z += rotation_z * delta