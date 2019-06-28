ArrayList<Bubble> bubbleList;
AimLine aimLine;
Bullet bullet;
Boolean shooting = false;
final float BUBBLE_RADIUS = 20;
float SHOOTING_AREA_X;
float SHOOTING_AREA_W;//width

void setup(){
  size(800,600);
  SHOOTING_AREA_X = width/4;
  SHOOTING_AREA_W = width/2;//width
  init();
}
void draw(){
  background(235, 240, 242);
  println(SHOOTING_AREA_X);
  rect(SHOOTING_AREA_X,0,SHOOTING_AREA_W,height);
  
  pushMatrix();
  translate(width/2, height);//座標轉換
  for(Bubble b:bubbleList){
    b.display();
  }
  if(shooting){
    bullet.display();
    for(Bubble b:bubbleList){
      if(b.isHit()){
        noLoop();
      }
    }
  }
  aimLine.display();
  popMatrix();
}
void init(){//初始化
  bubbleList = new ArrayList<Bubble>();
  bubbleList.add(new Bubble(-SHOOTING_AREA_W/2+BUBBLE_RADIUS,-height+BUBBLE_RADIUS));
  bubbleList.add(new Bubble(-SHOOTING_AREA_X+BUBBLE_RADIUS*3,-height+BUBBLE_RADIUS));
  bubbleList.add(new Bubble(-SHOOTING_AREA_X+BUBBLE_RADIUS*5,-height+BUBBLE_RADIUS));
  aimLine = new AimLine();
}
void mousePressed(){
  if(!shooting){
    shooting = true;
    bullet = new Bullet();
  }
}
