MercatorMap map;
PImage background;
int value = 255;

void initModel() {
  roadsNetwork(roads);
  treePaths(1);
  initPopulation(30*paths.size());
}

void setup(){
  size(1346, 820);
  
  map = new MercatorMap(width, height, 50.4751, 50.4639, 30.5073, 30.5362, 0);
  bridges = new ArrayList<Bridge>();
  roads = new ArrayList<Road>();
  buildings = new ArrayList<Building>();
  trees = new ArrayList<Tree>();

  loadData();
  parseData();
  initModel();
}

void draw(){
  background(0);
  tint(255, 75);
  image(network.img, 0, 0);
  
  //for (Path p:paths){
  //  p.display(100,100);
  //}
   
  for(int i = 0; i<buildings.size(); i++){
    buildings.get(i).draw();
  }
    
  for(int i = 0; i<bridges.size(); i++){
    bridges.get(i).draw();
  }
  
  for(int i = 0; i<roads.size(); i++){
    roads.get(i).draw();
  }
  
  for(int i = 0; i<trees.size(); i++){
    trees.get(i).draw();
  }
  
  //boolean collisionDetection = true;
  //for (Agent p: people) {
  //  p.update(personLocations(people), collisionDetection);
  //  p.display(#FFFFFF, 255);
  //}
  
  fill(255);
  text("Podil Wifi City - Please click the mouse to locate a cafe with wifi at the street corner", 30, 30);
  
}

//void keyPressed() {
//  initModel();
//}

void mouseClicked(){
 if (value == 255){
     value = 0;
   }else{
     value = 255;
   }
}
