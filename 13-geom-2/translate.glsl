/**
 * CHALLENGE: Construct a matrix, m, which translates all
 * points so that p is at the origin.
 */
highp mat4 translate(highp vec3 p) {
  vec3 toOrigin = vec3(-p.x, -p.y, -p.z);

  mat4 translationMatrix = mat4(
    1,          0,          0,          0,
    0,          1,          0,          0,
    0,          0,          1,          0,
    toOrigin.x, toOrigin.y, toOrigin.z, 1
  );

  return translationMatrix;
}

//Do not remove this line
#pragma glslify: export(translate)
