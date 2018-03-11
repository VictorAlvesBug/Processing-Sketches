ArrayList<PVector> inicio = new ArrayList<PVector>();
PVector[] meio = new PVector[3], coloracao;
ArrayList<PVector> fim = new ArrayList<PVector>();
Linha[][] linha;
int raio = 100, contador=0, numLados;

void setup()
{
  size(800, 800);
  translate(width/2, height/2);

  numLados = 3;

  meio = new PVector[numLados];

  DrawShape(numLados);

  DefineLinhas();
}

void draw()
{
  background(0);
  frameRate(1000);
  translate(width/2, height/2);
  //rotate(TWO_PI/4);
  
  stroke(32, 0, 64);
  for (float i=0; i<TWO_PI; i += TWO_PI/numLados/2)
  {
    line(raio*cos(i), raio*sin(i), raio*cos(i+TWO_PI/numLados/2), raio*sin(i+TWO_PI/numLados/2));
  }
  
  strokeWeight(3);
  for (int i=0; i<numLados; i++)
  {
    for (int j=0; j<inicio.size(); j++)
    {
      float a = linha[i][j].percent;
      stroke(a*128, a*0, a*255);
      linha[i][j].showPoints();
    }
  }

  for (int i=0; i<numLados; i++)
  {
      stroke(64, 0, 128);
      linha[i][contador%inicio.size()].showLine();
  }

  contador+=1;

  //fill(0);

  /*for (int i=0; i<fim.size(); i++)
  {
    point(fim.get(i).x, fim.get(i).y);
  }*/
}

void DefineLinhas()
{
  linha = new Linha[numLados][inicio.size()];

  for (int i=0; i<numLados; i++)
  {
    for (int j=0; j<inicio.size(); j++)
    {
      PVector p1 = inicio.get(j);
      PVector p2, p3;
      p2 = meio[i];

      float angulo = atan2(p2.y-p1.y, p2.x-p1.x);

      p3 = new PVector(p1.x+2*raio*cos(angulo), p1.y+2*raio*sin(angulo));
      
      linha[i][j] = new Linha(i, j, p1, p3);
    }
  }
}

void DrawLine(float lados)
{
  PVector p1 = inicio.get(contador%inicio.size());
  PVector p2, p3 = new PVector(0, 0);

  for (int i=0; i<lados; i++)
  {
    p2 = meio[i];

    float angulo = atan2(p2.y-p1.y, p2.x-p1.x);

    p3 = new PVector(p1.x+2*raio*cos(angulo), p1.y+2*raio*sin(angulo));
    line(p1.x, p1.y, p3.x, p3.y);
  }

  for (int i=0; i<fim.size(); i++)
  {
    point(fim.get(i).x, fim.get(i).y);
  }
}

void DefineFim(float lados)
{
  for (int i=0; i<lados; i++)
  {
    for (PVector inic : inicio)
    {
      PVector p1 = inic;
      PVector p2, p3;

      p2 = meio[i];

      float angulo = atan2(p2.y-p1.y, p2.x-p1.x);

      p3 = new PVector(p1.x+2*raio*cos(angulo), p1.y+2*raio*sin(angulo));
      fim.add(p3);
      //line(p1.x, p1.y, p3.x, p3.y);
    }
  }
}

void DrawShape(float lados)
{
  strokeWeight(1);
  stroke(64, 0, 128);
  int cont=0;
  for (float i=0; i<TWO_PI; i += TWO_PI/lados/2)
  {
    line(raio*cos(i), raio*sin(i), raio*cos(i+TWO_PI/lados/2), raio*sin(i+TWO_PI/lados/2));

    if (cont%2 == 1)
    {
      meio[(cont-1)/2] = new PVector(raio*cos(i), raio*sin(i));
    }

    cont++;
  }

  strokeWeight(2);
  stroke(128, 0, 255);
  for (float i=0; i<TWO_PI; i += TWO_PI/lados)
  {
    Line(0, raio*cos(i), raio*sin(i), raio*cos(i+TWO_PI/lados), raio*sin(i+TWO_PI/lados));
  }
}

void Line(int hole, float x1, float y1, float x2, float y2)
{
  line(x1, y1, x2, y2);

  for (float i=0; i<200; i++)
  {
    float x = map(i, 0, 200, x1, x2);
    float y = map(i, 0, 200, y1, y2);

    if (hole == 0)
    {
      inicio.add(new PVector(x, y));
    }
  }
}