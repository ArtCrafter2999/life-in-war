extends Area2D
class_name PhotoLocation

@export var photo: Texture2D;

var _collision_shape: CollisionShape2D:
	get:
		return find_children("*", "CollisionShape2D", false, false)[0]

var area: float:
	get:
		return _collision_shape.shape.get_rect().get_area();
		
func take_photo() -> Texture2D:
	$"..".modulate = Color.DIM_GRAY
	_collision_shape.disabled = true;
	return photo;
