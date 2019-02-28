float angle;
float concentration;
float viewOff;
float value = .01; // This is to control the value of rotation speed;

PVector half = new PVector();
PVector mouse = new PVector();

PShape bridge;

void setup() {
  size(640, 360, P3D);
  frameRate(60);
  bridge = loadShape("Bridge.obj");
  bridge.setFill(0xffffffff);
  bridge.setSpecular(0xfffff7d5); // This is to import the Kyiv Pedestrain Bridge
  
  angle = QUARTER_PI;
  viewOff = height * .7;
  
  half.set(width * .5, height * .5);
}

void draw() {
  
  background(0);
  
  String t = "Output Statistics" + "\nSpotlight X: " + mouseX + "\nSpotlight Y: " + mouseY + "\nRotation Speed: " + value;             
  fill(255);
  text(t, mouseX-320*.8, mouseY-180*.8, 200, 200); // This is to set the output stats;
  
  camera(0, 0, viewOff,
    0, 0, 0,
    0, 1, 0); // This is to set up the camera;
    
  lightSpecular(64, 64, 64);
  
  spotLight(0, 127, 255,
    -half.x, sin(frameCount * .02) * half.y, 0,
    1, 0, 0,
    PI, 25);
  
  spotLight(0, 255, 127,
    cos(frameCount * .02) * half.x, -half.y, 0,
    0, 1, 0,
    PI, 25);
    
  spotLight(191, 170, 133,
    0, 0, viewOff,
    mouse.x, mouse.y, -1,
    angle, concentration); // Set up 3 spotlights
  
  shape(bridge);

  concentration = map(cos(frameCount * .01), -1, 1, 12, 100);
  mouse.set(mouseX - half.x, mouseY - half.y, viewOff);
  mouse.normalize(); // Change the concentration of the last spotlight by moving mouse;
  
  if (keyPressed == true) {
    value = 0;
  } else {
    value = .01;
  }; 
  
  bridge.rotateY(value); // Change the speed by keyboard input;
  
}
