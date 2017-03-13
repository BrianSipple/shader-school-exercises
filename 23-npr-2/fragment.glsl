precision mediump float;

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

float diffuseWeight(vec3 surfaceNormal, vec3 directionToLight) {
  return max(0.0, dot(surfaceNormal, directionToLight));
}

float goochWeight(vec3 surfaceNormal, vec3 directionToLight) {
  return 0.5 * (1.0 + dot(surfaceNormal, directionToLight));
}

vec3 goochColor(vec3 coolColor, vec3 warmColor, float weight) {
  return ((1.0 - weight) * coolColor) + (weight * warmColor);
}

void main() {
  vec3 nSurfaceNormal = normalize(vSurfaceNormal);
  vec3 nDirectionToLight = normalize(lightDirection);

  float _diffuseWeight = goochWeight(nSurfaceNormal, nDirectionToLight);

  vec3 color = goochColor(cool, warm, _diffuseWeight);

  gl_FragColor = vec4(color, 1.0);
}
