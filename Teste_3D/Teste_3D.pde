float angle = 0;

void setup()
{
  size(800, 800, P3D);
}

void draw()
{
  background(0);
  translate(width/2, height/2);

  lights();

  rotateY(-PI/4);
  //rotateY(map(mouseX, 0, width, 0, TWO_PI));

  rotateX(-PI/8);
  rotateZ(PI/8);

  //sphere(20);

  float size = 100;
  stroke(0);
  strokeWeight(1);

  for (int k=-1; k<2; k++)
  {
    for (int j=-1; j<2; j++)
    {
      for (int i=-1; i<2; i++)
      {
        fill(200);
        pushMatrix();
        translate(i*size, j*size, k*size);
        box(size);

        pushMatrix();
        if (i == -1)
        {
          fill(0, 0, 255);
          translate(-size*0.501, 0, 0);
          box(size*0.002, size, size);
        } else if (i == 1)
        {
          fill(0, 255, 0);
          translate(size*0.501, 0, 0);
          box(size*0.002, size, size);
        }
        popMatrix();

        pushMatrix();
        if (j == -1)
        {
          fill(255, 0, 0);
          translate(0, -size*0.501, 0);
          box(size, size*0.002, size);
        } else if (j == 1)
        {
          fill(255, 128, 0);
          translate(0, size*0.501, 0);
          box(size, size*0.002, size);
        }
        popMatrix();

        pushMatrix();
        if (k == -1)
        {
          fill(255, 255, 255);
          translate(0, 0, -size*0.501);
          box(size, size, size*0.002);
        } else if (k == 1)
        {
          fill(255, 255, 0);
          translate(0, 0, size*0.501);
          box(size, size, size*0.002);
        }
        popMatrix();

        popMatrix();
      }
    }
  }

  /*fill(255);
   fill(0, 0, 255);
   box(100);
   translate(100, 100, 100);
   fill(255, 0, 0);
   box(100);*/
}