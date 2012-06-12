int sz = 800;
Ball b1, b2, b3;
PVector F2 = new PVector(0, 0);

void setup(){
  size(sz, sz);
  b1 = new Ball(random(height), random(width), b2, "b1");
  b2 = new Ball(random(height), random(width), b1, "b2");
  b3 = new Ball(random(height), random(width), b1, "b3");
  frameRate(30);
}

void draw() {
  background(125);
  

  
  b1.display();
  b2.display();
  b3.display();


//text(b1.pos.x, 100, 100);
text("b1 angle: "+b1.ang/PI, 100, 100);
text("b2 angle: "+b2.ang/PI, 100, 200);
//text(b1.v.x, 200, 500);
text(b1.v_ang, 200, 500);
 
  b1.move();
  b2.move();
  b3.move();
  b1.repel(b2); b2.repel(b3); b3.repel(b1);
  b3.repel(b2); b2.repel(b1); b1.repel(b3);
//  b2.repel(b3); b3.repel(b2);
//  b1.repel(b3); b3.repel(b1);

}
  


class Ball {
  float ang, v_ang, a_ang, F_ang; 
//  Ball other; String name;
  PVector pos, v, a, F; Ball other; String name;
  ArrayList others;

  Ball(float xin, float yin, Ball oin, String namein){
//pos = new PVector(xin, yin);
ang = random(PI,2*PI);
//v = new PVector(random(-10,10), random(-10,10));
v_ang = random(PI,PI/32);
//a = new PVector(0, 0);
a_ang = 0;
//F = new PVector(0, 0);
F_ang = 0;
    other = oin;

    name = namein;
    
  }
  
  void move() {
//   if((pos.x>=sz-50)||(pos.x<=0)){v.x = -v.x;}
//   if((pos.y>=sz-50)||(pos.y<=0)){v.y = -v.y;}
//   pos.add(v);
ang = (ang + v_ang)%(2*PI);
//   F.x = 0.5*sq(v.x);    F.y = 0.5*sq(v.y);
F_ang = 0.5*sq(v_ang);
//   v.x = v.x + v.x*a.x;
v_ang = v_ang + v_ang * a_ang;
//   v.y = v.y + v.y*a.y;
//   v.dot(a);
   
    
  }
    
    
  void display() {
    pushMatrix();
    translate(width/2, height/2);
    ellipse(0, 0, 30, 30);
    pushMatrix();
//    ellipse(pos.x, pos.y, 20, 20);
rotate(ang);
ellipse(150, 0, 20, 20);
    pushStyle();
    fill(0);
    textAlign(CENTER);
    textSize(40);
    text(name, 150, 0);
    popStyle();
    popMatrix();
    popMatrix();
 ///   
  }
  void repel(Ball oin) {
    if (mouseX>width/2){
//v.add(new PVector((100/(-oin.pos.x + pos.x)) - v.x, (100/(-oin.pos.y + pos.y)) - v.y));
v_ang = (v_ang + (.05/((-oin.ang + ang)) - v_ang))%2*PI;
    }else{
//v.add(new PVector(((+oin.pos.x - pos.x)/25) - v.x, ((oin.pos.y - pos.y)/25) - v.y));
v_ang = v_ang + ((oin.ang - ang)%2*PI/25 - v_ang);

    }
  }
  
}

    
    
