shader_type canvas_item;

uniform sampler2D screen : hint_screen_texture, filter_nearest;
uniform vec2 scale = vec2(1.0, 1.0);
uniform float y_zoom;
//uniform vec4 reflection_color: source_color;
uniform sampler2D fadeGradient;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    float uv_height = SCREEN_PIXEL_SIZE.y / TEXTURE_PIXEL_SIZE.y;
    vec2 reflected_screenuv = vec2(SCREEN_UV.x, SCREEN_UV.y - uv_height * UV.y * scale.y * y_zoom * 2.0);
    vec2 screen_uv = SCREEN_UV; // or you can define your own UV coordinates
    vec4 screen_color = texture(SCREEN_TEXTURE, screen_uv);
    vec4 reflection = texture(screen, reflected_screenuv) / 2.0;
    vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);
    vec4 gradient= texture(fadeGradient, UV);

	COLOR.rgb = mix(color.rgb, color.rgb, gradient.a);
	COLOR = vec4(1.0 - COLOR.rgb, COLOR.a);
}