precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

int getTexVal(vec2 coord, int offsetX, int offsetY) {
  vec2 newCoord = (coord + vec2(offsetX, offsetY)) / stateSize;

  return int(texture2D(prevState, newCoord).r);
}

int sumNeighbors(vec2 coord) {
  return (
    getTexVal(coord, -1, -1) +
    getTexVal(coord, -1,  0) +
    getTexVal(coord, -1,  1) +
    getTexVal(coord, 0,  -1) +
    getTexVal(coord, 0,   1) +
    getTexVal(coord, 1,  -1) +
    getTexVal(coord, 1,   0) +
    getTexVal(coord, 1,   1)
  );
}

/**
 * State algorithm for Conway's Game of Life.
 *
 * Birth: If a cell is off and has exactly 3 neighbors, it turns on
 * Life: If a cell is on, and has 2 or 3 neighbors it stays on
 * Death: Otherwise, a cell turns off
 */
float state(vec2 coord) {
  int neighborCount = sumNeighbors(coord);
  int currentState = getTexVal(coord, 0, 0);

  if (currentState == 0 && neighborCount == 3) {
    return 1.0;
  }

  if (currentState == 1 && (neighborCount == 2 || neighborCount == 3)) {
    return 1.0;
  }

  return 0.0;
}

/**
 * CHALLENGE: Implement Conway's Game of Life.
 */
void main() {
  vec2 fragCoord = gl_FragCoord.xy;

  float s = state(fragCoord);

  gl_FragColor = vec4(s,s,s, 1.0);
}
