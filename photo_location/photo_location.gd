extends Area2D
class_name PhotoLocation

@export var photo: Image;

var _collision_shapes: Array[CollisionShape2D]:
	get:
		return find_children("*", "CollisionShape2D", false, false)

var area: float:
	get:
		_collision_shapes.reduce(function(col): return col.shape.get_rect().get_area(), 0)
		return 

func take_photo():
	collision_shape.disabled = true;
	return photo;
