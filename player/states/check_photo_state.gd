extends StateBase

@export var released_focus_state: StateBase;
@export var take_photo_state: StateBase;

@onready var insperation_area: Area2D = $InsperationArea
@onready var player: Player = $"../.."
@onready var photo_available_ui: Sprite2D = $PhotoAvailableUI
@onready var cant_photo_ui: Sprite2D = $CantPhotoUI

const FADE_IN_DURATION = .5;
const FADE_OUT_DURATION = .1;

var tween: Tween
var ui: Sprite2D
func enter():
	photo = _get_photo_location();
	ui = photo_available_ui if photo else cant_photo_ui
	
	tween = create_tween();
	tween.tween_property(ui, "modulate", Color.WHITE, FADE_IN_DURATION)

func _get_photo_location():
	var areas = insperation_area.get_overlapping_areas() as Array[PhotoLocation]
	if(areas.size() == 0): 
		return null;
	if(areas.size() > 1): 
		areas.sort_custom(func (a, b): a.area < b.area)
	return areas[0];

var photo: PhotoLocation: 
	get:
		return player.photo_location;
	set(value): 
		player.photo_location = value;

func input(event: InputEvent):
	if(Input.is_action_just_released("Focus")):
		machine.change_state(released_focus_state);
	if(Input.is_action_just_pressed("Photo")):
		machine.change_state(take_photo_state);

func exit():
	tween.kill();
	create_tween().tween_property(ui, "modulate", Color.TRANSPARENT, FADE_OUT_DURATION)
