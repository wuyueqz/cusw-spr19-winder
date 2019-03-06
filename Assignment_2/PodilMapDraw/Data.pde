JSONObject allBridge;
JSONObject allRoad;
JSONObject allWater;
JSONObject allBuilding;
JSONObject allTree;

JSONArray bridgeFeatures;
JSONArray roadFeatures;
JSONArray waterFeatures;
JSONArray buildingFeatures;
JSONArray treeFeatures;

void loadData(){
  background = loadImage("data/Podil_background_Black.png");
  background.resize(width, height);
  
  allBridge = loadJSONObject("data/bridges.geojson");
  bridgeFeatures = allBridge.getJSONArray("features");
  
  allRoad = loadJSONObject("data/roads.geojson");
  roadFeatures = allRoad.getJSONArray("features");
  
  allWater = loadJSONObject("data/water_lines.geojson");
  waterFeatures = allWater.getJSONArray("features");
  
  allBuilding = loadJSONObject("data/buildings.geojson");
  buildingFeatures = allBuilding.getJSONArray("features");
  
  allTree = loadJSONObject("data/trees.geojson");
  treeFeatures = allTree.getJSONArray("features");

  println("There are : ", bridgeFeatures.size(), " bridge features;",
          "\nThere are : ", roadFeatures.size(), " road features;",
          "\nThere are : ", waterFeatures.size(), " water features;",
          "\nThere are : ", buildingFeatures.size(), " building features;",
          "\nThere are : ", treeFeatures.size(), " tree features;"); 
}

void parseData(){

  for(int i = 0; i< bridgeFeatures.size(); i++){
    JSONObject bridgeGeometry = bridgeFeatures.getJSONObject(i).getJSONObject("geometry"); 
    ArrayList<PVector> coords = new ArrayList<PVector>();
    JSONArray coordinates = bridgeGeometry.getJSONArray("coordinates");
    for(int j = 0; j<coordinates.size(); j++){
      float lat = coordinates.getJSONArray(j).getFloat(1);
      float lon = coordinates.getJSONArray(j).getFloat(0);
      PVector coordinate = new PVector(lat, lon);
      coords.add(coordinate);
    }
    Bridge bridge = new Bridge(coords);
    bridges.add(bridge);    
  }
  
  for(int i = 0; i< roadFeatures.size(); i++){
    JSONObject roadGeometry = roadFeatures.getJSONObject(i).getJSONObject("geometry"); 
    ArrayList<PVector> coords = new ArrayList<PVector>();
    JSONArray coordinates = roadGeometry.getJSONArray("coordinates");
    for(int j = 0; j<coordinates.size(); j++){
      float lat = coordinates.getJSONArray(j).getFloat(1);
      float lon = coordinates.getJSONArray(j).getFloat(0);
      PVector coordinate = new PVector(lat, lon);
      coords.add(coordinate);
    }
    Road road = new Road(coords);
    roads.add(road);    
  }
  
  for(int i = 0; i< waterFeatures.size(); i++){
    JSONObject waterGeometry = waterFeatures.getJSONObject(i).getJSONObject("geometry"); 
    ArrayList<PVector> coords = new ArrayList<PVector>();
    JSONArray coordinates = waterGeometry.getJSONArray("coordinates");
    for(int j = 0; j<coordinates.size(); j++){
      float lat = coordinates.getJSONArray(j).getFloat(1);
      float lon = coordinates.getJSONArray(j).getFloat(0);
      PVector coordinate = new PVector(lat, lon);
      coords.add(coordinate);
    }
    Water water = new Water(coords);
    waters.add(water);    
  }
  
  for(int i = 0; i< buildingFeatures.size(); i++){
    JSONObject buildingGeometry = buildingFeatures.getJSONObject(i).getJSONObject("geometry");
    ArrayList<PVector> coords = new ArrayList<PVector>();
    JSONArray coordinates = buildingGeometry.getJSONArray("coordinates").getJSONArray(0);
    for(int j = 0; j<coordinates.size(); j++){
      float lat = coordinates.getJSONArray(j).getFloat(1);
      float lon = coordinates.getJSONArray(j).getFloat(0);
      PVector coordinate = new PVector(lat, lon);
      coords.add(coordinate);
    }
    Building building = new Building(coords);
    buildings.add(building);
  }
  
  for(int i = 0; i< treeFeatures.size(); i++){
    JSONObject geometry = treeFeatures.getJSONObject(i).getJSONObject("geometry");
    float lat = geometry.getJSONArray("coordinates").getFloat(1);
    float lon = geometry.getJSONArray("coordinates").getFloat(0);
    Tree tree = new Tree(lat, lon);
    trees.add(tree);
  }
  
}
