import processing.video.*;
Movie movie;

CubeScreen q0 = new CubeScreen();
CubeScreen q1 = new CubeScreen();

int cw = 512;
int ww;
int hh;
PGraphics tex;

PGraphics subTex0;
PGraphics subTex1;

int lh = 32;

TexSys texsys = new TexSys();

void setup() {
  randomSeed(0);
  textureMode(NORMAL);
  size(1280, 720, P3D);

  movie = new Movie(this, "video2.mp4");
  movie.loop();


  q1.init();
  q0.pos = new PVector(-200, 0, 0);
  q1.pos = new PVector(200, 0, 0);

  q0.rot =-45;
  q1.rot =-45;

  q0.id = 0;
  q1.id = 1;


  ww = cw*4;
  hh = cw*2;
  tex = createGraphics(ww, hh, P2D);
 

  subTex0 = createGraphics(ww, hh/2, P2D);
  subTex1 = createGraphics(ww, hh/2, P2D);


 

 
}

void draw() {

  texsys.display();

  background(0);
  hint(DISABLE_DEPTH_TEST);
  
  image(movie, 0, 0, movie.width*.25, movie.height*.25  );
  hint(ENABLE_DEPTH_TEST);

  translate(width/2, height/2, 0);
  float angX = map(mouseX, 0, width, -2*PI, 2*PI);


  rotateX(-PI/8);
  rotateY(angX);
  
  fill(255, 0, 0, 100);
  push();
  translate(0, 100, 0);
  rotateX(PI/2);

  strokeWeight(1);
  stroke(75, 75, 0);
  int nd = 30;
  float xx = 2000;
  float dx = xx/nd;
  for (int i=0; i<nd+1; i++) {
    line(i*dx-xx/2, -xx/2, i*dx-xx/2, xx/2 );
  }
  for (int i=0; i<nd+1; i++) {
    line(-xx/2, -xx/2+i*dx, xx/2, -xx/2 +i*dx);
  }


  pop();
  
  
  q0.display();
  q1.display();
}


void movieEvent(Movie m) {
  m.read();
}
