class Bubble {
  float lon,lat;
  float diameter;
  float l,w,p;
  String name;
  
  boolean over = false;
  
  Bubble(float lon_, float lat_, float l_, float w_, float p_, float diameter_, String s_) {
    lon = lon_;
    lat = lat_;
    l = l_;
    w = w_;
    p = p_;
    diameter = diameter_;
    name = s_;
  }
  
  
  // CHecking if mouse is over the Bubble
  void rollover(float plon, float plat) {
    float d = dist(plon,plat,lon,lat);
    if (d < diameter/2) {
      over = true; 
    } else {
      over = false;
    }
  }
  
  // Display the Bubble
  void display() {
    stroke(255);
    strokeWeight(2);
    fill(l*20,w*20,p*20,255);
    ellipse(lon,lat,diameter,diameter);
    if (over) {
      fill(0);
      textAlign(CENTER);
      text(name,lat,lon+diameter/2+20);
    }
  }
}
