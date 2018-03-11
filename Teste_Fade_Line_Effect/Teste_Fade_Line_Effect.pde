float angulo = 0, raio = 100, anguloRaio = 0;
float StrokeWeight = 1;
PVector Stroke = new PVector(255, 255, 255);
PVector Fill = new PVector(255, 255, 255);

void setup()
{
  size(900, 900);
}

void draw()
{
  background(0);
  translate(width/2, height/2);

  raio = 150+50*sin(anguloRaio);

  anguloRaio+=0.02;

  stroke(255);
  strokeWeight(1);
  noFill();
  //ellipse(0, 0, 2*raio, 2*raio);

  noStroke();
  fill(50, 153, 204);
  stroke(50, 153, 204);

  Fill = new PVector(50, 153, 204);
  Stroke = new PVector(50, 153, 204);
  StrokeWeight = 1;

  LINE(-100, -100, 100, 100);
  LINE(-200, -200, 200, 400);
}

void POINT(int X, int Y)
{
  noStroke();

  for (float i=0; i<10; i+=0.1)
  {
    fill(map(i, 0, 10, 20, 1)*Fill.x, map(i, 0, 10, 20, 1)*Fill.y, map(i, 0, 10, 20, 1)*Fill.z);
    ellipse(X, Y, map(i, 0, 10, 3, 0.3)*StrokeWeight, map(i, 0, 10, 3, 0.3)*StrokeWeight);
  }
}

void LINE(int aX, int aY, int bX, int bY)
{
  for (float i=0; i<10; i+=0.1)
  {
    stroke(map(i, 0, 10, 0, 1)*Stroke.x, map(i, 0, 10, 0, 1)*Stroke.y, map(i, 0, 10, 0, 1)*Stroke.z);
    strokeWeight(map(i, 0, 10, 40, 1)*StrokeWeight);
    line(aX, aY, bX, bY);
  }
}

void Stroke()
{
}