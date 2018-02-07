extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var player
var str_prefix = "missiles: "

func _ready():
	update_label()


func update_label():
	text = str_prefix + str(get_parent().missiles)