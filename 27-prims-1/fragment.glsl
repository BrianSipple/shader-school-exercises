precision highp float;

varying float vSize;
varying vec3 vColor;

void main() {
  vec2 xy = gl_PointCoord.st;
  vec2 pointCenter = vec2(0.5, 0.5);

  if (distance(xy, pointCenter) > 0.5) {
    discard;
  }

  gl_FragColor = vec4(vColor, 1.0);
}
