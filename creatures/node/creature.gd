@tool
extends CharacterBody2D

@export var creature: Creature:
	set(new):
		creature = new
		if Engine.is_editor_hint():
			setup()


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var photo_location: PhotoLocation = $PhotoLocation

var mood: Creature.Mood = Creature.Mood.HAPPY

var target: Vector2

func _ready():
	sprite_2d.texture = creature.texture
	collision_shape_2d.shape = creature.collision
	setup()

func setup():
	sprite_2d.texture = creature.texture
	collision_shape_2d.shape = creature.collision
	photo_location.photo = creature.texture
