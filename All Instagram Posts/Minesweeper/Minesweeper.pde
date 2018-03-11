Bloco[][] bloco;
Bloco flagSwitch, btnRestart;
int quantidade, numBombs, clickCont = 0;
float minutes, seconds;
boolean flagMode = false;

void setup()
{
  size(800, 800);

  Restart();
}

void Restart()
{
  bloco = new Bloco[10][10];
  quantidade = 8;

  flagSwitch = new Bloco((width - 105), 15);
  btnRestart = new Bloco((width - 165), 15);

  for (int i=0; i<quantidade; i++)
  {
    for (int j=0; j<quantidade; j++)
    {
      bloco[i][j] = new Bloco(i, j, quantidade);
    }
  }

  setBombPercent(20);
  setNumBlocks();

  minutes = 0;
  seconds = 0;

  loop();
}

void draw()
{
  background(0);
  frameRate(10);// EM 1 SEGUNDO RODA 10 VEZES
  seconds += 0.1;

  textSize(40);
  textAlign(CORNER);
  noStroke();
  fill(255);
  text("Mines: " + numBombs, 50, 50);

  if (gameOver())
  {
    noLoop();

    for (int i=0; i<quantidade; i++)
    {
      for (int j=0; j<quantidade; j++)
      {
        if (bloco[i][j].id == "Bomb")
        {
          bloco[i][j].status = "Open";
        }
      }
    }
  }

  drawBlock(btnRestart, "DarkBackground");
  drawBlock(btnRestart, "Restart");

  flagSwitch.show();

  for (int i=0; i<quantidade; i++)
  {
    for (int j=0; j<quantidade; j++)
    {
      bloco[i][j].show();
    }
  }

  if (gameOver())
  {
    noStroke();
    rectMode(CENTER);
    PVector pos = new PVector(width/2, height/2);
    PVector size = new PVector(2*width/3, height/4);
    fill(0);
    rect(pos.x, pos.y, size.x, size.y, 20);
    for (int c=0; c<20; c++)
    {
      float alpha = map(c, 0, 20, 30, 30);
      float sx = map(c, 0, 20, size.x, width/3);
      float sy = map(c, 0, 20, size.y, height/8);
      fill(255, 0, 0, alpha);
      rect(pos.x, pos.y, sx, sy, 20);
    }
    rectMode(CORNER);
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Game Over!!!", width/2, height/2+20);
  }

  if (checarFimDeJogo())
  {
    noStroke();
    rectMode(CENTER);
    PVector pos = new PVector(width/2, height/2);
    PVector size = new PVector(2*width/3, height/4);
    fill(0);
    rect(pos.x, pos.y, size.x, size.y, 20);
    for (int c=0; c<20; c++)
    {
      float alpha = map(c, 0, 20, 30, 30);
      float sx = map(c, 0, 20, size.x, width/3);
      float sy = map(c, 0, 20, size.y, height/8);
      fill(0, 0, 255, alpha);
      rect(pos.x, pos.y, sx, sy, 20);
    }
    rectMode(CORNER);
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Winner!!!", width/2, height/2-10);
    minutes = int(seconds/60);
    seconds %= 60;
    text("Your Time: "+int(minutes)+"min "+int(seconds)+"s", width/2, height/2+50);
    noLoop();
  }

  clickCont++;
}

boolean gameOver()
{
  for (int i=0; i<quantidade; i++)
  {
    for (int j=0; j<quantidade; j++)
    {
      if (bloco[i][j].status == "Open" && bloco[i][j].id == "Bomb")
      {
        return true;
      }
    }
  }

  return false;
}

void setBombPercent(float bombPercent)
{
  if (bombPercent <= 100)
  {
    for (int i=0; i<quantidade; i++)
    {
      for (int j=0; j<quantidade; j++)
      {
        bloco[i][j].id = "Empty";
      }
    }

    int x, y, cont=0;

    while (100 * cont/pow(quantidade, 2) < bombPercent)
    {
      do
      {
        x = int(random(0, quantidade));
        y = int(random(0, quantidade));
      }
      while (bloco[x][y].id != "Empty");

      bloco[x][y].id = "Bomb";
      cont++;
    }

    numBombs = cont;
  }
}

void setNumBlocks()
{
  for (int i=0; i<quantidade; i++)
  {
    for (int j=0; j<quantidade; j++)
    {
      if (bloco[i][j].id == "Empty")
      {
        int bombCont = 0;

        for (int x=i-1; x<=i+1; x++)
        {
          for (int y=j-1; y<=j+1; y++)
          {
            if (isBetween(0, x, quantidade-1) && isBetween(0, y, quantidade-1))
            {
              if (bloco[x][y].id == "Bomb")
              {
                bloco[i][j].id = "Num";
                bombCont++;
              }
            }
          }
        }

        bloco[i][j].num = bombCont;
      }
    }
  }
}

boolean isBetween(float minLim, float obj, float maxLim)
{
  return (obj >= minLim && obj <= maxLim);
}

boolean isBetween(PVector minLim, PVector obj, float size)
{
  return (obj.x >= minLim.x && obj.x <= minLim.x+size) && (obj.y >= minLim.y && obj.y <= minLim.y+size);
}

void openNeighbors(int i, int j)
{
  for (int x=i-1; x<=i+1; x++)
  {
    for (int y=j-1; y<=j+1; y++)
    {
      if (isBetween(0, x, quantidade-1) && isBetween(0, y, quantidade-1))
      {
        if (bloco[x][y].status != "Open" && bloco[x][y].id != "Bomb")
        {
          //bloco[x][y].click();
          bloco[x][y].status = "Open";

          if (bloco[x][y].id == "Empty")
          {
            openNeighbors(x, y);
          }
        }
      }
    }
  }
}

void mouseClicked()
{
  PVector mouse = new PVector(mouseX, mouseY);

  if (isBetween(btnRestart.pos, mouse, btnRestart.size))
  {
    Restart();
  }

  if (clickCont>3 && !gameOver())
  {
    clickCont = 0;

    if (isBetween(flagSwitch.pos, mouse, flagSwitch.size))
    {
      flagSwitch.click();
    } else
    {
      for (int i=0; i<quantidade; i++)
      {
        for (int j=0; j<quantidade; j++)
        {
          if (isBetween(bloco[i][j].pos, mouse, bloco[i][j].size))
          {
            bloco[i][j].click();
          }
        }
      }
    }
  }
}

boolean checarFimDeJogo()
{
  int cont=0;

  for (int i=0; i<quantidade; i++)
  {
    for (int j=0; j<quantidade; j++)
    {
      if (bloco[i][j].status != "Open")
      {
        cont++;
      }
    }
  }

  return (cont == numBombs);
}