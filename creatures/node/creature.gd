@tool
extends CharacterBody2D

@export var creature: Creature:
	set(new):
		creature = new
		if is_node_ready():
			setup()


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var photo_location: PhotoLocation = $PhotoLocation
@onready var mood_handler: Node = $MoodHandler


var target: Vector2

func _ready():
	sprite_2d.texture = creature.texture
	collision_shape_2d.shape = creature.collision
	setup()
	
	if !Engine.is_editor_hint():
		mood_handler.mood = Creature.Mood.HAPPY


func _physics_process(_delta: float):
	if Engine.is_editor_hint():
		return
	
	var direction = global_position.direction_to(target)
	velocity = direction * creature.speed
	move_and_slide()


func setup():
	sprite_2d.texture = creature.texture
	collision_shape_2d.shape = creature.collision
	photo_location.photo = creature.texture
