#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// DONE: Declare tessellation control shader inputs and outputs

in gl_PerVertex
{
  vec4 gl_Position;             // Blade Position in world space (xyz) and direction (w)
} gl_in[gl_MaxPatchVertices];

layout(location = 0) in vec4 tesc_v1[]; // Blade Bezier point in world space (xyz) and height (w)
layout(location = 1) in vec4 tesc_v2[]; // Blade Physical model guide in world space (xyz) and width (w)
layout(location = 2) in vec4 tesc_up[]; // Blade Up vector in world space (xyz) and stiffness coefficient (w)

// out vec4 gl_Position; // Blade Position in world space (xyz) and direction (w)
layout(location = 0) out vec4 tese_v1[]; // Blade Bezier point in world space (xyz) and height (w)
layout(location = 1) out vec4 tese_v2[]; // Blade Physical model guide in world space (xyz) and width (w)
layout(location = 2) out vec4 tese_up[]; // Blade Up vector in world space (xyz) and stiffness coefficient (w)

void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

	// DONE: Write any shader outputs
    tese_v1[gl_InvocationID] = tesc_v1[gl_InvocationID];
    tese_v2[gl_InvocationID] = tesc_v2[gl_InvocationID];
    tese_up[gl_InvocationID] = tesc_up[gl_InvocationID];

	// DONE: Set level of tesselation
    gl_TessLevelInner[0] = 10;
    gl_TessLevelInner[1] = 10;
    gl_TessLevelOuter[0] = 10;
    gl_TessLevelOuter[1] = 10;
    gl_TessLevelOuter[2] = 10;
    gl_TessLevelOuter[3] = 10;
}
