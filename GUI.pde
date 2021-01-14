void gui() {

  cp5 = new ControlP5(this);

  // group number 1, contains 3 radio buttons to select which circle is affected and radiobuttons to select subtractive or additive mode
  Group g1 = cp5.addGroup("circles").setBackgroundColor(color(0, 64)).setBackgroundHeight(75);
  selectCircle = cp5.addRadioButton("selectCircle").setPosition(10, 20).setItemWidth(20).setItemHeight(20).addItem("Circle 1", 1).addItem("Circle 2", 2).addItem("Circle 3", 3).setColorLabel(color(255)).activate(0).moveTo(g1);
  cp5.addRadioButton("subadd").setPosition(100, 20).setItemWidth(20).setItemHeight(20).addItem("Subtractive", 1).addItem("Additive", 2).setColorLabel(color(255)).activate(1).moveTo(g1);

  // group number 2, contains different sliders to change rgb values (r,g,b,a)
  Group g2 = cp5.addGroup("colors").setBackgroundColor(color(0, 64)).setBackgroundHeight(150);
  rSlider = cp5.addSlider("r").setPosition(10, 20).setSize(100, 20).setRange(0, 255).setValue(0).moveTo(g2);
  gSlider = cp5.addSlider("g").setPosition(10, 50).setSize(100, 20).setRange(0, 255).setValue(0).moveTo(g2);
  bSlider = cp5.addSlider("b").setPosition(10, 80).setSize(100, 20).setRange(0, 255).setValue(255).moveTo(g2);
  aSlider = cp5.addSlider("a").setPosition(10, 110).setSize(100, 20).setRange(0, 255).setValue(255).moveTo(g2);

  // group number 3, contains sliders to change the diameter of the circle
  Group g3 = cp5.addGroup("properties").setBackgroundColor(color(0, 64)).setBackgroundHeight(150);
  cp5.addSlider("size").setPosition(10, 20).setSize(100, 20).setRange(100, 250).setValue(100).moveTo(g3);

  // create a new accordion
  // add g1, g2, and g3 to the accordion.
  accordion = cp5.addAccordion("acc").setPosition(40, 40).setWidth(250).addItem(g1).addItem(g2).addItem(g3);
  accordion.open(0, 1, 2);
  accordion.setCollapseMode(Accordion.MULTI);
}

int[] getSliders(){
  int[] foo = { (int)cp5.getController("r").getValue(), 
    (int)cp5.getController("g").getValue(), 
    (int)cp5.getController("b").getValue(), 
    (int)cp5.getController("a").getValue(),
    (int)cp5.getController("size").getValue()};
    return(foo);
}

void setSliders(int[] foo){
  cp5.getController("r").setValue(foo[0]);
  cp5.getController("g").setValue(foo[1]);
  cp5.getController("b").setValue(foo[2]);
  cp5.getController("a").setValue(foo[3]);
  cp5.getController("size").setValue(foo[4]);
}

void setSlidersName(String rgb){
  rSlider.setCaptionLabel(rgb.substring(0,1));
  gSlider.setCaptionLabel(rgb.substring(1,2));
  bSlider.setCaptionLabel(rgb.substring(2));
}

void selectCircle(int var) {
  switch(var) {
    case(1): cir1.active = true; cir2.active = false; cir3.active = false; break;
    case(2): cir1.active = false; cir2.active = true; cir3.active = false; break;
    case(3): cir1.active = false; cir2.active = false; cir3.active = true; break;
  }
}

//checks whether the mode is additive or subtractive
void subadd(int var){
 switch(var){
  case(1): additive = false; break;
  case(2): additive = true; break;
 }
}
