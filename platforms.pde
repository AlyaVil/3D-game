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

ArrayList<platforms> p = new ArrayList();
ArrayList<Integer> pz = new ArrayList();

void platforms() {

  for (int i=0; i<p.size(); i++) {  //отрисовка платформ
    p.get(i).update();
  }
  if (p.size()>pz.size()) pz.add(1000);
  for (int i=0; i<pz.size(); i++) {
    pz.set(i, pz.get(i)-1);
    if (y<height&&pz.get(i)<0) {
      p.remove(i);
      pz.remove(i);
    }
  }
}

class platforms {

  float px, pz, pc;

  platforms(float x, float z, float c) {
    px = x;
    pz = z;
    pc = c; //цвет
  }

  void update() {

    if (pz>-500) {

      pushMatrix();
      translate(px, height-200, -pz);
      noStroke();
      if (pz>130||pz<70)
        if (pz<1635) fill(10, 7, 242); //платформа далеко
        else fill (10, 7, 242, 255-(pz-1635)); //платформа близко, прозрачность убывает
      box(60, 10, 60);
      popMatrix();

      if (y<height) pz -=4;
      if (y>height-225&&y<height-210&&x>px-50&&x<px+50&&pz<130&&pz>70) { //столкнулся ли шар с платформой
        score += 1;
        vy = -7;
        y = height-226;
      }
    }
  }
}

