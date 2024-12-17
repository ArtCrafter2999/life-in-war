shader_type canvas_item;

render_mode blend_mix;
uniform vec4 modulate : source_color;
uniform float value;


float map(float x, float in_min, float in_max, float out_min, float out_max) {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}


void fragment() {
	vec4 da_texture = texture(TEXTURE, UV);
	vec3 color = modulate.rgb;

	vec2 zerod_uv = UV - vec2(0.5);

	float angle = degrees(atan(zerod_uv.y, zerod_uv.x));

	float real_value = map(value, 0.0, 1.0, -180.0, 180.0);

	if (angle > real_value) {
		color = vec3(0.0);
	}



	COLOR = vec4(color, da_texture.a);
}