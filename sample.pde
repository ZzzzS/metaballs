ArrayList<ArrayList<Float>> sample(int minX, int maxX, int stepX, int minY, int maxY, int stepY, Circle[] circles){
  int numRows = ceil(maxY / stepY);
  int numCols = ceil(maxX / stepX);
  ArrayList<ArrayList<Float>> samples = new ArrayList<ArrayList<Float>>();
  
  for(int row=0; row <= numRows; row++){
    int y = row * stepY;
    ArrayList<Float> aa = new ArrayList<Float>();
    for(int col=0; col <= numCols; col++){
      int x = col * stepX;
      aa.add(value(x,y,circles));
    }
    samples.add(aa);
  }
  return samples;
};
