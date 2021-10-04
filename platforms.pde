ArrayList<platforms> p = new ArrayList();
ArrayList<Integer> pz = new ArrayList();

void platforms() {

  for (int i=0; i<p.size(); i++) {  //отрисовка платформ
    p.get(i).update();
  }
  if(p.size()>pz.size()) pz.add(1000);
}

    class platforms {

      float px, pz, pc;

      platforms(float x, float z, float c) {
        px = x;
        pz = z;
        pc = c; //цвет
      }

      void update() {
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
