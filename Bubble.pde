class Bubble{//泡泡
  float x;
  float y;
  float radius = BUBBLE_RADIUS;
  Bubble(float x,float y){
    this.x = x;
    this.y = y;
  }
  void display(){
    ellipse(x,y,radius*2,radius*2);
  }
  boolean isHit(){
    if(bullet != null){
      if(sqrt(sq(bullet.bubble.x-this.x)+sq(bullet.bubble.y-this.y)) 
      < bullet.bubble.radius + this.radius){
        return true;
      }
    }
    return false;
  }
}
