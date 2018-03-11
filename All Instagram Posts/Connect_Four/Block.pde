class Block
{
  PVector pos, index;
  int stone = 0;
  int diameter = 70;

  Block(float x, float y)
  {
    this.index = new PVector(x, y);
    this.pos = new PVector(25+x*100, height - 125 - y*100);
  }

  void show()
  {
    noStroke();

    float x = this.pos.x;
    float y = this.pos.y;

    if (this.index.y != 6)
    {
      fill(0, 0, 160);
      triangle(x, y, x+100, y, x, y+100);
      fill(0, 0, 96);
      triangle(x+100, y+100, x+100, y, x, y+100);

      fill(0, 0, 160);
      arc(x+50, y+50, diameter*1.25, diameter*1.25, -PI/4, PI-PI/4);
      fill(0, 0, 96);
      arc(x+50, y+50, diameter*1.25, diameter*1.25, PI-PI/4, TWO_PI-PI/4);

      if (this.stone != 0)
      {
        drawStone(x, y, this.stone, diameter);
      } else
      {
        fill(0, 0, 255);
        ellipse(50+x, 50+y, diameter, diameter);
      }
    } else
    {
      // ROW TO INSERT STONES
      if (floor(map(mouseX, 25, width-25, 0, 7)) == this.index.x)
      {
        // TEMP STONE
        drawStone(x, y, currentPlayer, diameter);
      }
    }
  }
}

color playerColor(int player, String local)
{
  switch(local)
  {
  case "BorderLeftUp":
    if (player == 1)
    {
      return color(0, 2*256/3, 0);
    } else
    {
      return color(2*256/3, 0, 0);
    }
  case "BorderRightBottom":
    if (player == 1)
    {
      return color(0, 256/3, 0);
    } else
    {
      return color(256/3, 0, 0);
    }
  case "Center":
    if (player == 1)
    {
      return color(0, 256/2, 0);
    } else
    {
      return color(256/2, 0, 0);
    }
  default:
    return color(0, 0, 0);
  }
}

boolean addStone(int col)
{
  if (col < 0)
  {
    col = 0;
  } else if (col > 6)
  {
    col = 6;
  }

  for (int row=0; row<6; row++)
  {
    if (grid[col][row].stone == 0)
    {
      grid[col][row].stone = currentPlayer;
      return true;
    }
  }

  return false;
}

void drawStone(float x, float y, int num, float diameter)
{
  for (int i=0; i<20; i++)
  {
    fill(playerColor(num, "BorderLeftUp"), map(i, 0, 20, 40, 10));
    arc(50+x, 50+y, diameter, diameter, PI-PI/4+map(i, 0, 20, PI/6, -PI/6), TWO_PI+map(i, 0, 20, -PI/6, PI/6));
    fill(playerColor(num, "BorderRightBottom"), 60);
    arc(50+x, 50+y, diameter, diameter, -PI/4+map(i, 0, 20, -PI/6, PI/6), PI-PI/4+map(i, 0, 20, PI/6, -PI/6));
  }

  for (int i=0; i<20; i++)
  {
    fill(playerColor(num, "Center"), map(i, 0, 20, 60, 10));
    ellipse(50+x, 50+y, diameter*map(i, 0, 20, 0.4, 1), diameter*map(i, 0, 20, 0.4, 1));
  }
}