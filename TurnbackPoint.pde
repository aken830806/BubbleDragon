class TurnbackPoint{//折返點
  float x;
  float y;
  float radius = BUBBLE_RADIUS;
  TurnbackPoint(float x,float y){
    this.x = x;
    this.y = y;
  }
  void display(){
    ellipse(x, y, radius*2, radius*2);
  }
}
