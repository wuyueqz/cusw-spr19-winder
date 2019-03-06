MercatorMap map;
PImage background;
int value = 0;
int v_bridge = 0;
int v_road = 0;
int v_water = 0;

void setup(){
  size(1346, 820);
  
  map = new MercatorMap(width, height, 50.4751, 50.4639, 30.5073, 30.5362, 0);
  bridges = new ArrayList<Bridge>();
  roads = new ArrayList<Road>();
  waters = new ArrayList<Water>();
  buildings = new ArrayList<Building>();
  trees = new ArrayList<Tree>();

  loadData();
  parseData();
}

void draw(){
  image(background, 0, 0);
  fill(0, 127);
  rect(0, 0, width, height);
  
  for(int i = 0; i<roads.size(); i++){
    if (v_road == 255){
    roads.get(i).draw();
    }
  }
  
  for(int i = 0; i<buildings.size(); i++){
    buildings.get(i).draw();
  }
  
  for(int i = 0; i<waters.size(); i++){
    if (v_water == 255){
    waters.get(i).draw();            
    String t2 = "A 2,285km river that flows from Russia" + "\nThrough Belarus and Ukraine" + "\nTo the Black Sea";
    fill(255);
    text(t2, 900, 500, 400, 200);
    }
  }
  
  for(int i = 0; i<bridges.size(); i++){
    if (v_bridge == 255){
    bridges.get(i).draw();
    }
  }
  
  for(int i = 0; i<trees.size(); i++){
    trees.get(i).draw();
  }
  
  drawInfo();
       
  String t1 = "This is a map for Podil, Kyiv, Ukraine" + "\nPress W to control layer Water;" + "\nPress B to control layer Bridge;" + "\nPress R to control layer Road";
  fill(217, 205, 144);
  text(t1, mouseX + 50, mouseY + 50, 400, 400);
  
}

void keyPressed() {
  
  if (key == 'r' || key == 'R'){
    if (v_road == 0) {
      v_road = 255;
    } else {
      v_road = 0;
    }
  }
  
  if (key == 'b' || key == 'B'){
    if (v_bridge == 0) {
      v_bridge = 255;
    } else {
      v_bridge = 0;
    }
  }
  
  if (key == 'w' || key == 'W'){
    if (v_water == 0) {
      v_water = 255;
    } else {
      v_water = 0;
    }
  }
}
