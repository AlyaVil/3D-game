ArrayList<platforms> p = new ArrayList();
ArrayList<Integer> pz = new ArrayList();


void platform() {

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
    pc = c;
  }
  void update() {

    if (pz>-500) {

      pushMatrix();
      translate(px, height-200, -pz);
      noStroke();
      if (pz>130||pz<70) if (pz<1635) fill(0,89,229); //платформа далеко
      else fill(0,89,229, 255-(pz-1635));//платформа близко, прозрачность убывает
      else fill(0, 120, 256);
      box(60, 10, 60);
      popMatrix();


      if (y<height) pz -= 4;

      if (y>height-225&&y<height-210&&x>px-50&&x<px+50&&pz<130&&pz>70) {
        score += 1;
        vy = -7;
        y = height-226;
      }
    }
  }
}

