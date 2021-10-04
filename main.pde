float x=0, y=0;
float vx=0, vy=0;

int time;
float score = 0;

void setup() {
  size(300, 600, P3D);

  x=width/2;
  y= height/2;
  
  p.add(new platforms(width/2,170,int(random(100,255))));


beginCamera();
rotateX(-0.3);
endCamera();

  
  for(int i=0; i<5; i++){  //для создания 5 платформ
    p.add(new platforms(random(width),450+i+280,int(random(100,255))));
  }
}

void draw() {
  background(255,251,170);
  
  pointLight(256,256,256,width/2,height/4,0); //свет

  pushMatrix();
  translate(x, y, -100);
  noStroke();
 fill(203,52,234);
  sphere(30);
  popMatrix();
  
  x += vx;
  y += vy;
  
  if(mousePressed){
    
    if(mouseX>x+15&&vx<15) vx += (mouseX-x)/20; //палец справа
    if(mouseX<x-15&&vx>-15) vx -= (x-mouseX)/20; //палец слева
    if(mouseX>x-15&&mouseX<x+15) vx -= (vx)/5; //шар сверхуу,снизу, под пальцем(скорость уменьшается)
  
  }
  if(keyPressed&&key=='я'){ y = height/2; vy = 0; 
}
  vx -= (vx)/40; //уменьшение скорости, чтобы не колебался шарик
  vx += 0.2; //шар падает
  
  if(y>height-60){  //если шар ниже координаты пола
    vy /= -1; //скорость меняет направление
    y = height-60; //шпр над полом
  } 
}
