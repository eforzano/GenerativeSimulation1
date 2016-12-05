import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.layout.HGridLayout;

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

void setup() {
  fullScreen(P3D);
  frameRate(45);
	H.init(this).background(#242424).use3D(true); 

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
						.speed(0.3)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONY)
						.range(-180, 180)
						.speed(0.3)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-360, 360)
						.speed(0.1) //* mouseY)
						.freq(1)
						.currentStep(i*2)
					;
				}
			}
		)
		.requestAll()
	;

}

void draw() {
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
      r-=0.6;
    } else if (rFlag == false){
      r+=0.6;
    } 

  }
  pointLight(rValue, gValue, bValue, width, height/2, -300); // teal
	translate(width/4, height);
  rotateY(radians(r));
  translate(-width/32,-height);
  

	H.drawStage();
}

void keyPressed() {
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

void keyReleased() { 
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