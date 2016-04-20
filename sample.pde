float[][] sample(int minX, int maxX, int stepX, int minY, int maxY, int stepY, Circle[] circles){
  int numRows = ceil(maxY / stepY);
  int numCols = ceil(maxX / stepX);
  float[][] samples = new float[numRows + 1][numCols + 1];
  
  for(int row = 0; row <= numRows; row++){
    int y = row * stepY;
    for(int col = 0; col <= numCols; col++){
      int x = col * stepX;
      samples[row][col] = value(x,y,circles);
    }
  }
  return samples;
};