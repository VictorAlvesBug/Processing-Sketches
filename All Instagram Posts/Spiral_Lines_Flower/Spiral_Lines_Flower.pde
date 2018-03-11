float angle, cont=0;
ArrayList<PVector> ponto = new ArrayList<PVector>();
PVector TRANSLATE = new PVector(0, 0);
float ROTATE = 0;

void setup()
{
  size(800, 800);
  colorMode(CENTER);
}

void draw()
{
  fill(0, 0, 0);
  rect(0, 0, width, height);

  translate(width/2, height/2);

  angle = map(sin(cont), -1, 1, PI + PI*0.94, 3*PI - PI*0.94);

  cont+=0.01;

  rotate(-20*angle);
  fill(0, 255, 255);
  ellipse(0, 0, 15, 15);
  DrawLines(6, 20, 0);
}

void DrawLines(int numLines, float size, int index)
{
  for (float i=0; i<TWO_PI; i += TWO_PI/numLines)
  {
    fill(map(index, 0, 20, 0, 180), 255, 255);
    //line(0, 0, size*cos(i), size*sin(i));
    ellipse(size*cos(i), size*sin(i), 15, 15);
    translate(size*cos(i), size*sin(i));
    rotate(angle);
    DrawLine(i, size, index+1);
    rotate(-angle);
    translate(-size*cos(i), -size*sin(i));
  }
}

void DrawLine(float ang, float size, int index)
{
  if (index < 20)
  {
    fill(map(index, 0, 20, 0, 180), 255, 255);
    //line(0, 0, size*cos(ang), size*sin(ang));
    float diametro = map(index, 0, 20, 15, 5);
    ellipse(size*cos(ang), size*sin(ang), diametro, diametro);

    translate(size*cos(ang), size*sin(ang));
    rotate(angle);
    DrawLine(ang, size*0.99, index+1);
    rotate(-angle);
    translate(-size*cos(ang), -size*sin(ang));
  }
}