class Circle{
  float x,y,vx,vy,r,r2;
  Circle(){
    this.x = random(1) * width;
    this.y = random(1) * height;
    this.vx = 2 * random(1) -1;
    this.vy = 2 * random(1) -1;
    this.r = 20 + 40 * random(1);
    this.r2 = pow(this.r,2);
  }
  Circle(int x, int y, float vx, float vy, float r){
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.r = r;
    this.r2 = pow(this.r,2);
  }
}