extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var missle_scn
var laser_scn
var main
var cannon_l_or_r = 1
var missiles = 0

func _ready():
	main = get_node('/root/Main')
	missle_scn = preload('res://scenes/Missle.tscn')
	laser_scn = preload('res://scenes/Laser.tscn')

func _process(delta):
	self.translation.x = (get_viewport().get_mouse_position().x
					- (get_viewport().get_visible_rect().size.x / 2)) / 4

func _on_space_ship_area_area_entered( other_area ):
	if other_area.get_name() == "rock_area":
		self.queue_free()
	elif other_area.get_name() == 'glass_capsul_area':
		missiles += 1

func _input(ev):
	if ev.is_action_pressed("shoot_missle"):
		shoot_missile()
		# for i in range(2):
		# 	var missle = missle_scn.instance()
		# 	missle.translation = get_node(cannon_lr()).global_transform.origin
		# 	missle.translation.y = 0
		# 	main.call_deferred("add_child", missle)
	elif ev.is_action_pressed("shoot_laser"):
		var laser = laser_scn.instance()
		laser.translation = get_node('LaserCannon').global_transform.origin
		laser.translation.y = 0
		main.call_deferred("add_child", laser)

func cannon_lr():
	if cannon_l_or_r % 2:
		cannon_l_or_r += 1
		return 'left_cannon'
	cannon_l_or_r += 1
	return 'right_cannon'


func shoot_missile():
	if missiles > 0:
		missiles -= 1
		for i in range(2):
			var missle = missle_scn.instance()
			missle.translation = get_node(cannon_lr()).global_transform.origin
			missle.translation.y = 0
			main.call_deferred("add_child", missle)