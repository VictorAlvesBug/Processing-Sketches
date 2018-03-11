float angle = -0.5;

void setup()
{
  size(800, 800);
  colorMode(HSB);
  background(0);
}

void draw()
{
  background(0);

  ///FADE
  //fill(0, 30);
  //rect(0, 0, width, height);

  translate(width/2, height/2);

  int lados = 2;
  int minSize = 30;
  int maxSize = width/2 - 50;
  drawFlower(lados, minSize, maxSize, 10);

  angle += 0.002;
}

void drawFlower(int lados, int minSize, int maxSize, int passo)
{
  stroke(255);
  strokeWeight(2);
  fill(0);

  rotate(-PI/2);

  for (int size = maxSize; size>=minSize; size-=passo)
  {
    stroke(map(size, maxSize, minSize, 255, 0), 255, 255);

    beginShape();
    for (float i=0; i<TWO_PI; i+=TWO_PI/lados)
    {
      vertex(size*cos(i), size*sin(i));
      for (float a=i; a<i+angle; a+=0.1)
      {
        float p1 = map(a, i, i+angle, 0, passo);
        float p2 = map(a+0.1, i, i+angle, 0, passo);
        line((size-p1)*cos(a), (size-p1)*sin(a), (size-p2)*cos(a+0.1), (size-p2)*sin(a+0.1));
      }
    }
    endShape(CLOSE);
    rotate(angle);
  }
}