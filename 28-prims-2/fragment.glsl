precision highp float;

uniform vec3 frontColor, backColor;

/**
 * Write a fragment shader which colors fragments depending on their relative
 * orientation to the view direction.
 *
 * If they are facing away from the camera, color them with `backColor`.
 * If they are facing towards the camera color them with `frontColor`.
 */
void main() {

  vec3 color = gl_FrontFacing ? frontColor : backColor;

  gl_FragColor = vec4(color, 1.0);
}
