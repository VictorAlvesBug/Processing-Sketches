PVector planetA, planetB;
float angleA, angleB, radiusA, radiusB;
ArrayList<PVector> linePointA = new ArrayList<PVector>();
ArrayList<PVector> linePointB = new ArrayList<PVector>();
boolean start = false;

void setup()
{
  size(800, 800);

  angleA = PI/2;
  angleB = PI/2;

  radiusA = 300;
  radiusB = 350;
}

void draw()
{
  background(0);
  translate(width/2, height/2);

  if (start)
  {
    frameRate(20);

    planetA = new PVector(radiusA*cos(angleA), radiusA*sin(angleA));
    planetB = new PVector(radiusB*cos(angleB), radiusB*sin(angleB));

    linePointA.add(planetA);
    linePointB.add(planetB);

    stroke(255);

    for (int i=0; i<linePointA.size(); i++)
    {
      line(linePointA.get(i).x, linePointA.get(i).y, linePointB.get(i).x, linePointB.get(i).y);
    }

    noStroke();

    fill(0, 0, 255);
    ellipse(planetA.x, planetA.y, 30, 30);

    fill(255, 128, 0);
    ellipse(planetB.x, planetB.y, 40, 40);

    angleA += 0.13; // 13 voltas
    angleB += 0.05; // 8 voltas

    if (angleB > 7 * TWO_PI + PI/2)
    {
      noLoop();
    }
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    start = true;
  }
}