extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var player

func _ready():
	player = $'/root/Main/SpaceShip'
	print(player.missiles)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
