float angulo = 0;

void setup()
{
  size(800, 800);
  colorMode(HSB);
}

void draw()
{
  background(0);
  translate(width/2, 3*height/5);

  stroke(map(2.095*sin(angulo), -2.095, 2.095,  0, 180), 255, 255);
  stroke(180, 255, 255);

  rotate(PI/6);
  DrawLines(0, 0, 200);
  
  //angulo += 0.02;
  
}

void DrawLines(float posX, float posY, float raio)
{
  if (raio>1)
  {    
    for (float i=0; i<TWO_PI; i += TWO_PI/3)
    {
      pushMatrix();
      translate(posX, posY);
      rotate(2.095*sin(angulo));
      //line(0, 0, raio*cos(i), raio*sin(i));
      DrawLines(raio*cos(i), raio*sin(i), 0.5*raio);
      popMatrix();
    }
  } else
  {
    for (float i=0; i<TWO_PI; i += TWO_PI/3)
    {
      pushMatrix();
      translate(posX, posY);
      rotate(2.095*sin(angulo));
      line(0, 0, raio*cos(i), raio*sin(i));
      popMatrix();
    }
  }
}