// Step 1: Create / Allocate Memory for your Person
Person ira;
ArrayList<Person> people;
ArrayList<Connection> edges;

//Run Once
void setup(){
  size(800, 600);
  initialize();
}

void keyPressed(){

}
  
void initialize(){
  
  people = new ArrayList<Person>();
  edges = new ArrayList<Connection>();
  
  for (int i=0; i<50; i++) {
    Person p = new Person("Person: " + i, str(int(random(1,5))));
    p.randomlocation();
    people.add(p);
  }
  
  //Who are friends;
  
  for (Person origin: people){
    for (Person destination: people){
      if (!origin.name.equals(destination.name)){
        if (origin.year.equals(destination.year)){
          edges.add(new Connection(origin, destination, "friends"));
        }
      }
    }
  }
  
  println(edges.size());
  // ira = new Person("Ira", "Old");
  // background(0); //Black Background
  // background(255);
}

// Run Over and Over at 60 - FPS
void draw(){
  background(0);
  
  // fill(255);
  // ellipse(mouseX, mouseY, 50, mouseY/10);
  for (Person p: people) {
    p.update();
    p.drawPerson();
  }

  for (Connection c: edges) {
    c.drawConnection();
}
}
  
void mousePressed(){
  
  //background(#FF0000, 100);
  
  for (Person p: people){
    if(p.checkSelection()){
      break;
    };
  }
}

void mouseReleased(){
  for (Person p: people) {
    p.locked = false;
  }

}
