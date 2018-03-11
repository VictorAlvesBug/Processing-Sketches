ArrayList<Magnet> magnet;
float k = 9*pow(10, 9); // k = 9*pow(10, 9)
float raioBorda = 370;
float clickCont = 0;
boolean tools = false;
int toolsIndex = 0;

void setup()
{
  size(800, 800);

  magnet = new ArrayList<Magnet>();
}

void draw()
{
  background(0);

  strokeWeight(3);

  /*for (Magnet m : magnet)
   {
   m.forca.x = 0;
   m.forca.y = 0;
   }*/

  /*for (int i=0; i<magnet.size(); i++)
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
   }*/

  //DrawMagneticField();
  DrawResultant(mouseX, mouseY);

  for (Magnet m : magnet)
  {
    m.update();
    m.show();
  }

  clickCont++;

  println(magnet.size() + " imã" + (magnet.size()>1 ? "s" : "") + " no recipiente");
}

void DrawMagneticField()
{
  for (int i=0; i<=width; i+=50)
  {
    for (int j=0; j<=height; j+=50)
    {
      DrawResultant(i, j);
    }
  }
}

void DrawResultant(int i, int j)
{
  float forcaTotal = 0;
  PVector forca = new PVector(0, 0);
  float ang;

  for (Magnet m : magnet)
  {
    float d = dist(m.pos.x, m.pos.y, i, j);
    // 100 --> 0.002
    d /= 50000;
    m.cargaReal = m.carga*pow(10, -19);
    float f = k*m.cargaReal/pow(d, 2);

    if (m.cargaReal > 0)
    {
      forcaTotal -= f;
    } else
    {
      forcaTotal += f;
    }

    ang = atan2(m.pos.y-j, m.pos.x-i);
    forca.x += f*cos(ang);
    forca.y += f*sin(ang);
  }

  forca.x = map(forca.x, -forcaTotal, forcaTotal, -30, 30);
  forca.y = map(forca.y, -forcaTotal, forcaTotal, -30, 30);
  //forca.x = map(forca.x, 0, forcaTotal, 0, 20);
  //forca.y = map(forca.y, 0, forcaTotal, 0, 20);
  //forca.x /= 20;
  //forca.y /= 20;
  //forca.x /= 50000;
  //forca.y /= 50000;

  forcaTotal = dist(0, 0, forca.x, forca.y);

  stroke(255);
  ang = atan2(forca.y, forca.x);
  line(i, j, i+forca.x, j+forca.y);
  line(i+forca.x, j+forca.y, i+0.9*forcaTotal*cos(ang-PI/24), j+0.9*forcaTotal*sin(ang-PI/24));
  line(i+forca.x, j+forca.y, i+0.9*forcaTotal*cos(ang+PI/24), j+0.9*forcaTotal*sin(ang+PI/24));
}

int sinal(float value)
{
  return (value == abs(value)) ? 1 : -1;
}

void mouseMoved()
{
  tools = false;
  /// HOVER
  for (int i=0; i<magnet.size(); i++)
  {
    if (dist(mouseX, mouseY, magnet.get(i).pos.x, magnet.get(i).pos.y) < magnet.get(i).massa/2)
    {
      magnet.get(i).mode = "Tools";
      tools = true;
      toolsIndex = i;
    } else
    {
      magnet.get(i).mode = "Default";
    }
  }
}

void mouseClicked()
{
  if (clickCont>10)
  {
    clickCont = 0;

    if (tools)
    {
      if (mouseButton == LEFT)
      {
        if (mouseY < magnet.get(toolsIndex).pos.y)
        {
          magnet.get(toolsIndex).carga += 1;
        } else
        {
          magnet.get(toolsIndex).carga -= 1;
        }
      } else
      {
        // SCROLL CLICK
        for (int i=magnet.size()-1; i>=0; i--)
        {
          if (dist(mouseX, mouseY, magnet.get(i).pos.x, magnet.get(i).pos.y) < magnet.get(i).massa/4)
          {
            magnet.remove(i);
          }
        }
      }
    } else
    {
      if (mouseButton == LEFT)
      {
        magnet.add(new Magnet(mouseX, mouseY, 3));
      } else if (mouseButton == RIGHT)
      {
        magnet.add(new Magnet(mouseX, mouseY, -3));
      } else
      {
        // SCROLL CLICK
        for (int i=magnet.size()-1; i>=0; i--)
        {
          if (dist(mouseX, mouseY, magnet.get(i).pos.x, magnet.get(i).pos.y) < magnet.get(i).massa/4)
          {
            magnet.remove(i);
          }
        }
      }
    }
  }
}