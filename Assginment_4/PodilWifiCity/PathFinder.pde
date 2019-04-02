class Path {
  PVector origin;
  PVector destination;
  ArrayList<PVector> waypoints;
  boolean enableFinder = true;
  float diameter = 10;
  
  Path(float x, float y, float l, float w) {
    origin = new PVector( random(x, x+l), random(y, y+w) );
    destination = new PVector( random(x, x+l), random(y, y+w) );
    waypoints = new ArrayList<PVector>();
    straightPath();
  }
  
  Path(PVector o, PVector d) {
    origin = o;
    destination = d;
    waypoints = new ArrayList<PVector>();
    straightPath();
  }
  
  void solve(Pathfinder finder) {
    waypoints = finder.findPath(origin, destination, enableFinder);
    diameter = finder.network.SCALE;
  }
  
  void straightPath() {
    waypoints.clear();
    waypoints.add(origin);
    waypoints.add(destination);
  }
  
  void display(int col, int alpha) {
    
    noFill();
    strokeWeight(2);
    stroke(#00FF00, alpha);
    PVector n1, n2;
    for (int i=1; i<waypoints.size(); i++) {
      n1 = waypoints.get(i-1);
      n2 = waypoints.get(i);
      line(n1.x, n1.y, n2.x, n2.y);
    }

    fill(#FF0000);
    ellipse(origin.x, origin.y, diameter, diameter);
    fill(#0000FF);
    ellipse(destination.x, destination.y, diameter, diameter);
    
    strokeWeight(1);
  }
}

class Pathfinder { 
  Graph network;
  
  int networkSize;
  
  PVector a, b;
  ArrayList<PVector> pathNodes, visitedNodes;
  float[] totalDist;
  int[] parentNode;
  boolean[] visited;
  ArrayList<Integer> allVisited;
  
  Pathfinder(Graph network) {
    this.network = network;
    networkSize = network.nodes.size();
    totalDist = new float[networkSize];
    parentNode = new int[networkSize];
    visited = new boolean[networkSize];
    allVisited = new ArrayList<Integer>();
    pathNodes = new ArrayList<PVector>();
    visitedNodes = new ArrayList<PVector>();
    a = new PVector(0, 0);
    b = new PVector(0, 0);
  }
  
  ArrayList<PVector> findPath(PVector A, PVector B, boolean enable) {
    
    pathNodes = new ArrayList<PVector>();
    a = A;
    b = B;
    allVisited.clear();
    
    if (!enable) {
      
      pathNodes.add(a);
      pathNodes.add(b);
      
    } else {
      
      ArrayList<Integer> toVisit = new ArrayList<Integer>();
      
      int a_index = getClosestNode(a);
      int b_index = getClosestNode(b);
      
      for (int i=0; i<networkSize; i++) {
        totalDist[i] = Float.MAX_VALUE;
        visited[i] = false;
      }
      totalDist[a_index] = 0;
      parentNode[a_index] = a_index;
      int current = a_index;
      toVisit.add(current);
      allVisited.add(current);
      
      boolean complete = false;
      while(!complete) {
        
        for(int i=0; i<network.getNeighborCount(current); i++) { 
          
          float currentDist = totalDist[current] + getNeighborDistance(current, i);
          if (totalDist[getNeighbor(current, i)] > currentDist) {
            totalDist[getNeighbor(current, i)] = currentDist;
            parentNode[getNeighbor(current, i)] = current;
          }

          if (!visited[getNeighbor(current, i)]) {
            toVisit.add(getNeighbor(current, i));
            allVisited.add(getNeighbor(current, i));
            visited[getNeighbor(current, i)] = true;
          }
        }
        
        visited[current] = true;
        toVisit.remove(0);
        
        if (toVisit.size() > 0) {
          
          current = toVisit.get(0);
          
          if (current == b_index) {
            
            pathNodes.add(0, b);
            pathNodes.add(0, getNode(b_index) );
            current = b_index;
            while (!complete) {
              pathNodes.add(0, getNode(parentNode[current]) );
              current = parentNode[current];
              
              if (current == a_index) {
                complete = true;
                pathNodes.add(0, a);
              }
            }
          }
        
        } else {
          
          complete = true;
          
          pathNodes.add(0, a);
        }
      }
    }
    
    return pathNodes;
  }
  
  ArrayList<PVector> getVisited() {
    
    visitedNodes = new ArrayList<PVector>();
    
    for (int i=0; i<allVisited.size(); i++) {
      visitedNodes.add(getNode(allVisited.get(i)));
    }
    
    return visitedNodes;
  }
    
  float getResolution() {
    return network.SCALE;
  }
  
  int getNeighbor(int current, int i) {
    return network.getNeighbor(current, i);
  }
  
  float getNeighborDistance(int current, int i) {
    return network.getNeighborDistance(current, i);
  }
  
  int getClosestNode(PVector v) {
    int node = -1;
    float distance = Float.MAX_VALUE;
    float currentDist;
    
    for (int i=0; i<networkSize; i++) {
      currentDist = sqrt( sq(v.x-getNode(i).x) + sq(v.y-getNode(i).y) );
      if (currentDist < distance) {
        node = i;
        distance = currentDist;
      }
    }
    
    return node;
  }
  
  PVector getNode(int i) {
    if (i < networkSize) {
      return network.nodes.get(i).loc;
    } else {
      return new PVector(-1,-1);
    }
  }
  
  void display(int col, int alpha, boolean showVisited) {
    noFill();
    
    strokeWeight(1);
    stroke(col, alpha);
    if (showVisited) {
      PVector n;
      getVisited();
      for (int i=0; i<visitedNodes.size(); i++) {
        n = visitedNodes.get(i);
        ellipse(n.x, n.y, network.SCALE, network.SCALE);
      }
    }
    
    strokeWeight(2);
    stroke(#00FF00, alpha);
    PVector n1, n2;
    for (int i=1; i<pathNodes.size(); i++) {
      n1 = pathNodes.get(i-1);
      n2 = pathNodes.get(i);
      line(n1.x, n1.y, n2.x, n2.y);
    }
    
    stroke(#FF0000, alpha);
    ellipse(a.x, a.y, network.SCALE, network.SCALE);
    stroke(#0000FF, alpha);
    ellipse(b.x, b.y, network.SCALE, network.SCALE);
    
    strokeWeight(1);
  }
}
