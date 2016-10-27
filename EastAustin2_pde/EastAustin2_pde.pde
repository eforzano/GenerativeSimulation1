import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.layout.HGridLayout;

HDrawablePool pool;
int           boxSixe = 200;

void setup() {
  fullScreen(P3D);
	//size(640,640,P3D);
	H.init(this).background(#242424).use3D(true);

	pool = new HDrawablePool(100);
	pool.autoAddToStage()
		.add(new HBox())
		.layout(new HGridLayout().startX(-230).startY(-125).spacing(300,100).cols(10))
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
						.speed(0.1)
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
	pointLight(255, 42, 42,   -1000,       height/2, -300); // orange
	pointLight(0, 175, 255,  width,   height/2, -300); // teal
	pointLight(255, 204, 75,  width/2, height/2, -900); // yellow

	H.drawStage();
}