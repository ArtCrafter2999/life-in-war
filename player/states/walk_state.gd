extends StateBase

@export var long_idle_state: StateBase;
const SPEED = 20.0;

@onready var photo_timer: Timer = $PhotoTimer;
@onready var player: CharacterBody2D = $"../..";

var prev_direction;

func physics_process(delta: float) -> void:
	var direction = Input.get_vector("Left", "Right", "Up", "Down");
	
	if(!prev_direction && direction): photo_timer.stop();
	if(prev_direction && !direction): photo_timer.start();
	
	player.velocity += direction * SPEED;
	
	player.move_and_slide()
	prev_direction = direction;


func _on_timer_timeout() -> void:
	machine.change_state(long_idle_state)
	
func exit():
	photo_timer.stop();
