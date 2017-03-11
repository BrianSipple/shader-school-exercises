precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 lightPosition;

varying vec3 vLightDirection;
varying vec3 vSurfaceNormal;
varying vec3 vSurfacePosition;

void main() {
  vec4 surfacePosition = model * vec4(position, 1.0);
  vec4 viewPosition = view * surfacePosition;
  vec4 viewNormal = vec4(normal, 0.0) * inverseModel * inverseView;
  vec4 viewLight = view * vec4(lightPosition, 1.0);

  vSurfaceNormal = viewNormal.xyz;
  vSurfacePosition = surfacePosition.xyz;
  vLightDirection = viewLight.xyz - viewPosition.xyz;

  gl_Position = projection * viewPosition;
}
