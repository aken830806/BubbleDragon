class AimLine {//瞄準線
  ArrayList<TurnbackPoint> pointList;

  AimLine() {
    pointList = new ArrayList<TurnbackPoint>();
  }
  void display() {
    calculate();
    float x1=0, y1=0, x2, y2;
    for (TurnbackPoint p : pointList) {
      float num = 100;
      x2 = p.x;
      y2 = p.y;

      for (int i = 0; i <= num; i++) {
        float x = lerp(x1, x2, i/num);
        float y = lerp(y1, y2, i/num);
        point(x, y);
      }
      //p.display();
      x1 = x2;//設定現在的座標為原點
      y1 = y2;
    }
  }
  private void calculate() {
    pointList.clear();
    float x,y;
    float mx = mouseX - 400;//轉換後的mouseX
    float my = mouseY - height;//轉換後的mouseY
    float pointX = 0;//線上的點
    float pointY = 0;//線上的點
    float m;//斜率
    if (mx != width/2) {
      m = my/mx;
    } else {
      m = 1;
    } 
    do{//先執行一次，如果沒有到最高點，則計算下個折返點
      y = -height;//目標預設為最上面
      x = (y - pointY)/m + pointX;
      if(x >= width/4-bubbleRadius){//如果x超過範圍，改用x=邊界，計算y
        x = width/4-bubbleRadius;
        y = m * (x - pointX) + pointY;
        m = -m;
      }else if(x <= -width/4+bubbleRadius){
        x = -width/4+bubbleRadius;
        y = m * (x - pointX) + pointY;
        m = -m;
      }
      pointList.add(new TurnbackPoint(x,y));
      pointX = x;
      pointY = y;
    }while(y > -height);
  }
}