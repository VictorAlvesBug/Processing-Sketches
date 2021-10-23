Block[][] block;
float angle = 0;
PVector initialPos;
int maxRows = 20;
int maxCols = 20;
PVector walker;
PVector[] walkerHist;
int cont = 0;
boolean finish = false;
boolean play = true;
ArrayList<PVector> bestPath = new ArrayList<PVector>();
boolean bestPathDefined = false;

void setup()
{
  size(800, 800);

  initialPos = new PVector(0, 0);
  walker = new PVector(0, 0);
  walkerHist = new PVector[maxCols*maxRows];

  block = new Block[maxCols][maxRows];

  for (int row = 0; row < maxRows; row++)
  {
    for (int col = 0; col < maxCols; col++)
    {
      block[col][row] = new Block(col, row);
    }
  }

  for (int i = 0; i < walkerHist.length; i++)
  {
    walkerHist[i] = new PVector(0, 0);
  }
}

void draw()
{
  background(0);

  boolean showProcess = true;

  if (play)
  {
    if (showProcess)
    {
      if (!finish)
      {
        walk();
      }
    } else
    {
      while (!finish)
      {
        walk();
      }
    }
  }

  if (finish)
  {
    int size = (width - 100) / maxCols;

    noFill();
    strokeWeight(size/5);
    stroke(255, 0, 0);

    float x, y;

    beginShape();

    for (int i=0; i<bestPath.size()-1; i++)
    {
      x = block[(int)bestPath.get(i).x][(int)bestPath.get(i).y].pos.x + size/2;
      y = block[(int)bestPath.get(i).x][(int)bestPath.get(i).y].pos.y + size/2;

      vertex(x, y);
    }

    endShape(OPEN);
  }

  for (int row = 0; row < maxRows; row++)
  {
    for (int col = 0; col < maxCols; col++)
    {
      block[col][row].show();
    }
  }
}

void walk()
{
  boolean moveLeft = false;
  boolean moveRight = false;
  boolean moveUp = false;
  boolean moveDown = false;

  if (walker.x>0)
  {
    if (block[(int)walker.x-1][(int)walker.y].isolated)
    {
      moveLeft = true;
    }
  }

  if (walker.x<maxCols-1)
  {
    if (block[(int)walker.x+1][(int)walker.y].isolated)
    {
      moveRight = true;
    }
  }

  if (walker.y>0)
  {
    if (block[(int)walker.x][(int)walker.y-1].isolated)
    {
      moveUp = true;
    }
  }

  if (walker.y<maxRows-1)
  {
    if (block[(int)walker.x][(int)walker.y+1].isolated)
    {
      moveDown = true;
    }
  }

  if (moveLeft || moveRight || moveUp || moveDown)
  {
    // EXPLORING THE GRID

    boolean valido;
    int direcao;

    do
    {
      valido = true;
      direcao = (int)random(4);

      switch(direcao)
      {
      case 0:
        if (!moveLeft) {
          valido = false;
        }
        break;

      case 1:
        if (!moveRight) {
          valido = false;
        }
        break;

      case 2:
        if (!moveUp) {
          valido = false;
        }
        break;

      case 3:
        if (!moveDown) {
          valido = false;
        }
        break;
      }
    }
    while (!valido);

    block[(int)walker.x][(int)walker.y].isolated = false;
    block[(int)walker.x][(int)walker.y].update(direcao);
    block[(int)walker.x][(int)walker.y].isolated = false;

    if (!bestPathDefined && walker.x == maxCols-1 && walker.y == maxRows-1)
    {
      for (int i=0; i<=cont+1; i++)
      {
        bestPath.add(walkerHist[i]);
      }

      bestPathDefined = true;
    }
  } else
  {
    if (cont == 0)
    {
      // FINISH PROCESS
      walker = new PVector(maxCols, maxRows);
      block[0][0].up = false;
      block[maxCols-1][maxRows-1].down = false;
      finish = true;
    } else
    {
      // WALKING BACK IN THE GRID
      cont--;
      walker = new PVector(walkerHist[cont].x, walkerHist[cont].y);
    }
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    play = true;
  } else
  {
    play = false;
  }
}
