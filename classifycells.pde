int[][] classifyCells(boolean[][] corners){
  int[][] ret = new int[corners.length - 1][corners[0].length - 1];
  for(int i = 0; i < corners.length - 1; i++){
    ArrayList<Integer> aa = new ArrayList<Integer>();
    for(int j=0; j < corners[i].length - 1; j++){
      boolean NW = corners[i][j];
      boolean NE = corners[i][j + 1];
      boolean SW = corners[i + 1][j];
      boolean SE = corners[i + 1][j + 1];
      
      ret[i][j] = ((SW ? 1 : 0) << 0) + ((SE ? 1 : 0) << 1) + ((NE ? 1 : 0) << 2) + ((NW ? 1 : 0) << 3);
    }
  }
  return ret;
}