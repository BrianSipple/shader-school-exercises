precision mediump float;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 lightDirection;

varying vec3 fragNormal;

/**
 * A surface is illuminated by a light source only if the angle of incidence is between 0 and 90 degrees
 */
float lambertWeight(vec3 normal, vec3 lightDirection) {
  return max(0.0, dot(normal, lightDirection));
}

void main() {
  vec3 color = ambient + diffuse * lambertWeight(fragNormal, lightDirection);

  gl_FragColor = vec4(color, 1.0);
}
