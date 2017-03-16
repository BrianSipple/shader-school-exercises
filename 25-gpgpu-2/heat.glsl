/**
 * CHALLENGE: Implement a shader which computes a single step of
 * the explicit Euler scheme for integrating the heat equation,
 * described below.
 */
precision mediump float;

uniform sampler2D prevState;
uniform vec2 stateSize;
uniform float kdiffuse;
uniform float kdamping;

float getHeatVal(vec2 coord, int offsetX, int offsetY) {
  vec2 newCoord = coord + vec2(offsetX, offsetY);

  return texture2D(prevState, fract(newCoord / stateSize)).r;
}

float laplaceIntegration(vec2 coord) {
  // Euler integration
  return (
    getHeatVal(coord, -1,  0) +
    getHeatVal(coord,  1,  0) +
    getHeatVal(coord,  0, -1) +
    getHeatVal(coord,  0,  1)
  ) - 4.0 * getHeatVal(coord, 0, 0);
}


float state(vec2 coord) {
  float laplaceValue = laplaceIntegration(coord);

  return (
    (1.0 - kdamping) *
    (kdiffuse * laplaceValue + getHeatVal(coord, 0, 0))
  );
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Compute next state using a 5-point Laplacian stencil and the rule
  float y = state(coord);

  gl_FragColor = vec4(y,y,y,1);
}
