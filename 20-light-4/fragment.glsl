precision mediump float;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 specular;

uniform float shininess;

varying vec3 vLightDirection;
varying vec3 vSurfaceNormal;
varying vec3 vSurfacePosition;


float specularWeight(
  vec3 surfaceNormal,
  vec3 eyeDirection,
  vec3 directionToLight,
  float shininessFactor
) {
  vec3 reflectedLight = reflect(directionToLight, surfaceNormal);
  float eyeLightIntensity = max(0.0, dot(reflectedLight, eyeDirection));

  return pow(eyeLightIntensity, shininessFactor);
}

float diffuseWeight(
  vec3 surfaceNormalInWorldSpace,
  vec3 lightDirection
) {
  return max(0.0, dot(surfaceNormalInWorldSpace, lightDirection));
}

void main() {
  vec3 eyeDirection = normalize(vSurfacePosition);
  vec3 directionToLight = normalize(vLightDirection);
  vec3 surfaceNormal = normalize(vSurfaceNormal);

  float _specularWeight = specularWeight(surfaceNormal, eyeDirection, directionToLight, shininess);
  float _diffuseWeight = diffuseWeight(surfaceNormal, directionToLight);

  vec3 color = (
    ambient +
    diffuse * _diffuseWeight +
    specular * _specularWeight
  );

  gl_FragColor = vec4(color, 1.0);
}
