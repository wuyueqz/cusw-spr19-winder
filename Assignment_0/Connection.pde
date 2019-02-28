// A class that represents and draws connection between two people directed connection

class Connection {
  
  Person origin;
  Person destination;
  String type;
  
  Connection(Person p1, Person p2, String _type) {
    origin = p1;
    destination = p2;
    type = _type;
  }

  void draw() {
    float x1 = origin.screenLocation.x;
    float y1 = origin.screenLocation.y;
    float x2 = destination.screenLocation.x;
    float y2 = destination.screenLocation.y;
    
    strokeWeight(5);
    stroke(255, 100);
    line(x1, y1, x2, y2);
    
    fill(255);
    text(type, (x1+x2)/2, (y1+y2)/2);
  }
  
}

// Short Color Lesson;
// fill();
// Stoke();

void drawConnection(){
    stroke(255); //No circle outline
    //fill(255);
    //if (hoverEvent()){
    //  fill(#FF0000);
    //}; 
    //ellipse(screenLocation.x, screenLocation.y, 30, 30);
    //text(name + "\n" + "Year: " + year, screenLocation.x + 30, screenLocation.y + 30);
}
