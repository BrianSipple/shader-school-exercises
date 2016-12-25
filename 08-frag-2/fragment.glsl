precision mediump float;

bool inTile(vec2 pos, float tileSize) {
  vec2 pTile = step(0.5, fract(0.5 * pos / tileSize));

  return pTile.x == pTile.y;
}

/**
 * Implements a function that draws a checkerboard
 */
void main() {
  float tileSize = 16.0;

  if (inTile(gl_FragCoord.xy, tileSize)) {
    gl_FragColor = vec4(1.0);

  } else {
    discard;
  }
}
