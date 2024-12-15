extends CharacterBody2D
class_name Player

var photo_location: PhotoLocation;

func take_photo():
	if(photo_location):
		var image = photo_location.take_photo();
		photo_location = null;
		return image;
