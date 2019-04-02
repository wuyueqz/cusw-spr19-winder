ArrayList<Road> roads; 

class Road{
  ArrayList<PVector>coordinates;
  color stroke;
  
  Road(){}
  
  Road(ArrayList<PVector> coords){
    coordinates =  coords;
    stroke = color(0, 0, 255, 100);
  }
  
  void draw(){

    for(int i = 0; i<coordinates.size()-1; i++){
        PVector screenStart = map.getScreenLocation(coordinates.get(i));
        PVector screenEnd = map.getScreenLocation(coordinates.get(i+1));
        strokeWeight(1);
        stroke(stroke);
        line(screenStart.x, screenStart.y, screenEnd.x, screenEnd.y);
                        
        float t1 = (frameCount/150.0)%1;

        float x1 = screenStart.x + (screenEnd.x - screenStart.x)*t1;
        float y1 = screenStart.y + (screenEnd.y - screenStart.y)*t1;
 
        if (value == 0){
          float xtemp = mouseX;
          float ytemp = mouseY;
          if(xtemp - 100 < x1 && x1 < xtemp + 100 && ytemp - 100 < y1 && y1 < ytemp + 100)
            {
            fill(165,222,random(100,250), 250);
            noStroke();
            ellipse(x1, y1, 3, 3);
            };
          };
        }
        
  }
}
