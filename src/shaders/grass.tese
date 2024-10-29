#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// DONE: Declare tessellation evaluation shader inputs and outputs

// in vec4 gl_Position; // Blade Position in world space (xyz) and direction (w)
layout(location = 0) in vec4 tese_v1[]; // Blade Bezier point in world space (xyz) and height (w)
layout(location = 1) in vec4 tese_v2[]; // Blade Physical model guide in world space (xyz) and width (w)
layout(location = 2) in vec4 tese_up[]; // Blade Up vector in world space (xyz) and stiffness coefficient (w)

// out vec4 gl_Position; // Blade Position in clip space
layout(location = 0) out vec3 frag_pos; // Blade Position in world space
layout(location = 1) out vec3 frag_n;   // Blade Normal in world space
layout(location = 2) out vec2 frag_uv;

void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

	// DONE: Use u and v to parameterize along the grass blade and output positions for each vertex of the grass blade

    vec3 v0 = gl_in[0].gl_Position.xyz;
    vec3 v1 = tese_v1[0].xyz;
    vec3 v2 = tese_v2[0].xyz;

    vec3 a = v0 + v * (v1 - v0);
    vec3 b = v1 + v * (v2 - v1);
    vec3 c = a + v * (b - a);

    float direction = gl_in[0].gl_Position.w;
    vec3 t1 = normalize(vec3(cos(direction), 0.0, sin(direction)));

    float width = tese_v2[0].w;
    vec3 c0 = c - width * t1;
    vec3 c1 = c + width * t1;

    vec3 t0 = normalize(b - a);

    frag_n = normalize(cross(t0, t1));

    float t = u + 0.5 * v - u * v;
    vec4 world_pos = vec4((1.0 - t) * c0 + t * c1, 1.0);
    frag_pos = world_pos.xyz;

    gl_Position = camera.proj * camera.view * world_pos;

    frag_uv = vec2(u, v);
}
