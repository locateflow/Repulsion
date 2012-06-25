int sz = 800;
float ang, v_ang, a_ang, F_ang;

void setup(){
  size(sz, sz);
  frameRate(30);
}

void draw(){
  background(125);
  textSize(20);
  text(360*ang/(2*PI), 10, 30);
  fill(0);
  translate(sz/2, sz/2);
  ellipse(0, 0, 10, 10);
  
  v_ang = PI/2*(sz/2-mouseY)/(sz/2);
//  if(ang >= 0){
  ang = (ang + v_ang)%(2*PI);
//  }
  if(ang < 0){
  ang = 2*PI + ang;
  }
  rotate(ang);
  ellipse(100, 0, 15, 15);
  
  
}
