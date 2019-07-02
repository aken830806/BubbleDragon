class Question{
  float x;
  float y;
  String content;
  String bubleTitle;
  String ans;
  
  Question(float x,float y,String content,String bubleTitle,String ans){
    this.x = x;
    this.y = y;
    this.content = content;
    this.bubleTitle = bubleTitle;
    this.ans = ans;
  }
  void display(){
    fill(255);
    rect(x,y,150,40);
    fill(0);
    textFont(chFont,18);
    text(content,x+10,y+20);
  }
}
