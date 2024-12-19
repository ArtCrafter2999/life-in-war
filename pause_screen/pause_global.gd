extends Node

var is_paused = false:
	get: 
		return is_paused
	set(value):
		is_paused = value;
		if(value):
			paused.emit()
		else:
			resumed.emit();

signal paused;
signal resumed;

func _input(event: InputEvent) -> void:
	if(Input.is_action_just_pressed("Pause")):
		is_paused = !is_paused;
