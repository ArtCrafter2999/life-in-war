extends StateBase

@export var released_focus_state: StateBase;
@export var focused_state: StateBase;

@onready var timer: Timer = $Timer
@onready var blur: FocusScreen = $Blur

func enter():
	blur.focus();

func focused():
	machine.change_state(focused_state);

func input(event: InputEvent):
	if(Input.is_action_just_released("Focus")):
		machine.change_state(released_focus_state);

func exit():
	blur.release();
