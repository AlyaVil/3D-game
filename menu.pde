int m;

void menu() {

  //strokeWeight(3);
  pushMatrix();
  lights();
  rectMode(CENTER);
  rotateX(0.3);
  translate(0, 0, 0);
  fill(0);
  rect(width/2, height/2, 106, 106, 20);
  if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height/2-50&&mouseY<height/2+50) fill(255);
  else
    fill(0, 120, 255);
  rect(width/2, height/2, 100, 100, 20);
  fill(0);
  triangle(width/2-33, height/2-33, width/2-33, height/2+33, width/2+43, height/2);
  fill(255);
  triangle(width/2-30, height/2-30, width/2-30, height/2+30, width/2+40, height/2);
  rectMode(CORNER);
  popMatrix();


  if (mousePressed&&m==0&&mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height/2-50&&mouseY<height/2+50) {

    p.clear();
    pz.clear();
    p.add(new platforms(width/2, 170, int(random(100, 255))));
    for (int i=0; i<6; i++) {
      p.add(new platforms(random(width), 450+i*280, int(random(100, 255))));
    }
    time = 0;
    x = width/2;
    y = height-225;
    vy = 0;
    score = 0;
    m = 1;
  }

  if (!mousePressed) m = 0;
}
