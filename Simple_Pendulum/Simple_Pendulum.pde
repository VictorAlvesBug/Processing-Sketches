float gravity = -0.8;

Pendulum[] pendulum = new Pendulum[15];

void setup()
{
  size(800, 800);

  for (int i=0; i<pendulum.length; i++)
  {
    float firstHeight = 300;
    float difHeight = firstHeight/3 / pendulum.length;

    pendulum[i] = new Pendulum(firstHeight + difHeight*i);
  }
}

void draw()
{
  if (mouseX>width/2)
  {
    return;
  }
  
    background(255);
    stroke(0);
    strokeWeight(2);
    fill(0);

    for (int i=0; i<pendulum.length; i++)
    {
      pendulum[i].update();
      pendulum[i].show();
    }
}