void style(String theControllerName) {
  Controller c = cp5.getController(theControllerName);
  // adjust the height of the controller
  c.setHeight(15);
  
  // add some padding to the caption label background
  c.getCaptionLabel().getStyle().setPadding(4,4,3,4);
  
  // shift the caption label up by 4px
  c.getCaptionLabel().getStyle().setMargin(-4,0,0,0); 
  
  // set the background color of the caption label
  c.getCaptionLabel().setColorBackground(color(10,20,30,140));
}
