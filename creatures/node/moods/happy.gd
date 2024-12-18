extends Node

@onready var creature: CharacterBody2D = $"../.."

@onready var run_timer: Timer = $RunTimer

func _process(_delta: float):
	if run_timer.is_stopped():
		run_timer.start()



func _on_run_timer_timeout():
	creature.target = creature.position + Vector2.from_angle(randf_range(0, deg_to_rad(360))) * 300
