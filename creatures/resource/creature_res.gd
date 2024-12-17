@icon("res://creatures/resource/icon.png")
extends Resource
class_name Creature

@export var texture: Texture
@export var collision: Shape2D

@export var speed: float


@export var curious_weight: float
@export var frightened_weight: float
@export var happy_weight: float
@export var cautious_weight: float

enum Mood {CURIOUS, FRIGHTENED, HAPPY, CAUTIOUS}
