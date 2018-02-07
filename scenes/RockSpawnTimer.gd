extends Timer


var rock_scn
var missile_powerup_scn
export var missile_powerup_percentage = 10


func _ready():
	rock_scn = preload('res://scenes/Rock.tscn')
	missile_powerup_scn = preload('res://scenes/MissileInCapsul.tscn')


func _on_RockSpawnTimer_timeout():
	missile_powerup_spawn()
	var rock = rock_scn.instance()
	rock.translation.z -= 100
	rock.translation.x += rand_range(-100, 100)
	$'/root/Main'.call_deferred("add_child", rock)

func missile_powerup_spawn(): 
	var rand_num = int(rand_range(0, 100))
	if rand_num %  missile_powerup_percentage == rand_num:
		var pu = missile_powerup_scn.instance()
		pu.translation.x += rand_range(-100, 100)
		$'/root/Main'.call_deferred('add_child', pu) 