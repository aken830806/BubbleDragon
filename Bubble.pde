class Bubble{//泡泡
  float x;
  float y;
  float radius = BUBBLE_RADIUS;
  String title;
  Bubble(float x,float y){
    this.x = x;
    this.y = y;
  }
  Bubble(float x,float y,String title){
    this(x,y);
    this.title = title;
  }
  void display(){
    fill(255);
    ellipse(x,y,radius*2,radius*2);
    if(title!=null){
      fill(0);
      textFont(chFont,18);
      text(title,x-10,y);
    }
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
