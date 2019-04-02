ArrayList<Bridge> bridges; 
class Bridge{
  ArrayList<PVector>coordinates;
  color stroke;
  
  Bridge(){}
  
  Bridge(ArrayList<PVector> coords){
    coordinates =  coords;
    stroke = color(250, 250, 210, 50);
  }
  
  void draw(){

    for(int i = 0; i<coordinates.size()-1; i++){
        PVector screenStart = map.getScreenLocation(coordinates.get(i));
        PVector screenEnd = map.getScreenLocation(coordinates.get(i+1));
        strokeWeight(2);
        stroke(stroke);
        line(screenStart.x, screenStart.y, screenEnd.x, screenEnd.y);
        
        float t1 = (frameCount/20.0)%1;

        float x1 = screenStart.x + (screenEnd.x - screenStart.x)*t1;
        float y1 = screenStart.y + (screenEnd.y - screenStart.y)*t1;
        
        if (value == 0){
        
        float xtemp = mouseX;
        float ytemp = mouseY;
        
      
          if(xtemp - 100 < x1 && x1 < xtemp + 100 && ytemp - 100 < y1 && y1 < ytemp + 100)
          {
          fill(165,222,random(100,250), 250);
          noStroke();
          ellipse(x1, y1, 6, 6);
          };
          
        fill(0,10);
        noStroke();
        ellipse(xtemp, ytemp, 282, 282);
        }

        }
  }
}
