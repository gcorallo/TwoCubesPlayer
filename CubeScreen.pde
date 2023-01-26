class CubeScreen {

  float rot;
  PVector pos;
  float s;
  int id;
  
  float dfMult=.25;;
  void init() {
    s=2;    
  }

  void update() {
  }

  void display() {

    push();
    translate(pos.x, pos.y, pos.z);

    push();
    rotateY(radians(rot));
    fill(255);
    scale(100);
    noStroke();
    texturedCube(id);
    pop();

    fill(255*dfMult, 0, 0);
    push();
    noStroke();
    rotateY(radians(rot));
    translate(0, 0, 100-2);
    rect(-100+1, -100+1, 200-2, 200-2);
    pop();

    fill(255*dfMult, 0, 255*dfMult);
    push();
    noStroke();
    rotateY(radians(rot));
    translate(0, 0, -100+2);
    rect(-100+1, -100+1, 200-2, 200-2);
    pop();



    fill(255*dfMult, 255*dfMult, 0);
    push();
    noStroke();
    rotateY(radians(-rot));
    translate(0, 0, 100-2);
    rect(-100+1, -100+1, 200-2, 200-2);
    pop();

    fill(0, 255*dfMult, 0);
    push();
    noStroke();
    rotateY(radians(-rot));
    translate(0, 0, -100+2);
    rect(-100+1, -100+1, 200-2, 200-2);
    pop();


    pop();
  }
}

void  texturedCube(int id) {

  float yc0 =0, yc1=1;
  if (id==0) {
    yc0 = 0;
    yc1 =.5;
  } else {
    yc0 = .5;
    yc1 =1;
  }

  beginShape(QUADS);
  texture(tex);

  // +Z "front" face
  vertex(-1, -1, 1, 0, yc0);
  vertex( 1, -1, 1, .25, yc0);
  vertex( 1, 1, 1, .25, yc1);
  vertex(-1, 1, 1, 0, yc1);

  // -Z "back" face
  vertex( 1, -1, -1, .5, yc0);
  vertex(-1, -1, -1, .75, yc0);
  vertex(-1, 1, -1, .75, yc1);
  vertex( 1, 1, -1, .5, yc1);

  // +X "right" face
  vertex( 1, -1, 1, .25, yc0);
  vertex( 1, -1, -1, .5, yc0);
  vertex( 1, 1, -1, .5, yc1);
  vertex( 1, 1, 1, .25, yc1);

  // -X "left" face
  vertex(-1, -1, -1, .75, yc0);
  vertex(-1, -1, 1, 1.0, yc0);
  vertex(-1, 1, 1, 1.0, yc1);
  vertex(-1, 1, -1, .75, yc1);

  endShape();
}
