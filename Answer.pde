class Answer{
  float x;
  float y;
  String content;
  String bubleTitle;
  
  Answer(float x,float y,String content,String bubleTitle){
    this.x = x;
    this.y = y;
    this.content = content;
    this.bubleTitle = bubleTitle;
  }
  void display(){
    fill(255);
    rect(x,y,150,40);
    fill(0);
    textFont(chFont,18);
    text(content,x+10,y+20);
  }
}
