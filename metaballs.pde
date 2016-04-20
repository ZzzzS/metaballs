import java.util.Map;

Metaball m,m1,m2,m3;
Circle[] circles = new Circle[10];

void setup(){
  size(600,600);
  
  for(int i=0; i < circles.length; i++){
    circles[i] = new Circle();
  }
  
   m = new Metaball(3,circles,1.2);
   m1 = new Metaball(3,circles);
   m2 = new Metaball(3,circles,0.8);
   m3 = new Metaball(3,circles,0.6);
  noLoop();
}
void draw(){
  m.draw();
  m1.draw();
  m2.draw();
  m3.draw();
  //println(m._cellTypes);
  //println(m._thresholdSamples);
}