extends StateBase

@export var close_photo_state: StateBase;

@onready var photo_image: TextureRect = $PhotoLayer/PhotoImage
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $PhotoLayer/AnimationPlayer

func enter():
	released = false;
	pressed = false;
	photo_image.visible = true;
	animation_player.speed_scale = 1
	photo_image.texture = player.take_photo();
	animation_player.play("slide")

var released = false;
var pressed = false;


func input(event: InputEvent): 
	if(!released):
		released = !Input.is_anything_pressed()
	elif(Input.is_anything_pressed()):
		pressed = true;
	elif(pressed && event.is_released()):
		machine.change_state(close_photo_state)

func exit():
	animation_player.play_backwards("slide")
	await animation_player.animation_finished
	photo_image.visible = false;
