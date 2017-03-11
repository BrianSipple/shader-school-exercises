precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 vEyeDirection;
varying vec3 vSurfaceNormal;

float phongWeight(
  vec3 surfaceNormal,
  vec3 eyeDirection,
  vec3 lightDirection,
  float shininessFactor
) {
  vec3 reflectedLight = reflect(-lightDirection, surfaceNormal);
  float eyeLightIntensity = max(0.0, dot(reflectedLight, eyeDirection));

  return pow(eyeLightIntensity, shininessFactor);
}

float lambertWeight(vec3 surfaceNormalInWorldSpace, vec3 lightDirection) {
  return max(0.0, dot(surfaceNormalInWorldSpace, lightDirection));
}


void main() {
  float _phongWeight = phongWeight(vSurfaceNormal, vEyeDirection, lightDirection, shininess);
  float _lambertWeight = lambertWeight(vSurfaceNormal, lightDirection);

  vec3 color = (
    ambient +
    diffuse * _lambertWeight +
    specular * _phongWeight
  );

  gl_FragColor = vec4(color, 1.0);
}
