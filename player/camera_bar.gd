extends Sprite2D

@onready var photo_timer: Timer = $"../States/WalkState/PhotoTimer"
@onready var walk_state: Node2D = $"../States/WalkState"

func _process(_delta: float):
	var point = map(photo_timer.time_left, 0, photo_timer.wait_time, 1.0, 0.0)
	
	if walk_state.prev_direction:
		hide()
	else:
		pass
		#show()
	
	material.set("shader_parameter/value", point)

func map(x: float, in_min: float, in_max: float, out_min: float, out_max: float) -> float:
	return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
