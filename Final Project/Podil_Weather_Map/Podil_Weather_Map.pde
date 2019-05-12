import controlP5.*;

PImage background;
Bubble[] bubbles;
Table table;

ControlP5 cp5;
controlP5.Button b;
ControlGroup messageBox;

int buttonValue = 1;
int messageBoxResult = -1;
String messageBoxString = "";
int value = 0;

//This is the variables for different locations
float l = 5;
float w = 5;
float p = 5;
float d = 20;

//This is the array for user inputs
float lon[] = {};
float lat[] = {};
float live[] = {};
float work[] = {};
float play[] = {};
String say[] = {};
boolean isOpen;

void setup() {
  size(1920,1080);
  background = loadImage("Data/Kyiv_masterplan.jpg");
  background.resize(width, height);
  //createMessageBox();
  smooth();
  
  loadData();
  
  cp5 = new ControlP5(this);
  
  // create sliders
  cp5.addSlider("l", 0, 10, l, width/2 + 700, height/2-70, 200, 20).linebreak();
  cp5.addSlider("w", 0, 10, w, width/2 + 700, height/2-30, 200, 20).linebreak();
  cp5.addSlider("p", 0, 10, p, width/2 + 700, height/2+10, 200, 20);
  
  // create textfield
  cp5.addTextfield("Any other thoughts you want to share with us?").setPosition(width/2 + 700, height/2+50).setSize(200, 20).setAutoClear(false);
  cp5.addBang("Submit").setPosition(width/2 + 700, height/2+90).setSize(200, 20);    
  
  cp5.getController("l").setCaptionLabel("Living");
  style("l");
  
  cp5.getController("w").setCaptionLabel("Working");
  style("w");
  
  cp5.getController("p").setCaptionLabel("Playing");
  style("p");
  
  // create left controllers
  cp5.addButton("button")
     .setValue(10)
     .setPosition(80,200)
     .setSize(140,60)
     .setId(1);
     
  b = cp5.addButton("buttonValue")
         .setValue(2)
         .setPosition(0,320)
         .setSize(300,300)
         .setId(2);
  
  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,30);

  cp5.getController("button")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(true)
     .setSize(13);
     
  b.getCaptionLabel()
   .setFont(font)
   .setSize(13)
   .toUpperCase(false)
   .setText("Please follow the steps below:"+
        "\n "+
        "\n1. Think about a Podil place in your mind;"+
        "\n2. Drag the bar of Live/Eat/Play to evaluate the place;"+
        "\n3. Type any ideas about the place and submit it;" +
        "\n4. Click the map location to draw the place");

  b.getCaptionLabel().getStyle().marginLeft = 0;
  b.getCaptionLabel().getStyle().marginTop = -70;

}

void draw() {
  background(background);
  //for (Bubble b : bubbles) {
  //  b.display();
  //  b.rollover(mouseX, mouseY);
  //}
 
  float x = b.x(b.getPosition());
  x += ((isOpen==true ? 0:-300) - x) * 0.2;;
  float y = b.y(b.getPosition());
  
  b.setPosition(x,y);
  
  //if(messageBox.isVisible()) {
  //  background(128);
  //} else {
  //  background(0);
  //  fill(255);
  //  text(messageBoxString,20,height-40);
  //}
  
  int i = 0; //<>//
  while(i < lon.length){
    
    fill(live[i]*25.5,work[i]*25.5,play[i]*25.5,127);
    //fill(255,255,255,200);
    //stroke(255,255,255,200);
    ellipse(lon[i], lat[i], d, d);
    //fill(255, 255, 255);
    text(name, lon[i]+15, lat[i]-15);
    lon[i] = lon[i] + random(-1, 1);
    lat[i] = lat[i] + random(-1, 1);
    
    live[i] = l;
    work[i] = w;
    play[i] = p;
    say[i] = name;
    
    i = i + 1;

  }
  
  rect(1620,0,300,height);
  fill(l*25.5,w*25.5,p*25.5,100);
  noStroke();
  
}

void mouseClicked(){
  if (mouseX < 1600){
  lon = append(lon, mouseX);
  lat = append(lat, mouseY);
  live = append(live, l);
  work = append(work, w);
  play = append(play, p);
  say = append(say, name);
  //if (value == 0) {
  //  value = 255;
  //} else {
  //  value = 0;
  //}
  };
  println(lon + "");

}

void mousePressed() {
  TableRow row = table.addRow();
  row.setFloat("lon", mouseX);
  row.setFloat("lat", mouseY);
  row.setFloat("diameter", l+w+p);
  row.setString("name", "Blah");

  saveTable(table, "data/data.csv");
  loadData();
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getId());
}

public void button(float theValue) {
  println("a button event. "+theValue);
  isOpen = !isOpen;
  cp5.getController("button").setCaptionLabel((isOpen==true) ? "Hide Instruction":"Show Instruction");
}
