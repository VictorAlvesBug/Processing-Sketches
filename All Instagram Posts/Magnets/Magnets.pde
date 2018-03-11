ArrayList<Magnet> magnet;
float k = 9*pow(10, 5); // k = 9*pow(10, 9)
float raioBorda = 370;
float clickCont = 0;

void setup()
{
  size(800, 800);

  magnet = new ArrayList<Magnet>();

  //magnet.add(new Magnet(0, 0, 2));
}

void draw()
{
  translate(width/2, height/2);
  background(0);

  fill(0, 0, 255);
  stroke(192);
  strokeWeight(3);
  ellipse(0, 0, 2*raioBorda+30, 2*raioBorda+30);

  fill(0);
  ellipse(0, 0, 2*raioBorda, 2*raioBorda);

  for (Magnet m : magnet)
  {
    m.forca.x = 0;
    m.forca.y = 0;
  }

  for (int i=0; i<magnet.size(); i++)
  {
    for (int j=i+1; j<magnet.size(); j++)
    {
      // F = (k*q1*q2) / d^2
      // F = m*a
      // a = F/m

      float d = dist(magnet.get(i).pos.x, magnet.get(i).pos.y, magnet.get(j).pos.x, magnet.get(j).pos.y);
      float ang = atan2(magnet.get(j).pos.y-magnet.get(i).pos.y, magnet.get(j).pos.x-magnet.get(i).pos.x);
      float totalF = abs(k * magnet.get(i).carga * magnet.get(j).carga) / pow(d, 2);

      // co/h = sin(a);
      // ca/h = cos(a);
      // y = co = h*sin(a);
      // x = ca = h*cos(a);

      float c1 = magnet.get(i).carga;
      float c2 = magnet.get(j).carga;

      if (sinal(c1) == sinal(c2))
      {
        // REPELE (SINAIS IGUAIS)
        if (d < magnet.get(i).massa/4 + magnet.get(j).massa/4)
        {
          float sobreposicao = magnet.get(i).massa/4 + magnet.get(j).massa/4 - d;
          sobreposicao+=5;
          magnet.get(i).pos.x -= sobreposicao/2.0*cos(ang);
          magnet.get(i).pos.y -= sobreposicao/2.0*sin(ang);
          magnet.get(j).pos.x += sobreposicao/2.0*cos(ang);
          magnet.get(j).pos.y += sobreposicao/2.0*sin(ang);
        } else
        {
          magnet.get(i).forca.x -= totalF*cos(ang);
          magnet.get(i).forca.y -= totalF*sin(ang);
          magnet.get(j).forca.x += totalF*cos(ang);
          magnet.get(j).forca.y += totalF*sin(ang);
        }
      } else
      {
        // ATRAI (SINAIS DIFERENTES)
        if (d < magnet.get(i).massa/4 + magnet.get(j).massa/4)
        {
          float sobreposicao = magnet.get(i).massa/4 + magnet.get(j).massa/4 - d;
          //sobreposicao+=5;
          magnet.get(i).pos.x -= sobreposicao/2.0*cos(ang);
          magnet.get(i).pos.y -= sobreposicao/2.0*sin(ang);
          magnet.get(j).pos.x += sobreposicao/2.0*cos(ang);
          magnet.get(j).pos.y += sobreposicao/2.0*sin(ang);

          magnet.get(i).forca.x = 0;
          magnet.get(i).forca.y = 0;
          magnet.get(j).forca.x = 0;
          magnet.get(j).forca.y = 0;
        } else
        {
          magnet.get(i).forca.x += totalF*cos(ang);
          magnet.get(i).forca.y += totalF*sin(ang);
          magnet.get(j).forca.x -= totalF*cos(ang);
          magnet.get(j).forca.y -= totalF*sin(ang);
        }
      }
    }
  }

  /// CONSIDERANDO BORDA
  for (Magnet m : magnet)
  {
    for (float a=0; a<TWO_PI; a+=0.01)
    {
      PVector borda = new PVector(raioBorda*cos(a), raioBorda*sin(a));
      float cargaBorda = 10/(TWO_PI/0.01);
      // F = (k*q1*q2) / d^2
      // F = m*a
      // a = F/m

      float d = dist(m.pos.x, m.pos.y, borda.x, borda.y);
      float ang = atan2(borda.y-m.pos.y, borda.x-m.pos.x);
      float totalF = abs(k * m.carga * cargaBorda) / pow(d, 2);

      // co/h = sin(a);
      // ca/h = cos(a);
      // y = co = h*sin(a);
      // x = ca = h*cos(a);

      /*if (m.carga > 0)
      {*/
        m.forca.x -= totalF*cos(ang);
        m.forca.y -= totalF*sin(ang);
      /*} else
      {
        m.forca.x += totalF*cos(ang);
        m.forca.y += totalF*sin(ang);
        
        if (d < 20)
        {
          m.pos.x = (raioBorda - m.massa/4 - 5) * cos(-ang);
          m.pos.y = (raioBorda - m.massa/4 - 5) * sin(-ang);
          m.forca.x = 0;
          m.forca.y = 0;
        }
      }*/
    }
  }

  for (int i=magnet.size()-1; i>=0; i--)
  {
    if (sqrt(pow(magnet.get(i).pos.x, 2) + pow(magnet.get(i).pos.y, 2)) > raioBorda)
    {
      magnet.remove(i);
    }
  }

  for (Magnet m : magnet)
  {
    m.update();
    m.show();
  }

  clickCont++;

  println(magnet.size() + " imã" + (magnet.size()>1 ? "s" : "") + " no recipiente");
}

int sinal(float value)
{
  return (value == abs(value)) ? 1 : -1;
}

void mouseClicked()
{
  if (clickCont>10)
  {
    clickCont = 0;

    if (mouseButton == LEFT)
    {
      magnet.add(new Magnet(mouseX-width/2, mouseY-height/2, 1));
    } else if (mouseButton == RIGHT)
    {
      magnet.add(new Magnet(mouseX-width/2, mouseY-height/2, -1));
    } else
    {
      // SCROLL CLICK
      for (int i=magnet.size()-1; i>=0; i--)
      {
        if (dist(mouseX-width/2, mouseY-height/2, magnet.get(i).pos.x, magnet.get(i).pos.y) < magnet.get(i).massa/4)
        {
          magnet.remove(i);
        }
      }
    }
  }
}