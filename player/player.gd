extends CharacterBody2D
class_name Player

var photo_location: PhotoLocation;

const FRICTION = 0.002

func _physics_process(delta: float):
	velocity *= FRICTION ** delta

func take_photo():
	if(photo_location):
		var image = photo_location.take_photo();
		photo_location = null;
		return image;
