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
  
  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.0, 0.8), unit);
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
    speed = speedTemp;
    unit = tempUnit;
  }
  
  // Custom method for updating the variables
  void update() {
    x = x + (speed * xDirection);
    if (x >= unit || x <= 0) {
      xDirection *= -5;
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
      fill(frameCount * .3 % 255, frameCount * .5 % 255, frameCount * 6 % 255, random(55, 75));
      stroke(0, 175, random(0, 255));
      
    }
    
    stroke(0, 175, random(0, 255));
    //rect(yOffset + y + 200, xOffset + x -50,100, 100);
    rect(xOffset + x -50, yOffset + y -50, 150, 150);
    //rect(xOffset + x, yOffset + y , random(90, 100), 100); 

  }
}