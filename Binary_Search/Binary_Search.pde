int maxGeracao = 6;
Node[][] node = new Node[(int)pow(2, 5)][5];

void setup()
{
  size(1200, 800);
}

void draw()
{
  background(0);
  translate(width/2, 0);

  DrawTree(6, 0, 100);
}

void DrawTree(int geracoes, int posX, int posY)
{
  fill(255);
  stroke(255);
  ellipse(posX, posY, 10+geracoes*10, 10+geracoes*10);

  if (geracoes>0)
  {
    int desvioPosX = width/(int)(2*pow(2, (7-geracoes)));

    stroke(255);
    line(posX, posY, posX-desvioPosX, posY + 100);
    line(posX, posY, posX+desvioPosX, posY + 100);

    DrawTree(geracoes-1, posX-desvioPosX, posY + 100);
    DrawTree(geracoes-1, posX+desvioPosX, posY + 100);
  }

  textAlign(CENTER);
  textSize(10+geracoes*10);
  fill(0, 0, 255);
  text((int)random(10), posX, posY+5+geracoes*3);
}

void addNum(int num)
{
  for (int geracao=0; geracao<maxGeracao; geracao++)
  {
    for (int indice=0; indice<pow(2, geracao); indice++)
    {
      if (node[indice][geracao].isNull())
      {
        geracao++;
      }
    }
  }
}

void keyPressed()
{
  if (key >= '0' && key <= '9')
  {
    addNum((int)key);
  }
}