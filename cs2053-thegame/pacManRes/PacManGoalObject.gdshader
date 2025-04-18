shader_type canvas_item;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);

    // If the pixel is nearly black, discard it
    if (tex_color.rgb == vec3(0.0)) {
        discard;
    }

    COLOR = tex_color;
}
