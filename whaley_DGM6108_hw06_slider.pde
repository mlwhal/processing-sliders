//Marika Whaley, DGM 6108, Homework 06: Slider, 5/19/12
//An interactive set of sliders that changes the fill color of a square 
//("test window") on the screen as they are dragged from left to right.
//Code has been updated to use object oriented programming.

//Declare variables for slider objects
Slider slider1;
Slider slider2;
Slider slider3;

//Define default fill color of test window
float fillRed = 0;
float fillGreen = 0;
float fillBlue = 0;

void setup() {
  size (500, 550);
  smooth();
  //Draw simple diagonal design in background
  background (77, 30, 188);
  noStroke();
  fill (126, 77, 245);
  triangle (0, height, width, 0, width, height);

  //Slider text instructions
  noStroke();
  fill (200, 227, 247);
  PFont font;
  font = loadFont ("UniversLTStd-Cn-20.vlw");
  textFont (font);
  textAlign(CENTER);
  text ("Move the sliders to adjust fill value", width/2, 475);
  text ("Press any key to reset", width/2, 500);

  //Instantiate sliders
  slider1 = new Slider(300, color(255, 0, 0));
  slider2 = new Slider(350, color(0, 255, 0));
  slider3 = new Slider(400, color(0, 0, 255));
}

void draw() {
  //Default test window with fill set to three fill variables
  fill(fillRed, fillGreen, fillBlue);
  noStroke();
  rectMode (CENTER);
  rect (width/2, height/4, 200, 200);

  //Draw sliders
  slider1.display();
  slider2.display();
  slider3.display();
}

void mouseDragged() {
  slider1.drag();
  slider2.drag();
  slider3.drag();

  //Set the fill color to match the x value 
  //The offset of 150 accounts for x being constrained between 150 and 350
  //and the multiplier accounts for the color range of 0-200 rather than 255
  fillRed = (slider1.x - 150) * 1.275;
  fillGreen = (slider2.x - 150) * 1.275;
  fillBlue = (slider3.x - 150) * 1.275;
  //Debugging: Print the fill value to see it change as slider is moved
  //println ("fillRed value is " + fillRed);
  //println ("fillGreen value is " + fillGreen);
  //println ("fillBlue value is " + fillBlue);
}

//If a key is pressed, reset fill color to 0 and all sliders
void keyPressed() {
  fillRed = 0;
  fillGreen = 0;
  fillBlue = 0;
  //println ("fillRed value is " + fillRed);
  //println ("fillGreen value is " + fillGreen);
  //println ("fillBlue value is " + fillBlue);
  slider1.reset();
  slider2.reset();
  slider3.reset();
}

