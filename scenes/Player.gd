extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var missle_scn
var main
var cannon_l_or_r = 1

func _ready():
	main = get_node('/root/Main')
	missle_scn = load('res://scenes/Missle.tscn')
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# self.transform.origin.x = (get_viewport().get_mouse_position().x
					# - (get_viewport().get_visible_rect().size.x / 2)) / 4
	self.translation.x = (get_viewport().get_mouse_position().x
					- (get_viewport().get_visible_rect().size.x / 2)) / 4

func _on_space_ship_area_area_entered( other_area ):
	if other_area.get_name() == "rock_area":
		self.queue_free()

func _input(ev):
	if ev.is_action_pressed("shoot_missle"):
		var missle = missle_scn.instance()
		missle.translation = get_node(cannon_lr()).global_transform.origin
		missle.translation.y = 0
		# print('missle translation: ', missle.translation)
		# print('left_cannon translation: ', get_node('left_cannon').translation)
		main.call_deferred("add_child", missle)

func cannon_lr():
	if cannon_l_or_r % 2:
		cannon_l_or_r += 1
		return 'left_cannon'
	cannon_l_or_r += 1
	return 'right_cannon'
