precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 warm;
uniform vec3 cool;
uniform vec3 lightDirection;

varying vec3 vSurfaceNormal;

/**
 * CHALLENGE: Implement the two color version of Gooch shading
 */
void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  vec4 worldNormal = vec4(normal, 0.0) * inverseModel;

  vSurfaceNormal = worldNormal.xyz;

  gl_Position = projection * viewPosition;
}
