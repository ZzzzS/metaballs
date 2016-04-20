boolean[][] threshold(float[][] grid, float value){
  boolean[][] ret = new boolean[grid.length][grid[0].length];
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      ret[i][j] = grid[i][j] > value;
    }
  }
  return ret;
}