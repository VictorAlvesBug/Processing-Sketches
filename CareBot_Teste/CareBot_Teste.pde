float segLength = 200;
float x, y, x2, y2, x3, y3;

void setup() {
  size(800, 800);
  strokeWeight(20.0);
  stroke(255, 100);
  
  x = width/2;
  y = height/2;
  x2 = x;
  y2 = y;
  x3 = x2;
  y3 = y2;
}

void draw() {
  background(0);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  float angle1 = atan2(dy, dx);  
  
  float tx = mouseX - cos(angle1) * segLength;
  float ty = mouseY - sin(angle1) * segLength;
  dx = tx - x2;
  dy = ty - y2;
  float angle2 = atan2(dy, dx);  
  
  updateAngle1();
  angle1 = map(mouseX, 0, width, 0, PI);
  angle2 = map(mouseY, 0, height, 0, PI);
  
  x = x2 + cos(angle2) * segLength;
  y = y2 + sin(angle2) * segLength;
  
  segment(x, y, angle1+angle2); 
  segment(x2, y2, angle2); 
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}