shader_type canvas_item;

uniform float circle_radius = 7.0; // in pixels
uniform vec2 circle_offset = vec2(0.0, 0.0); // offset in pixels

void fragment() {
    // TEXTURE_PIXEL_SIZE = 1 / textureSize(TEXTURE, 0)
    vec2 tex_size = vec2(1.0) / TEXTURE_PIXEL_SIZE;

    vec2 uv_px = UV * tex_size;
    vec2 center = tex_size / 2.0 + circle_offset;

    float dist = distance(uv_px, center);

    if (dist > circle_radius) {
        discard;
    }

    COLOR = texture(TEXTURE, UV);
}
