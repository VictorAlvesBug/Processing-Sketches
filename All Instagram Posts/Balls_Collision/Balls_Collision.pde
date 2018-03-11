Ball[] ball;

void setup()
{
  size(800, 800);
  //fullScreen();
  ball = new Ball[16];

  for (int i=0; i<ball.length; i++)
  {
    ball[i] = new Ball(i);
  }
}

void draw()
{
  background(0);

  for (int i=0; i<ball.length; i++)
  {
    ball[i].update();
  }

  for (int i=0; i<ball.length; i++)
  {
    for (int j=i+1; j<ball.length; j++)
    {
      if(dist(ball[i].pos.x, ball[i].pos.y, ball[j].pos.x, ball[j].pos.y) < ball[i].raio+ball[j].raio)
      {
        float iCombinedSpeed = dist(0, 0, ball[i].speed.x, ball[i].speed.y);
        float jCombinedSpeed = dist(0, 0, ball[j].speed.x, ball[j].speed.y);
        float combinedSpeedAVG = (iCombinedSpeed+jCombinedSpeed)/2;
        ball[i].speed.x = combinedSpeedAVG*cos(atan2(ball[i].pos.y-ball[j].pos.y, ball[i].pos.x-ball[j].pos.x));
        ball[i].speed.y = combinedSpeedAVG*sin(atan2(ball[i].pos.y-ball[j].pos.y, ball[i].pos.x-ball[j].pos.x));
        ball[j].speed.x = -combinedSpeedAVG*cos(atan2(ball[i].pos.y-ball[j].pos.y, ball[i].pos.x-ball[j].pos.x));
        ball[j].speed.y = -combinedSpeedAVG*sin(atan2(ball[i].pos.y-ball[j].pos.y, ball[i].pos.x-ball[j].pos.x));
      }
    }
  }

  for (int i=0; i<ball.length; i++)
  {
    ball[i].show();
  }
}