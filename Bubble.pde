class Bubble{//泡泡
  float x;
  float y;
  float radius = 40;
  Bubble(float x,float y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    ellipse(x,y,radius,radius);
  }
}
