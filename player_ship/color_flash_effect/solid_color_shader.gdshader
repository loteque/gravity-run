shader_type canvas_item;

uniform vec4 color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform bool is_on = false;

void fragment() {
    if (is_on) {
        float alpha = texture(TEXTURE, UV).a;
        COLOR = vec4(color.rgb, alpha);
    }
}