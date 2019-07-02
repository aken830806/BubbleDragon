float newQuestionX;
float newQuestionY;
class Question{
  float x;
  float y;
  String content;
  String bubleTitle;
  String ans;
  
  Question(String content,String bubleTitle,String ans){
    this.x = newQuestionX;
    this.y = newQuestionY;
    this.content = content;
    this.bubleTitle = bubleTitle;
    this.ans = ans;
    newQuestionY -= 50;
  }
  void display(){
    fill(255);
    rect(x,y,150,40);
    fill(0);
    textFont(chFont,18);
    text(content,x+10,y+20);
  }
}
