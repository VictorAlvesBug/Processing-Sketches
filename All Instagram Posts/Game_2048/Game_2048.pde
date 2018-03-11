Bloco[][] bloco = new Bloco[4][4];
boolean clicado = false;

void setup()
{
  size(450, 450);
  colorMode(HSB);

  for (int col=0; col<4; col++)
  {
    for (int row=0; row<4; row++)
    {
      bloco[col][row] = new Bloco(col, row);
      bloco[col][row].value = 0;
    }
  }

  PVector p1, p2;

  do
  {
    p1 = new PVector((int)random(4), (int)random(4));
    p2 = new PVector((int)random(4), (int)random(4));
  } 
  while (p1.equals(p2));

  bloco[(int)p1.x][(int)p1.y].value = 2;
  bloco[(int)p2.x][(int)p2.y].value = 2;
}

void draw()
{
  boolean cheio = true, gameOver = false;

  background(128);
  noStroke();
  for (int col=0; col<4; col++)
  {
    for (int row=0; row<4; row++)
    {
      bloco[col][row].update();
      bloco[col][row].draw();

      if (bloco[col][row].value == 0)
      {
        cheio = false;
      }
    }
  }

  if (cheio)
  {
    gameOver = true;

    for (int col=0; col<3; col++)
    {
      for (int row=0; row<3; row++)
      {
        if (bloco[col][row].value == bloco[col+1][row].value ||
          bloco[col][row].value == bloco[col][row+1].value)
        {
          gameOver = false;
        }
      }
    }
  }

  if (gameOver)
  {
    println("Game Over!");
    for (int col=0; col<4; col++)
    {
      for (int row=0; row<4; row++)
      {
        bloco[col][row].value = 0;
      }
    }

    PVector p1, p2;

    do
    {
      p1 = new PVector((int)random(4), (int)random(4));
      p2 = new PVector((int)random(4), (int)random(4));
    } 
    while (p1.equals(p2));

    bloco[(int)p1.x][(int)p1.y].value = 2;
    bloco[(int)p2.x][(int)p2.y].value = 2;
  }

  if (clicado)
  {
    PVector p;

    do
    {
      p = new PVector((int)random(4), (int)random(4));
    } 
    while (bloco[(int)p.x][(int)p.y].value != 0);

    bloco[(int)p.x][(int)p.y].value = 2;
    clicado = false;
  }
}

void keyPressed() 
{
  int contador = 0;

  if (key == CODED) 
  {
    switch (keyCode)
    {
    case UP:
      while (contador<4)
      {
        width = 500;
        for (int col=0; col<4; col++)
        {
          for (int row=1; row<4; row++)
          {
            if (bloco[col][row-1].value == 0)
            {
              bloco[col][row-1].value = bloco[col][row].value;
              bloco[col][row].value = 0;
              clicado = true;
            }

            if (bloco[col][row-1].value == bloco[col][row].value)
            {
              bloco[col][row-1].value *= 2;
              bloco[col][row].value = 0;
              clicado = true;
            }
          }
        }

        contador++;
      }
      break;

    case DOWN:
      while (contador<4)
      {
        for (int col=0; col<4; col++)
        {
          for (int row=2; row>=0; row--)
          {
            if (bloco[col][row+1].value == 0)
            {
              bloco[col][row+1].value = bloco[col][row].value;
              bloco[col][row].value = 0;
              clicado = true;
            }

            if (bloco[col][row+1].value == bloco[col][row].value)
            {
              bloco[col][row+1].value *= 2;
              bloco[col][row].value = 0;
              clicado = true;
            }
          }
        }

        contador++;
      }
      break;

    case LEFT:
      while (contador<4)
      {
        for (int row=0; row<4; row++)
        {
          for (int col=1; col<4; col++)
          {
            if (bloco[col-1][row].value == 0)
            {
              bloco[col-1][row].value = bloco[col][row].value;
              bloco[col][row].value = 0;
              clicado = true;
            }

            if (bloco[col-1][row].value == bloco[col][row].value)
            {
              bloco[col-1][row].value *= 2;
              bloco[col][row].value = 0;
              clicado = true;
            }
          }
        }

        contador++;
      }
      break;

    case RIGHT:
      while (contador<4)
      {
        for (int row=0; row<4; row++)
        {
          for (int col=2; col>=0; col--)
          {
            if (bloco[col+1][row].value == 0)
            {
              bloco[col+1][row].value = bloco[col][row].value;
              bloco[col][row].value = 0;
              clicado = true;
            }

            if (bloco[col+1][row].value == bloco[col][row].value)
            {
              bloco[col+1][row].value *= 2;
              bloco[col][row].value = 0;
              clicado = true;
            }
          }
        }

        contador++;
      }
      break;
    }
  }
}