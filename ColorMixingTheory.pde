import controlP5.*;
ControlP5 cp5;
Accordion accordion;
RadioButton selectCircle; //checks which circle is active via radiobuttons
Slider rSlider, bSlider, gSlider, aSlider;

Circle cir1, cir2, cir3, activeCir;
boolean additive; // checks whether additive or subtractive mode is selected

void setup() {
  size(800, 512);

  cir1 = new Circle(500, height/2, 100, 0, 0, 255, 255, true);
  cir2 = new Circle(470, 300, 100, 255, 0, 0, 255, false);
  cir3 = new Circle(530, 300, 100, 0, 255, 0, 255, false);
  activeCir = cir1;
  
  additive = true;
  gui();
}

void draw() {

  if (additive) {
    background(0);
    drawCircles();
    setSlidersName("RGB");
    blendMode(ADD);
  } else {
    background(255);
    drawCircles();
    setSlidersName("CMY");
    blendMode(SUBTRACT);
  }
}

void drawCircles() {
  if (cir1.active) {
    updateCir(cir1);
  } else if (cir2.active) {
    updateCir(cir2);
  } else if (cir3.active) {
    updateCir(cir3);
  }
  cir1.display();
  cir2.display();
  cir3.display();
}

int[] updateCir(Circle c) {
  int[] newColor = getSliders();
  c.r = newColor[0];
  c.g = newColor[1];
  c.b = newColor[2];
  c.a = newColor[3];
  c.diam = newColor[4];
  return newColor;
}

//checks which circle is selected and update its sliders
void controlEvent(ControlEvent event) {
  if (event.isFrom(selectCircle)) {
    float[] activeArray = selectCircle.getArrayValue();
    if (activeArray[0] == 1) {
      activeCir = cir1;
    } else if (activeArray[1] == 1) {
      activeCir = cir2;
    } else if (activeArray[2] == 1) {
      activeCir = cir3;
    }
    setSliders(new int[]{activeCir.r, activeCir.g, activeCir.b, activeCir.a, (int)activeCir.diam} );
  }
} 

//when a person clicks within a circle, it attaches to the mouse position
void mousePressed() {
  cir1.attach();
  cir2.attach();
  cir3.attach();
}

void mouseReleased() {
  cir1.detach();
  cir2.detach();
  cir3.detach();
}
