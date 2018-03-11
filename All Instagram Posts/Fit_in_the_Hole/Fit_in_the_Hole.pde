Bloco[][] wall = new Bloco[8][6];
Bloco[][] player = new Bloco[8][6];
float wallPos = -1000;
int hole = (int)random(7), score = 0;
PVector playerPos, holePos;
boolean gameOver = true;

void setup()
{
  size(800, 800, P3D);

  for (int j=0; j<6; j++)
  {
    for (int i=0; i<8; i++)
    {
      wall[i][j] = new Bloco(i, j, "Wall", true);
    }
  }

  for (int j=0; j<6; j++)
  {
    for (int i=0; i<8; i++)
    {
      player[i][j] = new Bloco(i, j, "Player", false);
    }
  }

  Update();
  score = 0;
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  translate(-4*100 + 50, -2*100);

  lights();

  fill(128); 
  stroke(0);
  strokeWeight(1);

  for (int i=0; i<8; i++)
  {
    pushMatrix();
    translate(i*100, 600, -600);
    box(100, 100, 1000);
    popMatrix();
  }

  fill(255, 128, 0);

  for (int j=0; j<6; j++)
  {
    for (int i=0; i<8; i++)
    {
      wall[i][j].draw();
    }
  }

  fill(0, 0, 255);

  for (int j=0; j<6; j++)
  {
    for (int i=0; i<8; i++)
    {
      player[i][j].draw();
    }
  }

  if (!gameOver)
  {
    wallPos += 5;

    fill(255, 0, 0);
    textSize(30);
    text("Score: " + score, 40, -120);
  } else
  {
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(50);
    text("Game Over", width/2 - 40, -80);
    text("Score: " + score, width/2 - 40, -30);
  }

  if (wallPos >= -300) // COLISAO
  {
    for (int j=0; j<6; j++)
    {
      for (int i=0; i<8; i++)
      {
        if (player[i][j].visible == true &&
            player[i][j].visible == wall[i][j].visible)
        {
          // GAME OVER
          println("Game Over");
          gameOver = true;
          return;
        }
      }
    }
  }

  if (wallPos >= -200) // COLISAO
  {
    for (int j=0; j<6; j++)
    {
      for (int i=0; i<8; i++)
      {
        if (player[i][j].visible == wall[i][j].visible)
        {
          // GAME OVER
          println("Game Over");
          gameOver = true;
          return;
        }
      }
    }
    
    Update();
  }
}

void Update()
{
  wallPos = -1000;

  hole = (int)random(7);

  for (int j=0; j<6; j++)
  {
    for (int i=0; i<8; i++)
    {
      wall[i][j].visible = true;
      player[i][j].visible = false;
    }
  }

  playerPos = new PVector(4, 5);
  player[(int)playerPos.x][(int)playerPos.y].visible = true;

  holePos = new PVector(playerPos.x, playerPos.y);

  addHole((int)map(score, 0, 1000, 3, 13));
  score += (int)random(3*map(score, 0, 1000, 3, 13), 10 + 3*map(score, 0, 1000, 3, 13));
  
}

void addHole(int qtde)
{
  if (holePos.x >= 1 && holePos.x < 7 && holePos.y >= 1 && holePos.y < 6 && qtde>0)
  {
    wall[(int)holePos.x][(int)holePos.y].visible = false;

    boolean valido = false;

    while (!valido)
    {
      int num = (int)random(4);

      switch(num)
      {
      case 0:
        if (holePos.x-1 >= 1)
        {
          if (wall[(int)holePos.x-1][(int)holePos.y].visible)
          {
            holePos.x--;
          valido = true;
          }
        }
        break;

      case 1:
        if (holePos.x+1 < 7)
        {
          if (wall[(int)holePos.x+1][(int)holePos.y].visible)
          {
            holePos.x++;
          valido = true;
          }
        }
        break;

      case 2:
        if (holePos.y-1 >= 1)
        {
          if (wall[(int)holePos.x][(int)holePos.y-1].visible)
          {
            holePos.y--;
          valido = true;
          }
        }
        break;

      case 3:
        if (holePos.y+1 <= 5)
        {
          if (wall[(int)holePos.x][(int)holePos.y+1].visible)
          {
            holePos.y++;
          valido = true;
          }
        }
        break;
      }

    }

    addHole(qtde-1);
  }
}

void keyPressed()
{
  switch(keyCode)
  {
  case UP:
    if (playerPos.y-1>=0 && !gameOver)
    {
      playerPos.y--; 
      player[(int)playerPos.x][(int)playerPos.y].visible = true;
    }
    break;

  case DOWN:
    if (playerPos.y+1<6 && !gameOver)
    {
      playerPos.y++; 
      player[(int)playerPos.x][(int)playerPos.y].visible = true;
    }
    break;

  case LEFT:
    if (playerPos.x-1>=0 && !gameOver)
    {
      playerPos.x--; 
      player[(int)playerPos.x][(int)playerPos.y].visible = true;
    }
    break;

  case RIGHT:
    if (playerPos.x+1<8 && !gameOver)
    {
      playerPos.x++; 
      player[(int)playerPos.x][(int)playerPos.y].visible = true;
    }
    break;

  case ' ':
    if (!gameOver)
    {
      for (int j=0; j<6; j++)
      {
        for (int i=0; i<8; i++)
        {
          player[i][j].visible = false;
        }
      }

      playerPos = new PVector(4, 5);
      player[(int)playerPos.x][(int)playerPos.y].visible = true;
    }
    break;

  case ENTER:

    for (int j=0; j<6; j++)
    {
      for (int i=0; i<8; i++)
      {
        player[i][j].visible = false;
      }
    }

    playerPos = new PVector(4, 5);
    player[(int)playerPos.x][(int)playerPos.y].visible = true;

    Update();
    score = 0;
    gameOver = false;

    break;
  }
}