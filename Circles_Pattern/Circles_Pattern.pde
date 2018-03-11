int cont = 0;

Circle[][] circle = new Circle[40][40];
float[][] ponto;

void setup()
{
  size(800, 800);
  
  ponto = new float[width][height];
  
  for (int row=0; row<40; row++)
  {
    for (int col=0; col<40; col++)
    {
      circle[col][row] = new Circle(col, row);
    }
  }
}

void draw()
{
  background(255);
  translate(width/2, height/2);/*

  distanciaH += direcao*0.1*size/20;

   if (distanciaH<9*size/20 || distanciaH>size/2)
   {
   direcao *= -1;
   }

  if (distanciaH<size/2 || distanciaH>size)
  {
    direcao *= -1;
  }

  // ALTURA DO TRIANGULO EQUILATERO
  // h = l*sqrt(3)/2
  distanciaV = distanciaH*(sqrt(3)/2);*/

  noFill();
  stroke(0);

  for (int row=0; row<height; row++)
  {
    for (int col=0; col<width; col++)
    {
      ponto[col][row] = 0;
    }
  }
  
  for (int row=0; row<40; row++)
  {
    for (int col=0; col<40; col++)
    {
      circle[col][row].update();
      circle[col][row].draw();
    }
  }
  
  translate(-width/4.0, -height/4.0);
  
  for (int row=0; row<height; row++)
  {
    for (int col=0; col<width; col++)
    {
      if(ponto[col][row] % 2 == 0)
      {
        stroke(0);
      }
      else
      {
        stroke(255);
      }
      
      point(col, row);
    }
  }

  /*for (int j=-height/2; j<height/2; j+=3)
  {
    for (int i=-width/2; i<width/2; i+=3)
    {
      cont = 0;

      for (int row=-20; row<20; row++)
      {
        for (int col=-20; col<20; col++)
        {
          if (dist(col*distanciaH-(row%2)*(distanciaH/2), row*distanciaV, i, j) < size/2)
          {
            cont++;
          }
        }
      }

      stroke((cont+1)%2 * 255, (cont+1)%2 * 255, 255);
      strokeWeight(2);
      point(i, j);
    }
  }*/
}