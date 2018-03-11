float a=0, b=0, limite = 9*900;
PVector cor;

void setup()
{
  size(800, 800, P3D);
}

void draw()
{
  background(0);
  translate(width/2, height/2, -900);

  lights();

  //rotateX(map(sin(a), -1, 1, 0, -PI/3));
  //rotateY(-a);
  //rotateZ(a*0.7);

  rotateX(-PI/6);
  rotateY(3*PI/5);

  a += 0.01;
  b += 0.0025;

  if (limite > 100)
  {
    limite /= 3;
  } else
  {
    limite = 9*900;
  }

  cor = new PVector(0, 0, 255);
  //cor = new PVector(255, 128, 0);

  noFill();
  //stroke(cor.x*0.5, cor.y*0.5, cor.z*0.5);
  stroke(0);
  strokeWeight(3);
  //box(900);
  DrawBox(900);

  delay(1000);
}

void DrawBox(float size)
{
  if (size>=limite)
  {

    for (int z=-1; z<2; z++)
    {
      for (int y=-1; y<2; y++)
      {
        for (int x=-1; x<2; x++)
        {
          pushMatrix();
          translate(x*size/3, y*size/3, z*size/3);

          if ((((z==-1 || z==1) && x==0 && y==0) ||
            ((z==0) && (x==0 || y==0))))
          {
            fill(cor.x, cor.y, cor.z);
            //noStroke();
            stroke(cor.x*0.5, cor.y*0.5, cor.z*0.5);
            DrawBox(size/3);
          } else
          {
            noFill();
            stroke(cor.x*0.5, cor.y*0.5, cor.z*0.5);
            strokeWeight(1);
            //box(size/3);
          }

          popMatrix();
        }
      }
    }
  } else
  {
    fill(cor.x, cor.y, cor.z);
    //noStroke();
    //stroke(cor.x*0.5, cor.y*0.5, cor.z*0.5);
    stroke(20);
    strokeWeight(1);
    box(size);
  }
}