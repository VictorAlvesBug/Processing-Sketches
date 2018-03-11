Bloco[][] mesa = new Bloco[8][8];
Bloco[][] base = new Bloco[8][8];
Bloco[][][] opcao = new Bloco[3][5][5];
PVector blocoPos = new PVector(2, 2);
PVector[] opcaoPos = new PVector[3];

public void setup()
{
  size(450, 600);
  rectMode(CENTER);

  fill(255, 128, 0);
  strokeWeight(2);

  for (int row=0; row<8; row++)
  {
    for (int col=0; col<8; col++)
    {
      mesa[col][row] = new Bloco(col, row, 3);
      base[col][row] = new Bloco(col, row, 4);
    }
  }

  for (int i=0; i<3; i++)
  {
    opcaoPos[i] = new PVector(35 + 150*i, 475);
  }

  for (int row=0; row<5; row++)
  {
    for (int col=0; col<5; col++)
    {
      for (int k=0; k<3; k++)
      {
        opcao[k][col][row] = new Bloco(col, row, k);
      }
    }
  }

  gerarForma();
}

public void draw()
{
  background(0);

  strokeWeight(2);

  for (int row=0; row<8; row++)
  {
    for (int col=0; col<8; col++)
    {
      base[col][row].draw();
      mesa[col][row].draw();
    }
  }

  strokeWeight(1);

  for (int row=0; row<5; row++)
  {
    for (int col=0; col<5; col++)
    {
      for (int k=0; k<3; k++)
      {
        opcao[k][col][row].draw();
      }
    }
  }
}

void gerarForma()
{
  for (int k=0; k<3; k++)
  {
    gerarBloco(k, (int)random(1, 5));

    centralizarOpcao(k);
    centralizarOpcao(k);
  }
}

void gerarBloco(int index, int qtde)
{
  if (qtde >= 0)
  {
    opcao[index][(int)blocoPos.x][(int)blocoPos.y].visible = true;

    boolean valido = false;

    while (!valido)
    {
      int num = (int)random(4);

      switch(num)
      {
      case 0:
        if (blocoPos.x-1 >= 0)
        {
          if (!opcao[index][(int)blocoPos.x-1][(int)blocoPos.y].visible)
          {
            blocoPos.x--;
            valido = true;
          }
        }
        break;

      case 1:
        if (blocoPos.x+1 < 5)
        {
          if (!opcao[index][(int)blocoPos.x+1][(int)blocoPos.y].visible)
          {
            blocoPos.x++;
            valido = true;
          }
        }
        break;

      case 2:
        if (blocoPos.y-1 >= 0)
        {
          if (!opcao[index][(int)blocoPos.x][(int)blocoPos.y-1].visible)
          {
            blocoPos.y--;
            valido = true;
          }
        }
        break;

      case 3:
        if (blocoPos.y+1 < 5)
        {
          if (!opcao[index][(int)blocoPos.x][(int)blocoPos.y+1].visible)
          {
            blocoPos.y++;
            valido = true;
          }
        }
        break;
      }
    }

    gerarBloco(index, qtde-1);
  }
}

void centralizarOpcao(int index)
{
  int up = 0, down = 0, left = 0, right = 0;

  for (int i=0; i<5; i++)
  {
    if (!opcao[index][i][1].visible)
    {
      up++;
    }

    if (!opcao[index][i][3].visible)
    {
      down++;
    }

    if (!opcao[index][1][i].visible)
    {
      left++;
    }

    if (!opcao[index][3][i].visible)
    {
      right++;
    }
  }

  if (up == 5 && down<5)
  {
    for (int row=0; row<4; row++)
    {
      for (int col=0; col<5; col++)
      {
        opcao[index][col][row].visible = opcao[index][col][row+1].visible;
      }
    }

    for (int i=0; i<5; i++)
    {
      opcao[index][i][4].visible = false;
    }
  } else if (down == 5 && up<5)
  {
    for (int row=4; row>0; row--)
    {
      for (int col=0; col<5; col++)
      {
        opcao[index][col][row].visible = opcao[index][col][row-1].visible;
      }
    }

    for (int i=0; i<5; i++)
    {
      opcao[index][i][0].visible = false;
    }
  }

  if (left == 5 && right<5)
  {
    for (int row=0; row<5; row++)
    {
      for (int col=0; col<4; col++)
      {
        opcao[index][col][row].visible = opcao[index][col+1][row].visible;
      }
    }

    for (int i=0; i<5; i++)
    {
      opcao[index][4][i].visible = false;
    }
  } else if (right == 5 && left<5)
  {
    for (int row=0; row<5; row++)
    {
      for (int col=4; col>0; col--)
      {
        opcao[index][col][row].visible = opcao[index][col-1][row].visible;
      }
    }

    for (int i=0; i<5; i++)
    {
      opcao[index][0][i].visible = false;
    }
  }
}

void mousePressed()
{
  for (int k=0; k<3; k++)
  {
    if (dist(opcaoPos[k].x + 50, opcaoPos[k].y + 50, mouseX, mouseY)<sqrt(2*pow(50, 2)))
    {
      for (int row=0; row<5; row++)
      {
        for (int col=0; col<5; col++)
        {
          opcao[k][col][row].moving = true;
        }
      }
    }
  }
}

/*void mouseDragged() 
 {
 if(locked) 
 {
 bx = mouseX-xOffset; 
 by = mouseY-yOffset; 
 }
 }*/

void mouseReleased() 
{
  for (int row=0; row<5; row++)
  {
    for (int col=0; col<5; col++)
    {
      for (int k=0; k<3; k++)
      {
        opcao[k][col][row].moving = false;
      }
    }
  }
}