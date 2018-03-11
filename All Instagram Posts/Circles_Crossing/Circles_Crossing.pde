float ang=0;

void setup()
{
  size(800, 800);
}

void draw()
{
  background(0);
  translate(width/2, height/2);

  rotate(PI/6);

  strokeWeight(11);
  stroke(255);
  noFill();

  float distCentro = map(cos(ang), -1, 1, -0.9*width/3, 0.9*width/3);

  for (int i=0; i<20; i++)
  {
    float folga = 20;

    stroke(255, 0, 0);
    ellipse(distCentro*cos(0), distCentro*sin(0), i*folga, i*folga);
    stroke(0, 0, 255);
    ellipse(distCentro*cos(TWO_PI/3), distCentro*sin(TWO_PI/3), i*folga, i*folga);
    stroke(0, 255, 0);
    ellipse(distCentro*cos(2*TWO_PI/3), distCentro*sin(2*TWO_PI/3), i*folga, i*folga);
  }

  ang += 0.01;
}