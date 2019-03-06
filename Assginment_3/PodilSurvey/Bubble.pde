class Bubble {
  float x, y;
  float diameter;
  String name;
  String gender;
  String age;
  String live;
  String work;
  
  //boolean over = false;
  
  Bubble(float tempX, float tempY, float tempD, String tempS, String tempG, String tempA, String tempL, String tempW) {
    x = tempX;
    y = tempY;
    diameter = tempD;
    name = tempS;
    gender = tempG;
    age = tempA;
    live = tempL;
    work = tempW;
  }
  
  void maledisplay() {
      noStroke();
      fill(240,94,28,200);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
  
  void femaledisplay() {
      noStroke();
      fill(221,210,59,225);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
  
  void workdisplay() {
      noStroke();
      fill(217,205,144,225);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
  
  void notworkdisplay() {
      noStroke();
      fill(38,135,133,225);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
  
  void livedisplay() {
      noStroke();
      fill(247,92,47,225);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
  
  void notlivedisplay() {
      noStroke();
      fill(136,76,58,225);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
  
  void displayA() {
      noStroke();
      fill(250,214,137,250);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
  
  void displayB() {
      noStroke();
      fill(250,214,137,200);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
  
  void displayC() {
      noStroke();
      fill(250,214,137,150);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
  
  void displayD() {
      noStroke();
      fill(250,214,137,100);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
  
  void displayE() {
      noStroke();
      fill(250,214,137,50);
      if (dist(mouseX,mouseY,x,y)<diameter/2) {
        fill(255);
        textAlign(CENTER);
        text(name, x, y-30);
        textSize(20);
      };
      ellipse(x, y, diameter, diameter);
  };
}
