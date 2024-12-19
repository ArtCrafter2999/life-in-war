extends StateBase

@export var focus_state: StateBase;
const SPEED = 20.0;

@onready var player: CharacterBody2D = $"../..";

func physics_process(delta: float) -> void:
	var direction = Input.get_vector("Left", "Right", "Up", "Down");
	
	player.velocity += direction * SPEED;

func _physics_process(delta: float) -> void:
	player.move_and_slide()

func input(event: InputEvent): 
	if(Input.is_action_just_pressed("Focus")):
		machine.change_state(focus_state)
