void keyPressed() {
  
  if (key == 'g' || key == 'G'){
    value = 0;
    v_age = 0;
    v_work = 0;
    v_live = 0;
    if (v_gender == 0) {
      v_gender = 255;
    } else {
      v_gender = 0;
    }
  }
  
  if (key == 'a' || key == 'A'){
    value = 0;
    v_gender = 0;
    v_work = 0;
    v_live = 0;
    if (v_age == 0) {
      v_age = 255;
    } else {
      v_age = 0;
    }
  }
  
  if (key == 'w' || key == 'W'){
    value = 0;
    v_age = 0;
    v_gender = 0;
    v_live = 0;
    if (v_work == 0) {
      v_work = 255;
    } else {
      v_work = 0;
    }
  }
  
  if (key == 'l' || key == 'L'){
    value = 0;
    v_age = 0;
    v_work = 0;
    v_gender = 0;
    if (v_live == 0) {
      v_live = 255;
    } else {
      v_live = 0;
    }
  }
}
