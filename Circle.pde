class Circle {
  float xpos, ypos;
  float diam;
  int r, g, b, a;
  boolean isAttached; //whether the mouse selects the circle
  float offsetx = 0;
  float offsety = 0;
  boolean active; //is this circle selected

  Circle(float xinit, float yinit, float dinit, int r, int g, int b, int a, boolean active) {
    xpos = xinit;
    ypos = yinit;
    diam = dinit;
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
    this.active = active;
    isAttached = false;
  }

  void display() {
    noStroke();

    if (isAttached) {
      xpos = mouseX - offsetx;
      ypos = mouseY - offsety;
    }
    
    fill (r,g,b,a);
    ellipse(xpos,ypos,diam,diam);
  }

  void attach() {
    if (dist(mouseX, mouseY, xpos, ypos) <= diam/2) {  //only if the mouse position is inside circle, it becomes 'attached'

      offsetx = mouseX - xpos;  //the offset is calculated for x position
      offsety = mouseY - ypos;  //the offset is calculated for y position
      isAttached = true;
    }
  }

  void detach() {
    offsetx = 0;    //offset is reset to 0
    offsety = 0;    //offset is reset to 0
    isAttached = false;
  }
  
   
}
