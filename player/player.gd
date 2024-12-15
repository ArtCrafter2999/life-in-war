extends CharacterBody2D


const speed = 300.0
@onready var photo_timer: Timer = $PhotoTimer
@onready var photo_available_ui: Sprite2D = $PhotoAvailableUI
signal start_moving();
signal stopped_moving();

var prev_direction

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("Left", "Right", "Up", "Down");
	if(!prev_direction && direction):
		start_moving.emit();
	if(prev_direction && !direction):
		stopped_moving.emit();
		
	if direction:
		velocity = direction * speed;
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed);
	
	move_and_slide()
	prev_direction = direction;
