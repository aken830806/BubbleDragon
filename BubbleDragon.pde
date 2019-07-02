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
  for(Answer a:answerList){
    a.bubble.display();
  }
  if(shooting){
    int removeIndex = -1;
    for(Answer a:answerList){
      if(a.bubble.isHit()){
        if(a.bubble.title.equals(questionList.get(questionIndex).ans)){ 
          removeIndex = answerList.indexOf(a); //<>//
          questionList.remove(questionList.get(questionIndex));//擊中移除問題
          for(Question q:questionList){
            q.y += 50;
          }
          if(questionList.size() > 0){//尚有問題
            bullet = new Bullet();
          }
          shooting = false;
        }
      }
    }
    if(removeIndex != -1){//擊中移除答案
      answerList.remove(removeIndex);
    }
  }else if(questionList.size() > 0){//發射時隱藏瞄準線
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
  newQuestionX = 25;
  newQuestionY = height-50;
  newBubbleX = -SHOOTING_AREA_W/2+BUBBLE_RADIUS;
  newBubbleY = -height+BUBBLE_RADIUS;
  newAnswerX = SHOOTING_AREA_X + SHOOTING_AREA_W + 25;
  newAnswerY = 10;
  aimLine = new AimLine();
  questionList = new ArrayList<Question>();
  answerList = new ArrayList<Answer>();
  questionList.add(new Question("問題1","Q1","A1"));
  questionList.add(new Question("問題2","Q2","A2"));
  answerList.add(new Answer("答案1","A1"));
  answerList.add(new Answer("答案2","A2"));
  bullet = new Bullet();
}
void mousePressed(){
  if(!shooting){
    bullet.setPointList();
    shooting = true;
  }
}
