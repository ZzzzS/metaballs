class Metaball{
  int _cellSize;
  float _threshold;
  float[][] _samples;
  boolean[][] _thresholdSamples;
  int[][] _cellTypes;
  Circle[] _circles;
  Metaball(int cellSize, int numCircles){
    this._cellSize = cellSize;
    this._threshold = 1.0;
    this._circles = new Circle[numCircles];
    for(int i=0; i < numCircles; i++){
      this._circles[i] = new Circle();
    }
    this.recalculate();
  }
  
  Metaball(int cellSize,Circle[] circles){
    this._cellSize = cellSize;
    this._threshold = 1.0;
    this._circles = circles;
    this.recalculate();
  }
  
  Metaball(int cellSize,Circle[] circles, float threshold){
    this._cellSize = cellSize;
    this._threshold = threshold;
    this._circles = circles;
    this.recalculate();
  }
  
  Metaball(int cellSize,float threshold,Circle[] circles){
    this._cellSize = cellSize;
    this._threshold = threshold;
    this._circles = circles;
    this.recalculate();
  }
  
  void recalculate(){
    this._samples = sample(0,width,this._cellSize,0,height,this._cellSize,this._circles);
    this._thresholdSamples = threshold(this._samples, this._threshold);
    this._cellTypes = classifyCells(this._thresholdSamples);
  }
  
  void draw(){
    //this.drawCircles();
    //this.drawThresholdedCorners();
    //this.draw45DegContours();
    this.drawSmoothContours();
  }
  
  void drawCircles(){
    for(int i=0; i < this._circles.length; i++){
      ellipse(this._circles[i].x,this._circles[i].y,this._circles[i].r * 2,this._circles[i].r * 2);
    }
  }
  
  void drawThresholdedCorners(){
    fill(color(136,136,136));
    for(int i=0;i < this._thresholdSamples.length;i++){
      for(int j=0; j < this._thresholdSamples[i].length;j++){
        boolean thresholdSamples = this._thresholdSamples[i][j];
        
        int x = j * this._cellSize;
        int y = i * this._cellSize;
        
        if(thresholdSamples){
          fill(color(0,255,0));
        }else{
          fill(color(136,136,136));
        }
        
        rect(x - 2, y - 2, 4, 4);
      }
    }
  }
  
  void draw45DegContours(){
    stroke(color(0,255,0));
    for(int i = 0; i < this._cellTypes.length; i++){
      for(int j = 0; j < this._cellTypes[i].length; j++){
        int cellType = this._cellTypes[i][j];
        char[] polyCompassCorners = cellTypeToPolyCorners[cellType];
        
        float[] a1 = {i,j+0.5};
        float[] a2 = {i+0.5,j};
        float[] a3 = {i+0.5,j+1.0};
        float[] a4 = {i+1.0,j+0.5};
        
        Map compassCoords = new HashMap();
        compassCoords.put('N',a1);
        compassCoords.put('W',a2);
        compassCoords.put('E',a3);
        compassCoords.put('S',a4);
        
        
        
        if(polyCompassCorners.length == 2){
          float[] x = (float[])compassCoords.get(polyCompassCorners[0]);
          float[] y = (float[])compassCoords.get(polyCompassCorners[1]);
          println(polyCompassCorners);
          this.drawScaledLine(x[0],x[1],y[0],y[1]);
        }else{
          if(polyCompassCorners.length == 4){
            float[] x = (float[])compassCoords.get(polyCompassCorners[0]);
            float[] y = (float[])compassCoords.get(polyCompassCorners[1]);
            this.drawScaledLine(x[0],x[1],y[0],y[1]);
            x = (float[])compassCoords.get(polyCompassCorners[2]);
            y = (float[])compassCoords.get(polyCompassCorners[3]);
            this.drawScaledLine(x[0],x[1],y[0],y[1]);
          }
        }
      }
    }
  }
  
  void drawScaledLine(float a1, float a2, float b1, float b2){
    float x0 = a2 * this._cellSize;
    float y0 = a1 * this._cellSize;
    float x1 = b2 * this._cellSize;
    float y1 = b1 * this._cellSize;
    line(x0,y0,x1,y1);
  }
  
   void drawSmoothContours(){
    stroke(color(0,255,0));
    for(int i = 0; i < this._cellTypes.length; i++){
      for(int j = 0; j < this._cellTypes[i].length; j++){
        int cellType = this._cellTypes[i][j];
        char[] polyCompassCorners = cellTypeToPolyCorners[cellType];
        
        float NW = this._samples[i][j];
        float NE = this._samples[i][j + 1];
        float SW = this._samples[i + 1][j];
        float SE = this._samples[i + 1][j + 1];
        
        float N = (cellType & 4) == (cellType & 8) ? 0.5 : lerp(NW, NE, 0, 1, this._threshold); 
        float E = (cellType & 2) == (cellType & 4) ? 0.5 : lerp(NE, SE, 0, 1, this._threshold); 
        float S = (cellType & 1) == (cellType & 2) ? 0.5 : lerp(SW, SE, 0, 1, this._threshold); 
        float W = (cellType & 1) == (cellType & 8) ? 0.5 : lerp(NW, SW, 0, 1, this._threshold); 
        
        float[] a1 = {i,j+N};
        float[] a2 = {i+W,j};
        float[] a3 = {i+E,j+1.0};
        float[] a4 = {i+1.0,j+S};
        
        Map compassCoords = new HashMap();
        compassCoords.put('N',a1);
        compassCoords.put('W',a2);
        compassCoords.put('E',a3);
        compassCoords.put('S',a4);
        
        
        
        if(polyCompassCorners.length == 2){
          float[] x = (float[])compassCoords.get(polyCompassCorners[0]);
          float[] y = (float[])compassCoords.get(polyCompassCorners[1]);
          println(polyCompassCorners);
          this.drawScaledLine(x[0],x[1],y[0],y[1]);
        }else{
          if(polyCompassCorners.length == 4){
            float[] x = (float[])compassCoords.get(polyCompassCorners[0]);
            float[] y = (float[])compassCoords.get(polyCompassCorners[1]);
            this.drawScaledLine(x[0],x[1],y[0],y[1]);
            x = (float[])compassCoords.get(polyCompassCorners[2]);
            y = (float[])compassCoords.get(polyCompassCorners[3]);
            this.drawScaledLine(x[0],x[1],y[0],y[1]);
          }
        }
      }
    }
  }
  
}

float value(int x, int y, Circle[] circles){
  float sum = 0;
  for(int i=0; i < circles.length; i++){
    Circle c = circles[i];
    float dx = x - c.x;
    float dy = y - c.y;
    
    float d2 = pow(dx,2) + pow(dy,2);
    sum += c.r2 / d2;
  }
  return sum;
}