precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

uniform vec3 ambient;

uniform PointLight lights[4];

varying vec3 vLightDirections[4];
varying vec3 vSurfaceNormal;
varying vec3 vSurfacePosition;

float diffuseWeight(vec3 surfaceNormal, vec3 directionToLight) {
  return max(0.0, dot(surfaceNormal, directionToLight));
}

float specularWeight(
  vec3 surfaceNormal,
  vec3 eyeDirection,
  vec3 directionToLight,
  float shiniessFactor
) {
  vec3 reflectedLight = reflect(directionToLight, surfaceNormal);
  float eyeLightIntensity = max(0.0, dot(reflectedLight, eyeDirection));

  return pow(eyeLightIntensity, shiniessFactor);
}


void main() {
  vec3 eyeDirection = normalize(vSurfacePosition);
  vec3 surfaceNormal = normalize(vSurfaceNormal);

  // start with the ambient light
  vec3 lightColor = ambient;

  for (int i = 0; i < 4; i++) {
    vec3 directionToLight = normalize(vLightDirections[i]);
    float _diffuseWeight = diffuseWeight(surfaceNormal, directionToLight);
    float _specularWeight = specularWeight(surfaceNormal, eyeDirection, directionToLight, lights[i].shininess);

    vec3 diffuseColor = lights[i].diffuse * _diffuseWeight;
    vec3 specularColor = lights[i].specular * _specularWeight;

    lightColor += diffuseColor + specularColor;
  }

  gl_FragColor = vec4(lightColor, 1.0);
}
