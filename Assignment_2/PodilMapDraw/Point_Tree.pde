ArrayList<Tree> trees;

class Tree {
  PVector coord;

  float lat;
  float lon;

  Tree(float _lat, float _lon) {
    lat = _lat;
    lon = _lon;
    coord = new PVector(lat, lon);
  }

  void draw() {
    PVector screenLocation = map.getScreenLocation(coord);
    fill(tree_fill);
    noStroke();
    ellipse(screenLocation.x, screenLocation.y, 15, 15);
  }
}
