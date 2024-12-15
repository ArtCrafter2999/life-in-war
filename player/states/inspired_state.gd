extends StateBase

@export var moved_state: StateBase;
@export var make_photo_state: StateBase;

@onready var photo_available_ui: Sprite2D = $PhotoAvailableUI

const fade_in_duration = .5;
const fade_out_duration = .1;

var tween: Tween
func enter():
	tween = create_tween()
	tween.tween_property(photo_available_ui, "modulate", Color.WHITE, fade_in_duration)

func input(event: InputEvent):
	if(Input.get_vector("Left", "Right", "Up", "Down")):
		machine.change_state(moved_state);
	elif(Input.is_action_just_pressed("Photo")):
		machine.change_state(make_photo_state);

func exit():
	tween.kill();
	create_tween().tween_property(photo_available_ui, "modulate", Color.TRANSPARENT, fade_out_duration)
