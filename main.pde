float x = 0, y = 0;
float vx = 0, vy = 0;

int time;
float score = 0;

void setup() {

  size(300, 600, P3D);

  x = width/2;
  y = height+1000;

  p.add(new platforms(width/2, 170, int(random(100, 255))));


  beginCamera();
  rotateX(-0.3);
  endCamera();


  for (int i=0; i<5; i++) {
    p.add(new platforms(random(width), 450+i*280, int(random(100, 255))));
  }
}

void draw() {
  background(243,245,166);

  pointLight(256, 256, 256, width/2, height/4, 0);



  if (y<height) 
  if (time%72==0) p.add(new platforms(random(width), 1860, 200));


  platform();

  //player
  pushMatrix();
  translate(x, y, -100);
  noStroke();
  fill(167,49,211);
  sphere(30);
  popMatrix();


  pushMatrix();
  textSize(60);
  rotateX(0.3);
  //fill(0);
  text(int(score), 10, 70);
  popMatrix();

  if (y>height) menu();


  x += vx;
  y += vy;

  if (mousePressed) {
    if (mouseX>x+15&&vx<15) vx += (mouseX-x)/20;
    if (mouseX<x-15&&vx>-15) vx -= (x-mouseX)/20;
    if (mouseX>x-15&&mouseX<x+15) vx -= (vx)/5;
  }
  if (keyPressed&&key=='я') {
    y = height/2;
    vy = 0;
  }
  vx -= (vx)/40;
  vy += 0.2;


  time += 1;
}

