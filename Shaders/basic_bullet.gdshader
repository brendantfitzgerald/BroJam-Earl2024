shader_type canvas_item;

void fragment() {
	// UV coordinates of the current fragment
	vec2 uv = UV;

	// Center of the texture in UV coordinates
	vec2 center = vec2(0.5, 0.5);

	// Calculate the distance from the center
	float distance = distance(uv, center);

	// Assuming a circular sprite, radius in UV space is 0.5
	float radius = 0.5;

	// Check if the distance is within 70% of the radius
	if (distance <= radius * 0.7) {
		// Inside the circle - draw the pixel
		COLOR = texture(TEXTURE, UV);
	} else {
		// Outside the circle - transparent
		COLOR = vec4(0.0, 0.0, 0.0, 0.0);
	}
}
