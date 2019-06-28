ArrayList<Bubble> bubbleList;
AimLine aimLine;
Bullet bullet;
Boolean shooting = false;
final float BUBBLE_RADIUS = 20;

void setup(){
  size(800,600);
  init();
}
void draw(){
  background(235, 240, 242);
  rect(width/4,0,width/2,height);
  
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
  bubbleList.add(new Bubble(-width/4+BUBBLE_RADIUS,-height+BUBBLE_RADIUS));
  bubbleList.add(new Bubble(-width/4+BUBBLE_RADIUS*3,-height+BUBBLE_RADIUS));
  bubbleList.add(new Bubble(-width/4+BUBBLE_RADIUS*5,-height+BUBBLE_RADIUS));
  aimLine = new AimLine();
}
void mousePressed(){
  if(!shooting){
    shooting = true;
    bullet = new Bullet();
  }
}
