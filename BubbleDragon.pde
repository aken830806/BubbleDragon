ArrayList<Bubble> bubbleList;
AimLine line;
Bullet bullet;
Boolean shooting = false;
int bubbleRadius = 20;

void setup(){
  size(800,600);
  init();
}
void draw(){
  background(235, 240, 242);
  rect(width/4,0,width/2,height);
  
  pushMatrix();
  translate(width/4, 0);
  for(Bubble b:bubbleList){
    b.display();
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height);//座標轉換
  if(shooting){
    bullet.display();
  }
  line.display();
  popMatrix();
}
void init(){//初始化
  bubbleList = new ArrayList<Bubble>();
  bubbleList.add(new Bubble(20,20));
  bubbleList.add(new Bubble(60,20));
  bubbleList.add(new Bubble(100,20));
  line = new AimLine();
}
void mousePressed(){
  if(!shooting){
    shooting = true;
    bullet = new Bullet();
  }
}
