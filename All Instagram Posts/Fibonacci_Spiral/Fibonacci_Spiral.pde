float raio;
float tX;
float tY;
float rAngle;
void setup()
{
  size(900, 900);
}

void draw()
{
  background(0);
  translate(width/1.6180, height/1.6180);

  rAngle = PI;
  raio = 400;
  tX = 0;
  tY = 0;
  noFill();
  stroke(255);
  beginShape();

  for (int cont=0; cont<10; cont++)
  {
    for (float i=0; i<PI/2; i+=0.01)
    {
      float x = raio*cos(i);
      float y = raio*sin(i);

      float newX = cos(rAngle)*x + sin(rAngle)*y;
      float newY = -sin(rAngle)*x + cos(rAngle)*y;
      
      float aaax = cos(rAngle)*raio + sin(rAngle)*raio;
      float aaay = -sin(rAngle)*raio + cos(rAngle)*raio;
      
      rect(min(tX, tX+aaax), min(tY, tY+aaay), abs(aaax), abs(aaay));
      
      vertex(tX+newX, tY+newY);
    }
    
    rAngle -= PI/2;
    tX += (raio - raio/1.6180)*cos(rAngle);
    tY -= (raio - raio/1.6180)*sin(rAngle);
    raio/=1.6180;
  }
  endShape();
  
  noLoop();
}