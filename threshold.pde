ArrayList<ArrayList<Boolean>> threshold(ArrayList<ArrayList<Float>> grid, float value){
  ArrayList<ArrayList<Boolean>> ret = new ArrayList<ArrayList<Boolean>>();
  for(int i=0; i < grid.size(); i++){
    ArrayList<Boolean> aa = new ArrayList<Boolean>();
    for(int j=0; j < grid.get(i).size(); j++){
      boolean result = grid.get(i).get(j) > value;
      aa.add(result);
    }
    ret.add(aa);
  }
  return ret;
}
