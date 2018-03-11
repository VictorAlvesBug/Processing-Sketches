class Ball
{
  PVector pos, speed;
  int index, raio = int(random(60, 80));

  Ball(int i)
  {
    index = i;
    speed = new PVector(random(2, 3), random(2, 3));

    boolean valido;

    do
    {
      valido = true;

      pos = new PVector(random(raio, width-raio), random(raio, height-raio));

      for (int k=0; k<i; k++)
      {
        if (dist(pos.x, pos.y, ball[k].pos.x, ball[k].pos.y) < raio+ball[k].raio)
        {
          valido = false;
        }

        //ball[k] = new Ball(k);
      }
    } 
    while (!valido);
  }

  void update()
  {
    pos.x += speed.x;
    pos.y += speed.y;

    if (pos.x-raio<0)
    {
      speed.x *= -1;
      pos.x = raio;
    }

    if (pos.x+raio>width)
    {
      speed.x *= -1;
      pos.x = width-raio;
    }

    if (pos.y-raio<0)
    {
      speed.y *= -1;
      pos.y = raio;
    }

    if (pos.y+raio>height)
    {
      speed.y *= -1;
      pos.y = height-raio;
    }
  }

  void show()
  {
    int iteracoes = 10;
    for (int i=0; i<iteracoes; i++)
    {
      fill(map(i, 0, iteracoes, 32, 0), map(i, 0, iteracoes, 32, 0), map(i, 0, iteracoes, 192, 0));
      noStroke();
      float tmpRaio = map(i, 0, iteracoes, raio, raio*0.7);
      ellipse(pos.x, pos.y, 2*tmpRaio, 2*tmpRaio);
    }
    //strokeWeight(20);
    //stroke(64, 64, 192);
  }
}