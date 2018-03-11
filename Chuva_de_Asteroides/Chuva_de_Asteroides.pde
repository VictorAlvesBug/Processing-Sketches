PVector[] ponto;
float angulo=0;

void setup()
{
  size(800, 800);
  
  ponto = new PVector[100];
  
  for(int i=0; i<100; i++)
  {
    ponto[i] = new PVector(random(width), random(height));
  }
  
}

void draw()
{
  background(0);
  
  for(int i=0; i<100; i++)
  {
    stroke(255);
    ThrowLine(ponto[i].x, ponto[i].y);
  }
  
  angulo+=0.1;
}

void ThrowLine(float posX,float posY)
{
  line(map(angulo%PI, 0, PI, mouseX, posX), map(angulo%PI, 0, PI, mouseY, posY), map(angulo%PI, 0, PI/2, mouseX, posX), map(angulo%PI, 0, PI/2, mouseY, posY));
}