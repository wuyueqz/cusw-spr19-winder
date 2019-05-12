String name = "";

void Submit() {
  print("the following text was submitted :");
  name = cp5.get(Textfield.class,"Any other thoughts you want to share with us?").getText();
  cp5.get(Textfield.class, "Any other thoughts you want to share with us?").setText("");
}
