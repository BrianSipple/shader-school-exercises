mat2 matrixPower(highp mat2 m, int n) {
  // Raise the matrix m to nth power

  // For example:
  //
  //  matrixPower(m, 2) = m * m
  //

  const int MAX_POWER = 16;

  if (n == 0) {
    return mat2(1.0);
  }

  highp mat2 raisedMatrix = mat2(1.0) * m;

  for (int i = 1; i < MAX_POWER; i++) {
    if (i == n) {
      return raisedMatrix;
    }
    raisedMatrix *= m;
  }

  return raisedMatrix;
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)
