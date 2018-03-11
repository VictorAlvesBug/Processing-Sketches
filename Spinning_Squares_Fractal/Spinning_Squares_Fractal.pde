float indexMax = 1;
float angulo = 0;

void setup()
{
  size(800, 800);
  colorMode(HSB);
}

void draw()
{
  background(0);
  translate(width/2, height/2);

  noFill();
  stroke(255);

  float lados = 4;
  angulo += 0.01;
  
  rotate(PI/4);
  DrawShape(lados, 250, 0);
}

void DrawShape(float lados, float size, float index)
{

  rotate(pow(-1, index) * angulo);
  //rotate(3*index * angulo);

  stroke(map(index, 0, indexMax, 0, 180), 255, 255);
  //fill(map(index, 0, indexMax, 0, 180), 255, 255);

  beginShape();

  for (float i=0; i<TWO_PI; i += TWO_PI/lados)
  {
    vertex(size*cos(i), size*sin(i));
  }

  endShape(CLOSE);

  if (size > 20)
  {
    for (float i=0; i<TWO_PI; i += TWO_PI/lados)
    {
      pushMatrix();
      translate(size*cos(i), size*sin(i));
      DrawShape(lados, size/3, index+1);
      popMatrix();
    }
  }

  if (indexMax < index)
  {
    indexMax = index;
  }
}