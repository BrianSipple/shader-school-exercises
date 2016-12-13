bool mandelbrotConverges(highp vec2 z) {
  return length(z) < 2.0;
}

vec2 _computeMandelbrot(highp vec2 z, highp vec2 c) {
  return vec2( (z.x * z.x) - (z.y * z.y), 2.0 * z.x * z.y) + c;
}

bool mandelbrot(highp vec2 c) {

  vec2 z = vec2(0.0, 0.0);

  // Test if the point c is inside the mandelbrot set after 100 iterations
  for (int i = 0; i < 100; i++) {
    z = _computeMandelbrot(z, c);
  }

  return mandelbrotConverges(z);
}


//Do not change this line or the name of the above function
#pragma glslify: export(mandelbrot)
