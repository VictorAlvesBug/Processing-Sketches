class Paddle
{
  PVector pos, size = new PVector (20, 200);
  float percent = 0.5;
  int score = 0, num;

  Paddle(int num_)
  {
    num = num_;

    pos = new PVector(0, 0);

    if (num == 1)
    {
      pos.x = -(width/2 - size.x/2);
    } else
    {
      pos.x = +(width/2 - size.x/2);
    }
  }

  void draw()
  {
    if (num == 1)
    {
      if (puck.speed.x<0)
      {
        if (puck.pos.y < this.pos.y)
        {
          percent -= 0.015;
        } else
        {
          percent += 0.015;
        }
      }
    } else
    {
      if (puck.speed.x>0)
      {
        if (puck.pos.y < this.pos.y)
        {
          percent -= 0.015;
        } else
        {
          percent += 0.015;
        }
      }

      //percent = map(mouseY, this.size.y/2, height - this.size.y/2, 0, 1);
    }

    if (percent < 0)
    {
      percent = 0;
    } else if (percent > 1)
    {
      percent = 1;
    }

    pos.y = lerp(-height/2+size.y/2, height/2-size.y/2, percent);

    fill(255);
    rect(pos.x, pos.y, size.x, size.y);
  }
}