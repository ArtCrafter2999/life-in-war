extends CanvasLayer
class_name FocusScreen;

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var shader_rect: ColorRect = $ShaderRect

func focus():
	animation_player.play("focus")

var lod: float: 
	get:
		return (shader_rect.material as ShaderMaterial).get_shader_parameter("lod")
	set(value):
		(shader_rect.material as ShaderMaterial).set_shader_parameter("lod", value);

func release():
	animation_player.stop(true);
	var tween = create_tween()
	tween.tween_property(self, "lod", 0, .2)
	await tween.finished;
	animation_player.play("RESET");
