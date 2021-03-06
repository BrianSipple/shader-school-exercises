bool inBox(highp vec2 lo, highp vec2 hi, highp vec2 p) {

  // Test if the point p is inside the box bounded by [lo, hi]

  if (all(lessThan(p, hi))) {
    return all(greaterThan(p, lo));
  }

  return false;
}


//Do not change this line or the name of the above function
#pragma glslify: export(inBox)
