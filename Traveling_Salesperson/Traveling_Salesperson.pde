PVector[] pontos = new PVector[4];
ArrayList<int[]> caminhos = new ArrayList<int[]>();
int[] way;

void setup()
{
  size(800, 800);

  RandomPontos();
}

void draw()
{
  background(0);

  fill(255);
  stroke(255);

  for (int i=0; i<pontos.length; i++)
  {
    ellipse(pontos[i].x, pontos[i].y, 10, 10);
  }

  Run();

  for (int[] c : caminhos)
  {
    for (int p=0; p<pontos.length; p++)
    {
      print(c[0]+", ");
    }
    println();
  }

  //noLoop();
}

void RandomPontos()
{
  for (int i=0; i<pontos.length; i++)
  {
    pontos[i] = new PVector(random(width), random(height));
  }
}

void Run()
{
  way = new int[pontos.length];

  for (int w : way)
  {
    w = -1;
  }

  SorteioComRandom(0);

  for (int w=0; w<way.length-1; w++)
  {
    line(pontos[way[w]].x, pontos[way[w]].y, pontos[way[w+1]].x, pontos[way[w+1]].y);
  }

  //SortearUmPonto(0);
}

void SorteioComRandom(int indice)
{
  int num = indice;
  boolean valido = false;

  while (!valido)
  {
    num = (int)random(pontos.length);

    valido = true;

    for (int w : way)
    {
      if (w == num)
      {
        valido = false;
      }
    }
  }

  way[indice] = num;

  if (indice+1 < way.length)
  {
    SorteioComRandom(indice+1);
  }
}

void SortearUmPonto(int wayIndex)
{
  for (int i=0; i<pontos.length; i++)
  {
    boolean valido = true;

    for (int w=0; w<wayIndex; w++)
    {
      if (way[w] == i)
      {
        valido = false;
      }
    }

    if (valido)
    {
      way[wayIndex] = i;
      wayIndex++;

      if (wayIndex < way.length)
      {
        SortearUmPonto(wayIndex);
      } else
      {
        println("-------------");

        for (int w=0; w<way.length; w++)
        {
          //line(pontos[way[w]].x, pontos[way[w]].y, pontos[way[w+1]].x, pontos[way[w+1]].y);
          println(way[w]);
        }

        caminhos.add(way);
      }
    }
  }
}

void keyPressed()
{
  // 116 --> Codigo para F5
  if (keyCode == 116)
  {
    RandomPontos();
  }
}