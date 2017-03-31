precision highp float;

attribute vec3 position, color;

/**
 * The desired size of the circle radius
 */
attribute float size;

uniform mat4 model, view, projection;

varying float vSize;
varying vec3 vColor;


/**
 * CHALLENGE: Create a vertex/fragment shader pair to render a
 * collection of colored point sprites.
 */
void main() {
  vSize = size;
  vColor = color;

  gl_PointSize = size;
  gl_Position = projection * view * model * vec4(position, 1.0);
}
