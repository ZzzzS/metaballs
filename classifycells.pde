ArrayList<ArrayList<Integer>> classifyCells(ArrayList<ArrayList<Boolean>> corners){
  ArrayList<ArrayList<Integer>> ret = new ArrayList<ArrayList<Integer>>();
  for(int i=0; i < corners.size() - 1; i++){
    ArrayList<Integer> aa = new ArrayList<Integer>();
    for(int j=0; j < corners.get(i).size() - 1; j++){
      boolean NW = corners.get(i).get(j);
      boolean NE = corners.get(i).get(j+1);
      boolean SW = corners.get(i+1).get(j);
      boolean SE = corners.get(i+1).get(j+1);
      
      aa.add(((SW ? 1 : 0) << 0) + ((SE ? 1 : 0) << 1) + ((NE ? 1 : 0) << 2) + ((NW ? 1 : 0) << 3));
    }
    ret.add(aa);
  }
  return ret;
}
