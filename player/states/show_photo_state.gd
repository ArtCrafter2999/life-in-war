extends StateBase

@export var close_photo_state: StateBase;

@onready var photo_image: TextureRect = $PhotoLayer/PhotoImage
@onready var player: Player = $"../.."

func enter():
	released = false;
	pressed = false;
	photo_image.visible = true;
	photo_image.texture = player.take_photo();

var released = false;
var pressed = false;


func input(event: InputEvent): 
	if(!released):
		released = event.is_released()
	elif(Input.is_anything_pressed()):
		pressed = true;
	elif(pressed && event.is_released()):
		machine.change_state(close_photo_state)

func exit():
	photo_image.visible = false;
