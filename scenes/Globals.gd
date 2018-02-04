extends Node
var score = 0
var score_increment = 1
var main
var score_label

func _ready():
	main = $'/root/Main'
	score_label = main.get_node('ScoreLabel')
	update_score_label_text()

func increment_score():
	score += score_increment
	update_score_label_text()

func update_score_label_text():
	score_label.text = "score: " + str(score)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
