extends Node
var score = 0
var score_increment = 1
var main
var score_label
var viewport_size


func _ready():
	viewport_size = get_viewport().get_visible_rect().size
	main = $'/root/Main'
	score_label = main.get_node('ScoreLabel')
	update_score_label_text()

func increment_score():
	score += score_increment
	update_score_label_text()

func update_score_label_text():
	score_label.text = "score: " + str(score)


func _input(ev):
	if ev.is_action_pressed("reset_game"):
		if not main.find_node('SpaceShip'):
			get_tree().change_scene('res://scenes/Main.tscn')

func _process(delta):
	# print(get_viewport().get_visible_rect().size.y)
	# print(get_viewport().get_mouse_position().y)