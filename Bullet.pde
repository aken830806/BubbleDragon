class Bullet{
  Bubble bubble;
  ArrayList<TurnbackPoint> pointList;
  int lineIndex,pointIndex;
  float pointNum;
  
  Bullet(){
    bubble = new Bubble(0,0);
    pointList = new ArrayList<TurnbackPoint>();
    pointList.addAll(aimLine.pointList);
    lineIndex = 0;
    pointIndex = 0;
  }
  void display(){
    ellipse(bubble.x,bubble.y,bubble.radius*2,bubble.radius*2); 
    float x1,y1,x2,y2;
    if(pointIndex == 0){
      x1 = 0;
      y1 = 0;
    }else{
      x1 = pointList.get(pointIndex-1).x;
      y1 = pointList.get(pointIndex-1).y;
    }
    x2 = pointList.get(pointIndex).x;
    y2 = pointList.get(pointIndex).y;
    pointNum = sqrt(sq(x1-x2)+sq(y1-y2))/6;//用距離決定點的數量
    bubble.x = lerp(x1, x2, (float)lineIndex/pointNum);
    bubble.y = lerp(y1, y2, (float)lineIndex/pointNum);
    lineIndex += 1; 
    if(lineIndex > pointNum){ 
      lineIndex = 0;
      pointIndex += 1;
    }
    if(pointIndex >= pointList.size()){
      shooting = false;
    }
  }
}
