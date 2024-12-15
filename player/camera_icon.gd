extends Sprite2D

var tween: Tween
func stop_or_create_tween():
	if(tween):
		tween.stop();
	tween = get_tree().create_tween();

const fade_in_duration = .5;
func fade_in():
	stop_or_create_tween();
	tween.tween_property(self, "modulate", Color.WHITE, fade_in_duration)

const fade_out_duration = .1;
func fade_out():
	stop_or_create_tween();
	tween.tween_property(self, "modulate", Color.TRANSPARENT, fade_out_duration)
