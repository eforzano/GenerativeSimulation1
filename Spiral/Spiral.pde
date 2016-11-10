import processing.io.*;
import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.layout.HGridLayout;

HDrawablePool pool;
int boxSixe = 200;
float rValue = 0;
float gValue = 175; 
float bValue = 255;
float r = 0;

void setup() {
  fullScreen(P3D);
	//size(640,640,P3D);
  GPIO.pinMode(2, GPIO.INPUT);
  GPIO.pinMode(3, GPIO.INPUT);
  GPIO.pinMode(4, GPIO.INPUT);
  GPIO.pinMode(27, GPIO.INPUT);
	H.init(this).background(#242424).use3D(true); 

	pool = new HDrawablePool(100);
	pool.autoAddToStage()
		.add(new HBox())
    
		.layout(new HGridLayout().startX(650).startY(-180).spacing(50,50).cols(1))
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

  //pointLight(0, 175, 255, width, height/2, -300); // teal
  if (GPIO.digitalRead(3) != GPIO.HIGH)  {
      rValue = random(0, 200);
      gValue = random(0, 200);
      bValue = random(0, 200);
    
  }
  if (GPIO.digitalRead(4) != GPIO.HIGH)  {
     
      r+=0.8;
  }
  pointLight(rValue, gValue, bValue, width, height/2, -300); // teal
	translate(width/2, height/8);
  rotateY(radians(r));
  translate(-width/32,-height/8);
  

	H.drawStage();
}