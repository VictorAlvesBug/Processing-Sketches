class Hexagon
{
  char[] status = {'0', '0', '0', '0', '0', '0'};
  float raio = 1000;
  int camada, indice;

  Hexagon(int indice_)
  {
    indice = indice_;

    for (int i=0; i<3; i++)
    {
      status[(int)random(6)] = '1';
    }
  }

  void update()
  {
    if (indice == 0)
    {
      if (raio>20)
      {
        raio -= 5;
      } else
      {
        for (int slice=0; slice<6; slice++)
        {
          if (status[slice] == '1')
          {
            grid[0][slice] = '1';
          }
        }

        camada = 0;
        hexagon.add(new Hexagon(indice+1));
        index++;
      }
    } else
    {
      for (int layer=19; layer>0; layer--)
      {
        boolean limitLayer = false;

        for (int slice=0; slice<6; slice++)
        {
          if (grid[layer-1][slice] == '1' &&
            status[slice] == '1')
          {
            limitLayer = true;
          }
        }

        if (limitLayer)
        {
          camada = layer;
          return;
        }
      }

      //camada = hexagon.get(indice-1).camada;

      if (raio>20+camada*20)
      {
        raio -= 5;
      } else
      {
        hexagon.add(new Hexagon(indice+1));
        index++;
      }
    }
  }

  void draw()
  {
    noStroke();
    fill(0, 92, 0);

    for (int i=0; i<6; i++)
    {
      if (status[i] == '1')
      {
        pushMatrix();
        rotate(map(i, 0, 6, 0, TWO_PI));
        beginShape();

        vertex((raio+20)*cos(0), (raio+20)*sin(0));
        vertex((raio+20)*cos(TWO_PI/6), (raio+20)*sin(TWO_PI/6));
        vertex(raio*cos(TWO_PI/6), raio*sin(TWO_PI/6));
        vertex(raio*cos(0), raio*sin(0));

        endShape();
        popMatrix();
      }
    }
  }
}