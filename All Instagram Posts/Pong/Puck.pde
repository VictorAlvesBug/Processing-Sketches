class Puck
{
  PVector pos, speed;
  float size = 20;

  Puck()
  {
    reset();
  }

  void reset()
  {
    pos = new PVector(0, 0);
    float radius = 12;
    float angle = random(PI/18, 8*PI/18);
    float directionX = 2*(ceil(random(1))-0.5);
    float directionY = 2*(ceil(random(1))-0.5);
    speed = new PVector(directionX*radius*cos(angle), directionY*radius*sin(angle));
  }

  void update()
  {
    pos.x += speed.x;
    pos.y -= speed.y;
  }

  void collision()
  {
    if (pos.y < -height/2 || pos.y > height/2)
    {
      speed.y *= -1;
    }

    if ((pos.x < paddle1.pos.x+paddle1.size.x/2 && 
      pos.y > paddle1.pos.y-paddle1.size.y/2 && pos.y < paddle1.pos.y+paddle1.size.y/2) ||
      (pos.x > paddle2.pos.x-paddle1.size.x/2 && 
      pos.y > paddle2.pos.y-paddle1.size.y/2 && pos.y < paddle2.pos.y+paddle1.size.y/2))
    {
      speed.x *= -1;
    }
    
    if (pos.x < -width/2)
    {
      paddle2.score++;
      reset();
    }
    
    if (pos.x > width/2)
    {
      paddle1.score++;
      reset();
    }
  }

  void draw()
  {
    fill(255);
    //ellipse(pos.x, pos.y, size, size);
    rect(pos.x, pos.y, size, size);
  }
}