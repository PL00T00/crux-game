shader_type spatial;
render_mode unshaded, cull_back;

uniform float blade_height = 0.5;
uniform float blade_width = 0.005;
uniform float density = 0.1; // scale from 0 to 1


// colors
uniform vec3 base_color : source_color = vec3(0.0, 0.0, 0.0);
uniform vec3 tip_color : source_color = vec3(0.0, 0.0, 0.0);

varying float height_ratio; // scales the color of the blades based on height

uniform float wind_strength = 0.03;
uniform float rnd_multiplier = 10.0; // acts as random value to generate grass

// funtion that generate random value
float rand(vec2 coordinates){
	return fract(sin(dot(coordinates.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

//called for ever vertex the material is visible on.
void vertex() {
	float rnd = rand(VERTEX.xz * rnd_multiplier);
	
	if (rnd > 1.0 - density){
		float h = blade_height * (0.5 + rand(vec2(VERTEX.z, VERTEX.x)) * 0.5);
		float sway = sin(TIME * 0.3 + VERTEX.x * 1.0 + rnd * 10.0) * wind_strength; // velocidad de movimiento
		
		VERTEX.y += h;
		VERTEX.x += sin(rnd * rnd_multiplier) * blade_width + sway * 0.1; // reduce el angulo de movimiento
		VERTEX.z += sin(rnd * rnd_multiplier) * blade_width;
		
		height_ratio = clamp(VERTEX.y / (blade_height * 2.0), 0.2, 1.0);
}
else {
	height_ratio = 0.0;
}

}

//called for ever pixel the material is visible on.
void fragment() {
	ALBEDO = mix(base_color, tip_color, height_ratio);
}