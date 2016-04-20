float lerp(float x0, float x1, int y0, int y1, float x){
  if(x0 == x1){
    return 0;
  }
  return y0 + (y1 - y0) * (x - x0) / (x1 - x0);
}