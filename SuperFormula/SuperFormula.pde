void setup()
{
  size(900, 900);
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  
  noFill();
  stroke(255,0,0);
  
  beginShape();
  
  for(float theta=0; theta<TWO_PI; theta+=0.01)
  {
    float raio = r(theta, 
                   mouseX/100.0, // a
                   mouseY/100.0, // b
                   4, // m
                   1, // n1
                   1, // n2
                   1  // n3
                   );
    float x = raio * cos(theta) * 50;
    float y = raio * sin(theta) * 50;
    
    vertex(x, y);
  }
  
  endShape(CLOSE);
  
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3)
{
  return pow(pow(abs(cos((m*theta)/4.0)/a), n2) + 
  pow(abs(sin((m*theta)/4.0)/b), n3), -1.0 / n1);
}