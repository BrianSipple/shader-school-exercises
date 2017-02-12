precision mediump float;

uniform mat4 model, view, projection;
uniform vec3 ambient;

void main() {
  gl_FragColor = vec4(ambient.x, ambient.y, ambient.z, 1.0);
}
