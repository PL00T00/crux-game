shader_type spatial;
render_mode unshaded, cull_back;

uniform float blade_height = 0.5;
uniform float blade_width = 0.005;
uniform float density = 0.1;
uniform float speed = 0.9;

// colors
uniform vec3 base_color : source_color = vec3(0.0);
uniform vec3 tip_color : source_color = vec3(0.0);

uniform float wind_strength = 0.03;
uniform float rnd_multiplier = 10.0;

varying float height_ratio;

// Generates a random value from coordinates
float rand(vec2 coordinates) {
	return fract(sin(dot(coordinates, vec2(12.9898, 78.233))) * 43758.5453);
}

void vertex() {
	float rnd = rand(VERTEX.xz * rnd_multiplier);

	// Extract the object's scale from the model matrix so the grass
	// scales correctly with the mesh.
	vec3 object_scale = vec3(
		length(MODEL_MATRIX[0].xyz),
		length(MODEL_MATRIX[1].xyz),
		length(MODEL_MATRIX[2].xyz)
	);

	float scale_xz = max(object_scale.x, object_scale.z);

	if (rnd > 1.0 - density) {
		float h = blade_height * object_scale.y *
			(0.5 + rand(vec2(VERTEX.z, VERTEX.x)) * 0.5);

		float w = blade_width * scale_xz;

		float sway = sin(
			TIME * speed +
			VERTEX.x +
			rnd * 10.0
		) * wind_strength * scale_xz;

		VERTEX.y += h;
		VERTEX.x += sin(rnd * rnd_multiplier) * w + sway * 0.1;
		VERTEX.z += sin(rnd * rnd_multiplier) * w;

		height_ratio = clamp(
			VERTEX.y / (blade_height * object_scale.y * 2.0),
			0.2,
			1.0
		);
	} else {
		height_ratio = 0.0;
	}
}

void fragment() {
	ALBEDO = mix(base_color, tip_color, height_ratio);
}