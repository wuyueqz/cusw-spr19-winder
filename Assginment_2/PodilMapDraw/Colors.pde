color tree_fill = color(162,140,55,200);
color building_fill = color(112,124,116,100);
color road_color = color(247,194,66,50);
color bridge_color = color(233,205,76,50);
color water_color = color(110, 117, 164, 225);
  
void drawInfo(){
  fill(0);
  rect(20, 20, 125, 110);
  textSize(16);
  
  fill(building_fill);
  text("Building", 25, 40);
  
  fill(tree_fill);
  text("Tree", 25, 60);
  
  fill(water_color);
  text("Water", 25, 80);
  
  fill(bridge_color);
  text("Bridge", 25, 100);
  
  fill(road_color);
  text("Road", 25, 120);
  
}
