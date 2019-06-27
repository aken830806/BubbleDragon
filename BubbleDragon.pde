ArrayList<Bubble> bubbleList;
AimLine line;

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
  line.display();
}
void init(){//初始化
  bubbleList = new ArrayList<Bubble>();
  bubbleList.add(new Bubble(20,20));
  bubbleList.add(new Bubble(60,20));
  bubbleList.add(new Bubble(100,20));
  line = new AimLine();
}
