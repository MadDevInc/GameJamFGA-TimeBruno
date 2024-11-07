shader_type canvas_item;

uniform float height : hint_range(0, 1);
uniform vec4 color : source_color = vec4(1.0);

void fragment() {
	if(UV.y > 1.0 - height){
		COLOR.r = 1.0;
		COLOR.g *= 0.0;
		COLOR.b *= 0.0;
	}
}
