ArrayList<Building> buildings;
class Building{
  PShape p;
  ArrayList<PVector>coordinates;

  Building(){
    coordinates = new ArrayList<PVector>();
  }
  
  Building(ArrayList<PVector> coords){
    coordinates = coords;
    makeShape();
  }
  
  void makeShape(){
    p = createShape();
    p.beginShape();
    p.fill(building_fill);
    p.strokeWeight(.5);
    p.stroke(0);
    for(int i = 0; i<coordinates.size(); i++){
        PVector screenLocation = map.getScreenLocation(coordinates.get(i));
        p.vertex(screenLocation.x, screenLocation.y);
    }
    p.endShape();
  }

  void draw(){
    shape(p, 0, 0);
  }
}
