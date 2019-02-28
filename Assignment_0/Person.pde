// This person class will represent people in our class

class Person {

  String name;
  String year;
  PVector screenLocation;
  boolean locked; // Am I editing my person location
  
  Person(String _name, String _year){
    name = _name;
    year = _year;
    screenLocation = new PVector(width/2, height/2);
  }
  
  void randomlocation(){
    screenLocation = new PVector(random(width), random(height));
  }
  
  boolean hoverEvent(){
    
    float xDistance = abs(mouseX - screenLocation.x);
    float yDistance = abs(mouseY - screenLocation.y);
    
    if (xDistance <= 15 && yDistance <= 15) {
    return true;
    } else {
    return false;
    }
  }
  
  boolean checkSelection(){
    if (hoverEvent()){
      locked = true;
    } else {
      locked = false;
    }    
    return locked;
  }
  
  void update(){
    if (locked){
      screenLocation = new PVector (mouseX, mouseY);
    }
  }
  
  void drawPerson(){
    noStroke(); //No circle outline
    fill(255);
    if (hoverEvent()){
      fill(#FF0000);
    }; 
    ellipse(screenLocation.x, screenLocation.y, 30, 30);
    text(name + "\n" + "Year: " + year, screenLocation.x + 30, screenLocation.y + 30);
  }
  
}
