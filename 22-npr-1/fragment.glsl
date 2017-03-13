precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 vSurfaceNormal;

float diffuseWeight(vec3 surfaceNormal, vec3 directionToLight) {
  return max(0.0, dot(surfaceNormal, directionToLight));
}

void main() {
  vec3 surfaceNormal = normalize(vSurfaceNormal);
  vec3 nLightDirection = normalize(lightDirection);

  float _diffuseWeight = diffuseWeight(surfaceNormal, nLightDirection);

  // Transform the _diffuseWeight according to our cel shading logic
  _diffuseWeight = ceil(_diffuseWeight * numBands) / numBands;

  vec3 diffuseColor = diffuse * _diffuseWeight;

  gl_FragColor = vec4(diffuseColor, 1.0);
}
