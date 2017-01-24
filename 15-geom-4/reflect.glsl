/**
 * CHALLENGE: Return a matrix that reflects all points
 * about the plane passing through the origin with normal n
 */
highp mat4 reflection(highp vec3 n) {

  vec3 reflectedNormal = reflectPoint(vec3(0, 0, 0), n);

  vec3 axis = normalize(n);

  return mat4(
    1.0 - 2.0 * axis.x * axis.x,  -2.0 * axis.y * axis.x,        -2.0 * axis.z * axis.x,       0,
    -2.0 * axis.x * axis.y,       1.0 - 2.0 * axis.y * axis.y,   -2.0 * axis.z * axis.y,       0,
    -2.0 * axis.x * axis.z,       -2.0 * axis.y * axis.z,        1.0 -2.0 * axis.z * axis.z,   0,
    0,                            0,                             0,                            1
  );
}

#pragma glslify: export(reflection)
