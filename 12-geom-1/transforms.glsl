precision highp float;

attribute vec3 position;

uniform mat4 model, view, projection;

/**
 * CHALLENGE: Apply the model-view-projection matrix to `position`
 */
void main() {
  gl_Position =  (projection * view * model) * vec4(position, 1.0);
}
