precision highp float;

uniform sampler2D texture;
uniform vec2 screenSize;

/**
  * CHALLENGE: Swap red and blue color channels of image
  */
void main() {
  vec2 coord = gl_FragCoord.xy / screenSize;
  vec4 originalColor = texture2D(texture, coord);

  gl_FragColor = vec4(originalColor.b, originalColor.g, originalColor.r, originalColor.a);
}
