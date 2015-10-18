class Slider {
  //Define dimensions of the slider rectangle, except for y value
  int x = 150;
  int y;
  int w = 30;
  int h = 30;
  //Variable to test whether mouse is inside slider
  boolean sliderAct = false;
  //Set fill color for slider rectangle
  color slideColor;

  //Constructor method has parameters for y coordinate and fill color of slider rectangle
  //because these differ depending on which slider is being drawn
  Slider (int yPosition, color slideCol) {
    y = yPosition;
    slideColor = slideCol;
  }

  //Display method for drawing slider
  void display() {
    //Rect behind line along which slider runs
    fill(80);
    rect (250, y, 230, h);

    //Line along which slider runs
    strokeWeight(8);
    stroke(slideColor);
    line (150, y, 350, y);
    strokeWeight(1);

    //Slider with fill value that depends on whether mouse is in area or not
    //Remember that we are in rectMode(CENTER)!
    if ((mouseX > x - w/2) && (mouseX < x + w/2) && (mouseY > y - h/2) && 
      (mouseY < y + h/2)) {
      fill(255);
    } 
    else {
      fill(200, 227, 247);
    }
    noStroke();
    //strokeWeight(2);
    //stroke(slideColor);
    ellipse (x, y, w-2, h-2);
    
    //Value printed on top of slider shape
    float sliderFloat = (x-150) * 1.275;
    int sliderInt = int(sliderFloat);
    String sliderValue = str(sliderInt);               //Variable to hold current value of slider to print on it
    fill(0);
    PFont valueFont;
    valueFont = createFont ("Arial", 12);
    textFont (valueFont);
    textAlign(CENTER);
    text (sliderValue, x, y+4);
  }

  //Drag method will control what happens when mouse is dragged
  void drag () {
    //Test whether mouse is inside the slider area
    if ((mouseX > x - w/2) && (mouseX < x + w/2) && (mouseY > y - h/2) && (mouseY < y + h/2)) {
      sliderAct = true;
    } else {
      sliderAct = false;
    }

    //Move slider as mouse is dragged, constrained within a range
    if (sliderAct == true) {
      x = mouseX;
      x = constrain(x, 150, 350);
    }
  }
  
  //Reset method will reset the x coordinate of slider rectangles
  void reset () {
   x = 150; 
  }
}

