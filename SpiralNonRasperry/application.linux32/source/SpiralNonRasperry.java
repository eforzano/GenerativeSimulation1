import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import hype.*; 
import hype.extended.behavior.HOscillator; 
import hype.extended.layout.HGridLayout; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SpiralNonRasperry extends PApplet {





HDrawablePool pool;
int boxSixe = 200;
float rValue = 0;
float gValue = 175; 
float bValue = 255;
float r = 0;
boolean rFlag = false;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

public void setup() {
  
  frameRate(45);
	H.init(this).background(0xff242424).use3D(true); 

	pool = new HDrawablePool(100);
	pool.autoAddToStage()
		.add(new HBox())
    
		.layout(new HGridLayout().startX(450).startY(-180).spacing(50,50).cols(1))
		.onCreate(
			 new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();

					HBox d = (HBox) obj;
					d.depth(boxSixe).width(boxSixe).height(700).noStroke().z(-500);

					new HOscillator()
						.target(d)
						.property(H.ROTATIONX)
						.range(-180, 180)
						.speed(0.3f)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONY)
						.range(-180, 180)
						.speed(0.3f)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-360, 360)
						.speed(0.1f) //* mouseY)
						.freq(1)
						.currentStep(i*2)
					;
				}
			}
		)
		.requestAll()
	;

}

public void draw() {
  if (upPressed == true)  {
      rValue = random(0, 200);
      gValue = random(0, 200);
      bValue = random(0, 200);
    
  }
  if (downPressed == true)  {
    if (r > 80){
      rFlag = true;
    } else if (r < -50){
      rFlag = false;
    }
    if (rFlag == true){
      r-=0.6f;
    } else if (rFlag == false){
      r+=0.6f;
    } 

  }
  pointLight(rValue, gValue, bValue, width, height/2, -300); // teal
	translate(width/4, height);
  rotateY(radians(r));
  translate(-width/32,-height);
  

	H.drawStage();
}

public void keyPressed() {
  if (keyCode == UP) {
    upPressed = true;
  }if(keyCode == DOWN) {
    downPressed = true;
  }if(keyCode == LEFT) {
    leftPressed = true;
  }if(keyCode == RIGHT) {
    rightPressed = true;
  }
  
}

public void keyReleased() { 
    if (keyCode == UP) {
      upPressed = false;
    }if(keyCode == DOWN) {
      downPressed = false;
    }if(keyCode == LEFT) {
      leftPressed = false;
    }if(keyCode == RIGHT) {
      rightPressed = false;
    }
  
}
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "SpiralNonRasperry" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
