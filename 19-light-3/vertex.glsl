precision mediump float;

attribute vec3 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 vEyeDirection;
varying vec3 vSurfaceNormal;

void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  vec4 worldNormal = vec4(normal, 0.0) * inverseModel * inverseView;

  vEyeDirection = normalize(position - viewPosition.xyz);
  vSurfaceNormal = worldNormal.xyz;

  gl_Position = projection * viewPosition;
}
