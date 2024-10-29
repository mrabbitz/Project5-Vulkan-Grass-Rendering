#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// DONE: Declare fragment shader inputs

layout(location = 0) in vec3 frag_pos; // Blade Position in world space
layout(location = 1) in vec3 frag_n;   // Blade Normal in world space
layout(location = 2) in vec2 frag_uv;

layout(location = 0) out vec4 outColor;

void main() {
    // DONE: Compute fragment color

    vec3 grass_color = vec3(0.25, 0.75, 0.25);

    vec3 light_dir = normalize(vec3(0.33, -0.33, -0.33));
    float lambert = clamp(dot(frag_n, light_dir), 0.25, 0.99);

    vec4 lambert_color = vec4(grass_color * lambert, 1.0);

    outColor = mix(vec4(frag_uv.x, frag_uv.y, 0.0, 1.0), lambert_color, 1.0);
}
