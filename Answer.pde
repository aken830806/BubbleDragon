float newBubbleX;
float newBubbleY;
float newAnswerX;
float newAnswerY;
class Answer{
  float x;
  float y;
  String content;
  Bubble bubble;
  
  Answer(String content,String bubbleTitle){
    this.x = newAnswerX;
    this.y = newAnswerY;
    this.content = content;
    this.bubble = new Bubble(newBubbleX,newBubbleY,bubbleTitle);
    newBubbleX += BUBBLE_RADIUS*2;
    newAnswerY += 50;
  }
  void display(){
    fill(255);
    rect(x,y,150,40);
    fill(0);
    textFont(chFont,18);
    text(content,x+10,y+20);
    bubble.display();
  }
}
