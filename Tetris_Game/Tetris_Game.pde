Bloco[][] bloco = new Bloco[10][24];
int size = 40;
PVector pos = new PVector(3, 5);
float tempo = 0;

Peca peca;

void setup()
{
  size(600, 800);

  for (int row=0; row<24; row++)
  {
    for (int col=0; col<10; col++)
    {
      bloco[col][row] = new Bloco(col, row);
      bloco[col][row].Status = "None";
    }
  }

  peca = new Peca((int)random(7));
}

void draw()
{
  background(0);

  for (int row=0; row<24; row++)
  {
    for (int col=0; col<10; col++)
    {
      if (bloco[col][row].Status == "Static")
      {
        bloco[col][row].draw(new PVector(200, 200, 200));
      } else
      {
        bloco[col][row].draw(new PVector(300, 300, 300));
      }
    }
  }

  if (peca.draw(new PVector(pos.x, pos.y)))
  {
    peca.congelar();
    peca = new Peca((int)random(7));
  }

  //pos.y++;

  float incremento = 0.035;
  tempo += incremento;
  println(tempo);
  if (tempo%2 < incremento)
  {
    pos.y++;
    tempo = 0;
  }
  //delay(1000);
}

void keyPressed() 
{
  if (key == CODED) 
  {
    switch(keyCode)
    {
    case UP: 
      peca.girar();
      break;

    case DOWN:
      break;

    case LEFT:
      pos.x-=1;
      break;

    case RIGHT:
      pos.x+=1;
      break;
    }

    //Atualizar();
  }
}

void Atualizar()
{
  background(0);

  for (int row=0; row<24; row++)
  {
    for (int col=0; col<10; col++)
    {
      if (bloco[col][row].Status == "Static")
      {
        bloco[col][row].draw(new PVector(200, 200, 200));
      } else
      {
        bloco[col][row].draw(new PVector(300, 300, 300));
      }
    }
  }

  peca.draw(new PVector(pos.x, pos.y));
}