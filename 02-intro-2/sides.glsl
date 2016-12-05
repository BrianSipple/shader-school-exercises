void sideLengths(
  highp float hypotenuse,
  highp float angleInDegrees,
  out highp float opposite,
  out highp float adjacent
) {
  precision highp float;

  float angleRadians = radians(angleInDegrees);

  opposite = sin(angleRadians) * hypotenuse;
  adjacent = cos(angleRadians) * hypotenuse;
}

//Do not change this line
#pragma glslify: export(sideLengths)
