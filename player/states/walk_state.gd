extends StateBase

@export var long_idle_state: StateBase;
const speed = 300.0;

@onready var photo_timer: Timer = $PhotoTimer;
@onready var player: CharacterBody2D = $"../..";

var prev_direction;

func physics_process(delta: float) -> void:
	var direction = Input.get_vector("Left", "Right", "Up", "Down");
	
	if(!prev_direction && direction): photo_timer.stop();
	if(prev_direction && !direction): photo_timer.start();
	
	if direction:
		player.velocity = direction * speed;
	else:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, speed);
	
	player.move_and_slide()
	prev_direction = direction;


func _on_timer_timeout() -> void:
	machine.change_state(long_idle_state)
	
func exit():
	photo_timer.stop();
