extends Spatial


class rock_props:
	var MAX_SPEED = 25
	var MIN_SPEED = 5
	var rotation_x = rand_range(-50, 50)
	var rotation_y = rand_range(-50, 50)
	var rotation_z = rand_range(-50, 50)
	var speed = Vector2(rand_range(MAX_SPEED, MIN_SPEED), 0)

var rot_speed = rock_props.new()
var rock_scn
var explosion_scn

func _ready():
	rock_scn = load('res://scenes/Rock.tscn')
	explosion_scn = load('res://scenes/RockParticles.tscn')

func _process(delta):
	if self.translation.z > ($'/root/Main/Globals'.viewport_size.y / 5): self.queue_free()
	self.translation.z += rot_speed.speed.x * delta
	self.translation.x += rot_speed.speed.y * delta
	rotate(delta)


func _on_rock_area_area_entered(other_area):
	var ROCK_SHIFT = 7
	var explosion = explosion_scn.instance()
	explosion.init(self.rot_speed, self.translation)
	# explosion.translation = self.translation
	# explosion.speed = self.rot_speed.speed
	$'/root/Main'.call_deferred('add_child', explosion)
	if other_area.get_name() == "laser_area":
		if self.scale.x < 1:
			$'/root/Main/Globals'.increment_score()
		else:
			for i in [-1, 1]:
				var rock = rock_scn.instance()
				rock.scale = Vector3(0.5, 0.5, 0.5)
				rock.translation = self.translation
				rock.translation.x += rock.get_node("rock_mesh").transform[0].x * i
				rock.translation.x += ROCK_SHIFT * i
				rock.rot_speed.speed = self.rot_speed.speed
				rock.rot_speed.speed.y = rand_range(1, 5) * i
				$'/root/Main'.call_deferred("add_child", rock)
		other_area.get_parent().destory()
		self.queue_free()
	elif other_area.get_name() == "missle_area":
		$'/root/Main/Globals'.increment_score()
		other_area.get_parent().queue_free()
		self.queue_free()

func rotate(delta):
	self.rotation_degrees.x += rot_speed.rotation_x * delta
	self.rotation_degrees.y += rot_speed.rotation_y * delta
	self.rotation_degrees.z += rot_speed.rotation_z * delta