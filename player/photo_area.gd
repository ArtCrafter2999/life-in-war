extends Area2D

@onready var photo_timer: Timer = $PhotoTimer
@onready var photo_available_ui: Sprite2D = $PhotoAvailableUI
signal can_photo();
signal cant_photo();

func _on_start_moving() -> void:
	photo_timer.stop();
	cant_photo.emit();

func _on_stopped_moving() -> void:
	photo_timer.start();

func _on_timer_timeout() -> void:
	can_photo.emit();
