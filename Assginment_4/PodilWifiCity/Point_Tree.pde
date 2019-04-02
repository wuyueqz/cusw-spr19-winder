ArrayList<Tree> trees;

class Tree {
  PVector coord;

  float lat;
  float lon;
  color fill;

  Tree(float _lat, float _lon) {
    lat = _lat;
    lon = _lon;
    coord = new PVector(lat, lon);
    fill = color(240, 230, 140, 50);
  }

  void draw() {
    PVector screenLocation = map.getScreenLocation(coord);
    fill(fill);
    noStroke();
    ellipse(screenLocation.x, screenLocation.y, 15, 15);
  }
}
