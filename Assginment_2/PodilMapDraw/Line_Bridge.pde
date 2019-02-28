ArrayList<Bridge> bridges; 

class Bridge{
  ArrayList<PVector>coordinates;
  
  Bridge(){}
  
  Bridge(ArrayList<PVector> coords){
    coordinates =  coords;
  }
  
  void draw(){

    for(int i = 0; i<coordinates.size()-1; i++){
        PVector screenStart = map.getScreenLocation(coordinates.get(i));
        PVector screenEnd = map.getScreenLocation(coordinates.get(i+1));
        strokeWeight(2);
        stroke(bridge_color);
        line(screenStart.x, screenStart.y, screenEnd.x, screenEnd.y);
        
        float t1 = (frameCount/10.0)%1;

        float x1 = screenStart.x + (screenEnd.x - screenStart.x)*t1;
        float y1 = screenStart.y + (screenEnd.y - screenStart.y)*t1;
        
        float r = 10*random(150,250)/250;
 
        fill(165,222,random(100,250), 150);
        noStroke();
        ellipse(x1, y1, r*1.5, r*1.5);

        }
  }
}
