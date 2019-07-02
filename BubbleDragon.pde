ArrayList<Bubble> bubbleList;
AimLine aimLine;
Bullet bullet;
ArrayList<Question> questionList;
ArrayList<Answer> answerList;
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
  bullet.display();
  popMatrix();
  for(Question q:questionList){
    q.display();
  }
  for(Answer a:answerList){
    a.display();
  }
  if(questionIndex >= questionList.size()){//歸零
    questionIndex = 0;
  }
}
void init(){//初始化
  bubbleList = new ArrayList<Bubble>();
  bubbleList.add(new Bubble(-SHOOTING_AREA_W/2+BUBBLE_RADIUS,-height+BUBBLE_RADIUS,"A1"));
  bubbleList.add(new Bubble(-SHOOTING_AREA_W/2+BUBBLE_RADIUS*3,-height+BUBBLE_RADIUS,"A2"));
  bubbleList.add(new Bubble(-SHOOTING_AREA_W/2+BUBBLE_RADIUS*5,-height+BUBBLE_RADIUS,"A3"));
  aimLine = new AimLine();
  questionList = new ArrayList<Question>();
  questionList.add(new Question(25,10,"問題1","Q1","A1"));
  questionList.add(new Question(25,60,"問題2","Q2","A2"));
  answerList = new ArrayList<Answer>();
  answerList.add(new Answer(SHOOTING_AREA_X + SHOOTING_AREA_W + 25,10,"答案1","A1"));
  answerList.add(new Answer(SHOOTING_AREA_X + SHOOTING_AREA_W + 25,60,"答案2","A2"));
  bullet = new Bullet();
}
void mousePressed(){
  if(!shooting){
    bullet.setPointList();
    shooting = true;
  }
}
