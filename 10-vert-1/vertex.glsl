precision highp float;

uniform float theta;

attribute vec2 position;

/**
  * CHALLENGE: rotate position by theta radians about the origin
  */
void main() {

  float cosTheta = cos(theta);
  float sinTheta = sin(theta);

  //  rotatation_matrx is | c    -s|
  //                      | s    c|
  // but glsl matrix constructor is column-major

  mat2 rotationMatrix = mat2(
    cosTheta, sinTheta,
    -sinTheta, cosTheta
  );

  vec2 rotatedPosition = rotationMatrix * position;

  gl_Position = vec4(rotatedPosition.xy, 0.0, 1.0);
}
