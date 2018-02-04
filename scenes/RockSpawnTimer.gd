extends Timer


var rock_scn


func _ready():
	rock_scn = load('res://scenes/Rock.tscn')

func _on_RockSpawnTimer_timeout():
	var rock = rock_scn.instance()
	rock.translation.z -= 100
	rock.translation.x += rand_range(-100, 100)
	$'/root/Main'.call_deferred("add_child", rock)