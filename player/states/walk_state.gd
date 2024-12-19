extends StateBase

@export var focus_state: StateBase;
const SPEED = 20.0;

@onready var player: CharacterBody2D = $"../..";
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var sprite: Sprite2D = $"../../Sprite"

var sprite_direction: Vector2;
var is_moving: bool;
func physics_process(delta: float) -> void:
	var direction = Input.get_vector("Left", "Right", "Up", "Down");
	
	if(direction):
		sprite_direction = direction;
	is_moving = direction != Vector2.ZERO
	
	player.velocity += direction * SPEED;

func _physics_process(delta: float) -> void:
	player.move_and_slide()

func input(event: InputEvent): 
	if(Input.is_action_just_pressed("Focus")):
		machine.change_state(focus_state)

func getDirection(input: Vector2):
	if(input == Vector2.ZERO): return sprite_direction;
	if(input.y == 0):
		return Vector2.RIGHT if input.x > 0 else Vector2.LEFT;
	return Vector2.DOWN if input.y > 0 else Vector2.UP;

func process(delta: float) -> void: 
	sprite.flip_h = sprite_direction == Vector2.LEFT;
	var is_side = sprite_direction.y == 0
	var is_back = sprite_direction.y < 0
	
	var animation = ("side" if is_side && is_moving else \
						("back" if is_back else "front"))\
							 + ("-walk" if is_moving else "-idle")
	animation_player.play(animation)

func exit():
	is_moving = false;
	process(0);
