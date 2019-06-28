ArrayList<Bubble> bubbleList;
AimLine aimLine;
Bullet bullet;
ArrayList<Text> questionList;
ArrayList<Text> answerList;
Boolean shooting = false;

final float BUBBLE_RADIUS = 20;
float SHOOTING_AREA_X;
float SHOOTING_AREA_W;//width
PFont chFont;

void setup(){
  size(800,600);
  chFont = createFont("微軟正黑體",18);
  SHOOTING_AREA_X = width/4;
  SHOOTING_AREA_W = width/2;//width
  init();
}
void draw(){
  background(235, 240, 242);
  fill(255);
  rect(SHOOTING_AREA_X,0,SHOOTING_AREA_W,height);
  
  pushMatrix();
  translate(width/2, height);//座標轉換
  for(Bubble b:bubbleList){
    b.display();
  }
  bullet.display();
  if(shooting){
    int removeIndex = -1;
    for(Bubble b:bubbleList){
      if(b.isHit()){
        removeIndex = bubbleList.indexOf(b);
        bullet = new Bullet();
        shooting = false;
      }
    }
    if(removeIndex != -1){
      bubbleList.remove(removeIndex);
    }
  }else{//發射時隱藏瞄準線
    aimLine.display();
  }
  popMatrix();
  for(Text t:questionList){
    t.display();
  }
  for(Text t:answerList){
    t.display();
  }
}
void init(){//初始化
  bubbleList = new ArrayList<Bubble>();
  bubbleList.add(new Bubble(-SHOOTING_AREA_W/2+BUBBLE_RADIUS,-height+BUBBLE_RADIUS));
  bubbleList.add(new Bubble(-SHOOTING_AREA_W/2+BUBBLE_RADIUS*3,-height+BUBBLE_RADIUS));
  bubbleList.add(new Bubble(-SHOOTING_AREA_W/2+BUBBLE_RADIUS*5,-height+BUBBLE_RADIUS));
  aimLine = new AimLine();
  questionList = new ArrayList<Text>();
  questionList.add(new Text(25,10,"問題1"));
  questionList.add(new Text(25,60,"問題2"));
  answerList = new ArrayList<Text>();
  answerList.add(new Text(SHOOTING_AREA_X + SHOOTING_AREA_W + 25,10,"答案1"));
  answerList.add(new Text(SHOOTING_AREA_X + SHOOTING_AREA_W + 25,60,"答案2"));
  bullet = new Bullet();
}
void mousePressed(){
  if(!shooting){
    bullet.setPointList();
    shooting = true;
  }
}
