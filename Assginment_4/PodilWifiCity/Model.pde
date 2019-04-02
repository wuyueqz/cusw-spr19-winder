ObstacleCourse course;
Graph network;
Pathfinder finder;

ArrayList<Path> paths;
ArrayList<Agent> people;

void roadsNetwork(ArrayList<Road> r) {
 
  int nodeResolution = 10;
  int graphWidth = width;
  int graphHeight = height;
  network = new Graph(graphWidth, graphHeight, nodeResolution, r);

}

void treePaths(int numPaths) {
  finder = new Pathfinder(network);
  paths = new ArrayList<Path>();
  for (int i=0; i<numPaths; i++) {
    
    boolean notFound = true;
    while(notFound) {
      
      int orig_index = int(random(trees.size()));
      PVector orig = trees.get(orig_index).coord;
      orig = map.getScreenLocation(orig);
    
      int dest_index = int(random(trees.size()));
      PVector dest = trees.get(dest_index).coord;
      dest = map.getScreenLocation(dest);
      
      Path p = new Path(orig, dest);
      p.solve(finder);
      
      if(p.waypoints.size() > 1) {
        notFound = false;
        paths.add(p);
      }
    
    }
     
  }

}

void initPopulation(int count) {

  people = new ArrayList<Agent>();
  for (int i=0; i<count; i++) {
    int random_index = int(random(paths.size()));
    Path random_path = paths.get(random_index);
    if (random_path.waypoints.size() > 1) {
      int random_waypoint = int(random(random_path.waypoints.size()));
      float random_speed = random(0.1, 0.3);
      PVector loc = random_path.waypoints.get(random_waypoint);
      Agent person = new Agent(loc.x, loc.y, 5, random_speed, random_path.waypoints);
      people.add(person);
    }
  }
}

ArrayList<PVector> personLocations(ArrayList<Agent> people) {
  ArrayList<PVector> l = new ArrayList<PVector>();
  for (Agent a: people) {
    l.add(a.location);
  }
  return l;
}
