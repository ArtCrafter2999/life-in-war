extends StateBase

@export var no_inspiration_state: StateBase;
@export var inspiration_state: StateBase;

@onready var insperation_area: Area2D = $InsperationArea
@onready var player: Player = $"../.."

func _get_photo_location():
	var areas = insperation_area.get_overlapping_areas() as Array[PhotoLocation]
	if(areas.size() == 0): 
		return null;
	if(areas.size() > 1): 
		areas.sort_custom(func (a, b): a.area < b.area)
	return areas[0];

func enter():
	player.photo_location = _get_photo_location();
	print(player.photo_location)
	machine.change_state(inspiration_state if player.photo_location else no_inspiration_state)
