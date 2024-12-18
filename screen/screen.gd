extends CanvasLayer


@onready var animation_player: AnimationPlayer = $AnimationPlayer


func focus():
	animation_player.play("focus")


func _nothin():
	focus()
