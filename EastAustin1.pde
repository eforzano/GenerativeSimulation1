int xspacing = 16;   //16 How far apart should each horizontal location be spaced
int w;              // Width of entire wave
float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
//int unit = 200; 
int unit = 40;
int count;
Module[] mods;

void setup() {
  fullScreen();
  stroke(35);
  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Module[count];
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.0, 0.8), unit); // random(0.0, 0.8)
    }
  }
}

void draw() {
  background(175); //85
  for (Module mod : mods) {
    mod.update();
    mod.display();
  }
}


class Module {
  int xOffset;
  int yOffset;
  float x, y;
  int unit;
  int xDirection = 1;
  int yDirection = 1;
  float speed; 
  
  // Contructor
  Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    speed = speedTemp * 2;
    unit = tempUnit;
  }
  
  // Custom method for updating the variables
  void update() {
    x = x + (speed * xDirection);
    y = x + (speed * xDirection);
    if (x >= unit || x <= 0) {
      xDirection *= -1; //
      x = x + (1 * xDirection);
      y = y + (1 * yDirection);
    } 
    if (y >= unit || y <= 0) {
      yDirection *= -1;
      y = y + (1 * yDirection);
    }
  }

  // Custom method for drawing the object
  void display() {
    if (frameCount % 2 == 0) {
      //strokeWeight(random(0,3));
      //fill(75, frameCount * .5 % 255, frameCount * 6 % 255, random(200, 255));
      fill(frameCount * .3 % 255, frameCount * .5 % 255, frameCount * 6 % 255, random(200, 255));
      stroke(0, 175, random(0, 255));
      
    }
    
    stroke(0, 175, random(0, 255));
    //rect(yOffset + y + 200, xOffset + x -50,100, 100);
    
    
    /*
    dancing lines
    theta += 0.02;
    // For every x value, calculate a y value with sine function

    float wx = theta;
    for (int wi = 0; wi < yvalues.length; wi++) {
      yvalues[wi] = sin(wx); //*amplitude;
      x= x+dx;
    }
    for (int x = 0; x < yvalues.length; x++) {
      rect(x*xspacing * random(1,10), random(1, 1) * height/2+yvalues[x]-300, xOffset /100, xOffset + x -50);
     
    }
    */
    //squares 
    rect(xOffset + x -50, yOffset + y -50, 150, 150);
    //rect(xOffset + x -50, yOffset + y -50, 150, 150);
    //rect(xOffset + x, yOffset + y , random(90, 100), 100); 

  }
}