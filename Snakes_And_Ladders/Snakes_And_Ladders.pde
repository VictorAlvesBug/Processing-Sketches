Casa[][] casa;
int maxRows = 11, maxCols = 11, playerNum = 0;
PVector playerPos;
Linha[] snake = new Linha[3];
Linha[] ladder = new Linha[3];

void setup()
{
  size(771, 771);
  casa = new Casa[maxCols][maxRows];

  for (int row=0; row<maxRows; row++)
  {
    for (int col=0; col<maxCols; col++)
    {
      casa[col][row] = new Casa(col, row);
    }
  }

  for (int i=0; i<snake.length; i++)
  {
    snake[i] = new Linha("Snake");
  }

  for (int i=0; i<ladder.length; i++)
  {
    ladder[i] = new Linha("Ladder");
  }

  playerPos = new PVector(0, maxRows-1);
}

void draw()
{
  background(255);
  frameRate(1);

  boolean utilizouLinha = false;

  for (int i=0; i<snake.length; i++)
  {
    if (snake[i].valInicio < snake[i].valFim)
    {
      if (playerPos == snake[i].fim)
      {
        playerPos = snake[i].inicio;
        playerNum = snake[i].valInicio;
        utilizouLinha = true;
      }
    } else
    {
      if (playerPos == snake[i].inicio)
      {
        playerPos = snake[i].fim;
        playerNum = snake[i].valFim;
        utilizouLinha = true;
      }
    }
  }

  for (int i=0; i<ladder.length; i++)
  {
    if (ladder[i].valInicio < ladder[i].valFim)
    {
      if (playerPos == ladder[i].inicio)
      {
        playerPos = ladder[i].fim;
        playerNum = ladder[i].valFim;
        utilizouLinha = true;
      }
    } else
    {
      if (playerPos == ladder[i].fim)
      {
        playerPos = ladder[i].inicio;
        playerNum = ladder[i].valInicio;
        utilizouLinha = true;
      }
    }
  }

  if (!utilizouLinha)
  {
    playerNum += 1/*+random(6)*/;
  }

  strokeWeight(1);
  stroke(92);
  fill(0);
  for (int row=0; row<maxRows; row++)
  {
    for (int col=0; col<maxCols; col++)
    {
      casa[col][row].show();

      if (casa[col][row].num == playerNum)
      {
        playerPos = new PVector(col, row);
      }
    }
  }

  if (playerNum >= maxRows*maxCols - 1)
  {
    playerPos = new PVector(maxCols-1, 0);
  }

  for (int i=0; i<snake.length; i++)
  {
    snake[i].show();
  }

  for (int i=0; i<ladder.length; i++)
  {
    ladder[i].show();
  }

  DrawPlayer();
}

void DrawPlayer()
{
  pushMatrix();

  fill(0, 0, 255);
  strokeWeight(1);
  stroke(0, 0, 255);
  translate(35+playerPos.x*70, 35+playerPos.y*70);
  rotate(3*PI/2);

  beginShape();
  for (float i=0; i<2*TWO_PI; i+=2*TWO_PI/5)
  {
    vertex(30*cos(i), 30*sin(i));
  }
  endShape(CLOSE);
  popMatrix();
}