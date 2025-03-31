shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform float capsule_radius = 108.0;
uniform float capsule_height = 320.0;
uniform vec2 capsule_offset = vec2(0.0, -91.0); // adjust if needed

void fragment() {
    vec2 tex_size = vec2(textureSize(TEXTURE, 0));
    vec2 uv_px = UV * tex_size;

    vec2 center = tex_size / 2.0 + capsule_offset;
    vec2 pos = uv_px - center;

    float half_width = capsule_radius; // 54
    float half_height = capsule_height / 2.0; // 80
    float rect_half_height = half_height - capsule_radius; // 26

    // Check if inside vertical rectangle
    bool inside_rect = abs(pos.x) <= half_width && abs(pos.y) <= rect_half_height;

    // Check top and bottom semi-circles
    bool inside_top_circle = distance(pos, vec2(0.0, -rect_half_height)) <= capsule_radius;
    bool inside_bottom_circle = distance(pos, vec2(0.0, rect_half_height)) <= capsule_radius;

    if (!(inside_rect || inside_top_circle || inside_bottom_circle)) {
        discard;
    }

    COLOR = texture(TEXTURE, UV);
}


//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
