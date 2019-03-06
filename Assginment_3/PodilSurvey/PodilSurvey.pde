PImage background;
Bubble[] bubbles;
int value = 255;
int v_gender = 0;
int v_age = 0;
int v_work = 0;
int v_live = 0;

void setup() {
  size(820, 820);
  loadData();
}

void draw() {
  
  image(background, 0, 0);
  noStroke();
  fill(15, 37, 64, 215);
  rect(0, 0, width, height);
  
  if(value == 255){
    startInfo();    
  }else{
    image(background, 0, 0);
    noStroke();
    fill(15, 37, 64, 215);
    rect(0, 0, width, height);
    
    fill(255);
    textSize(14);
    textAlign(LEFT);
    text("\nMouse -> name;" +
         "\nRadius -> time" +
         "\n'G' -> gender" +
         "\n'A' -> age" +
         "\n'L' -> living"  +
         "\n'W' -> working", 20, 10);
  }
  
  if(v_gender == 255){
    for (int i = 0; i<bubbles.length; i++) {
        if(bubbles[i].gender.equals("Male")){
        bubbles[i].maledisplay();
        };
        if(bubbles[i].gender.equals("Female")){
        bubbles[i].femaledisplay();
        };
      };
     genderDrawInfo();
  };
  
  if(v_work == 255){
    for (int i = 0; i<bubbles.length; i++) {
        if(bubbles[i].work.equals("Yes")){
        bubbles[i].workdisplay();
        };
        if(bubbles[i].work.equals("No")){
        bubbles[i].notworkdisplay();
        };
      };
     workDrawInfo();
  };
  
  if(v_live == 255){
    for (int i = 0; i<bubbles.length; i++) {
        if(bubbles[i].live.equals("Yes")){
        bubbles[i].livedisplay();
        };
        if(bubbles[i].live.equals("No")){
        bubbles[i].notlivedisplay();
        };
      };
     liveDrawInfo();
  };
  
  if(v_age == 255){
    for (int i = 0; i<bubbles.length; i++) {
        if(bubbles[i].age.equals("18-24")){
        bubbles[i].displayA();
        };
        if(bubbles[i].age.equals("25-34")){
        bubbles[i].displayB();
        };
        if(bubbles[i].age.equals("35-44")){
        bubbles[i].displayC();
        };
        if(bubbles[i].age.equals("45-54")){
        bubbles[i].displayD();
        };
        if(bubbles[i].age.equals("55-64")){
        bubbles[i].displayE();
        };
      };
     ageDrawInfo();
  };
  
}
