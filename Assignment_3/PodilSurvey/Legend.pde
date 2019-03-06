void startInfo(){
      
    stroke(255,100);
    strokeWeight(2);
    fill(255,100);
    rect(200, 330, 420, 230);
    
    textAlign(CENTER);
    fill(37,83,89);
    textSize(20);
    text("Visualization of Kyiv community survey", 410, 370);

    fill(255);
    textSize(14);
    text("\nMove mouse -> interviewee's name;" +
         "\nRadius of cirle -> time spent here;" +
         "\nPress 'G' -> gender distribution;" +
         "\nPress 'A' -> age distribution;" +
         "\nPress 'L' -> living status;"  +
         "\nPress 'W' -> working status", 410, 400);
}

void genderDrawInfo(){
      
    stroke(255,100);
    strokeWeight(2);
    fill(15,27,64,150);
    rect(260, 690, 300, 110);
    
    textSize(20);
    textAlign(CENTER);
    fill(255);
    text("Legend", 410, 720);
    fill(240,94,28);
    textSize(14);
    text("● Male", 410, 760);
    textSize(14);
    fill(221,210,59);
    text("● Female", 410, 780);
}

void liveDrawInfo(){
      
    stroke(255,100);
    strokeWeight(2);
    fill(15,27,64,150);
    rect(260, 690, 300, 110);
    
    textSize(20);
    textAlign(CENTER);
    fill(255);
    text("Legend", 410, 720);
    fill(247,92,47);
    textSize(14);
    text("● Live in Kyiv", 410, 760);
    textSize(14);
    fill(136,76,58);
    text("● Not live in Kyiv", 410, 780);
}

void workDrawInfo(){
      
    stroke(255,100);
    strokeWeight(2);
    fill(15,27,64,150);
    rect(260, 690, 300, 110);
    
    textSize(20);
    textAlign(CENTER);
    fill(255);
    text("Legend", 410, 720);
    fill(217,205,144);
    textSize(14);
    text("● Work in Kyiv", 410, 760);
    textSize(14);
    fill(38,135,133);
    text("● Not work in Kyiv", 410, 780);
}

void ageDrawInfo(){
      
    stroke(255,100);
    strokeWeight(2);
    fill(15,27,64,150);
    rect(260, 630, 300, 170);
    
    textSize(20);
    textAlign(CENTER);
    fill(255);
    text("Legend", 410, 660);
    fill(217,205,144);
    textSize(14);
    fill(250,214,137,250);
    text("● 18-24", 410, 700);
    textSize(14);
    fill(250,214,137,200);
    text("● 25-34", 410, 720);
    textSize(14);
    fill(250,214,137,150);
    text("● 35-44", 410, 740);
    textSize(14);
    fill(250,214,137,100);
    text("● 45-54", 410, 760);
    textSize(14);
    fill(250,214,137,50);
    text("● 55-64", 410, 780);
}
