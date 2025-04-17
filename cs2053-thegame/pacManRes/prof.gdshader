shader_type canvas_item;

uniform float capsule_radius = 108.0;
uniform float capsule_height = 320.0;
uniform vec2 capsule_offset = vec2(0.0, -91.0); // adjust if needed
uniform vec4 tint_color : source_color = vec4(1.0, 0.0, 0.0, 1.0); // Red tint

void fragment() {
    vec2 tex_size = vec2(textureSize(TEXTURE, 0));
    vec2 uv_px = UV * tex_size;

    vec2 center = tex_size / 2.0 + capsule_offset;
    vec2 pos = uv_px - center;

    float half_width = capsule_radius;
    float half_height = capsule_height / 2.0;
    float rect_half_height = half_height - capsule_radius;

    bool inside_rect = abs(pos.x) <= half_width && abs(pos.y) <= rect_half_height;
    bool inside_top_circle = distance(pos, vec2(0.0, -rect_half_height)) <= capsule_radius;
    bool inside_bottom_circle = distance(pos, vec2(0.0, rect_half_height)) <= capsule_radius;

    if (!(inside_rect || inside_top_circle || inside_bottom_circle)) {
        discard;
    }

    COLOR = texture(TEXTURE, UV) * tint_color;
}
