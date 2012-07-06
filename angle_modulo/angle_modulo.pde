int sz = 800;
Ball b1, b2, b3;

void setup(){
  size(sz, sz);
  frameRate(30);
  b1 = new Ball(b2, "b1");
  b2 = new Ball(b1, "b2");
}

void draw(){
  background(125);
  textSize(20);
  text(360*b1.ang/(2*PI), 10, 30);
  fill(0);
  translate(sz/2, sz/2);
  ellipse(0, 0, 10, 10);
  b1.allFunctions();
  b2.allFunctions();
  b1.repel(b2);
  b2.repel(b1);
  }

 

class Ball {
  float ang, v_ang, a_ang, F_ang; Ball other; String name;
  ArrayList others;
  
  Ball(Ball oin, String namein){
    ang = random(PI,2*PI);
    v_ang = random(PI,PI/32);
    a_ang = 0;
    F_ang = 0;
    other = oin;
    name = namein;    
  }
  
  void move(){    
//    v_ang = PI/2*(sz/2-mouseY)/(sz/2);  
    ang = (ang + v_ang)%(2*PI);
    if(ang < 0){
    ang = 2*PI - ang;
    }
    rotate(ang);  
  
    F_ang = 0.5*sq(v_ang);
    v_ang = v_ang + v_ang * a_ang;  
  
  }
  
  void display(){    
      ellipse(100, 0, 15, 15);
      text(
  }
  
  void allFunctions(){
    this.move();this.display();
  }
  
  void repel(Ball oin) {

    if (mouseX>width/2){
v_ang = (v_ang + (.05/((-oin.ang + ang)) - v_ang));
    }else{
v_ang = v_ang + ((oin.ang - ang)/25 - v_ang);

    }
  }  
  
}
