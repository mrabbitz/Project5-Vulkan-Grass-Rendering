
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 1, binding = 0) uniform ModelBufferObject {
    mat4 model;
};

// DONE: Declare vertex shader inputs and outputs

layout(location = 0) in vec4 vert_v0; // Blade Position in local space (xyz) and direction (w)
layout(location = 1) in vec4 vert_v1; // Blade Bezier point in local space (xyz) and height (w)
layout(location = 2) in vec4 vert_v2; // Blade Physical model guide in local space (xyz) and width (w)
layout(location = 3) in vec4 vert_up; // Blade Up vector in local space (xyz) and stiffness coefficient (w)

out gl_PerVertex {
    vec4 gl_Position; // Blade Position in world space (xyz) and direction (w)
};

layout(location = 0) out vec4 tesc_v1; // Blade Bezier point in world space (xyz) and height (w)
layout(location = 1) out vec4 tesc_v2; // Blade Physical model guide in world space (xyz) and width (w)
layout(location = 2) out vec4 tesc_up; // Blade Up vector in world space (xyz) and stiffness coefficient (w)

void main() {
	// DONE: Write gl_Position and any other shader outputs

    gl_Position = vec4((model * vec4(vert_v0.xyz, 1.0)).xyz, vert_v0.w);
    tesc_v1 = vec4((model * vec4(vert_v1.xyz, 1.0)).xyz, vert_v1.w);
    tesc_v2 = vec4((model * vec4(vert_v2.xyz, 1.0)).xyz, vert_v2.w);
    tesc_up = vec4((model * vec4(vert_up.xyz, 1.0)).xyz, vert_up.w);
}
