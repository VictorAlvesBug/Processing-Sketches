class Bloco
{
  PVector pos, index;
  int tipo, size = 20;
  boolean visible, moving = false;

  Bloco(int x, int y, int t)
  {
    this.index = new PVector(x, y);
    this.tipo = t;

    switch(this.tipo)
    {
    case 0:
      this.pos = new PVector(35+x*size, 475+y*size);
      this.visible = false;
      break;

    case 1:
      this.pos = new PVector(185+x*size, 475+y*size);
      this.visible = false;
      break;

    case 2:
      this.pos = new PVector(335+x*size, 475+y*size);
      this.visible = false;
      break;

    case 3: // MESA
      this.size = 50;
      this.pos = new PVector(50+x*size, 50+y*size);
      this.visible = false;
      break;

    case 4: // BASE
      this.size = 50;
      this.pos = new PVector(50+x*size, 50+y*size);
      this.visible = true;
      break;
    }
  }

  void update()
  {
    switch(this.tipo)
    {
    case 0:
      this.pos = new PVector(opcaoPos[tipo].x+index.x*size, opcaoPos[tipo].y+index.y*size);
      break;

    case 1:
      this.pos = new PVector(opcaoPos[tipo].x+index.x*size, opcaoPos[tipo].y+index.y*size);
      break;

    case 2:
      this.pos = new PVector(opcaoPos[tipo].x+index.x*size, opcaoPos[tipo].y+index.y*size);
      break;
    }
  }

  void draw()
  {
    if (this.visible)
    {
      switch(this.tipo)
      {
      case 0:
      case 1:
      case 2:
        if (moving)
        {
          size = 50;
          opcaoPos[tipo] = new PVector(mouseX - 125, mouseY - 125);
        } else
        {
          int coluna=0, linha=0;

          for (int col=0; col<7; col++)
          {
            if (mesa[col][0].pos.y-25 > opcaoPos[tipo].y-5)
            {
              coluna = col;
              return;
            }
          }
          
          for (int row=0; row<7; row++)
          {
            if (mesa[0][row].pos.x-25 > opcaoPos[tipo].x-5)
            {
              linha = row;
              return;
            }
          }

          boolean valido = true;

          for (int row=0; row<5; row++)
          {
            for (int col=0; col<5; col++)
            {
              if ((coluna+col<8 && linha+row<8) || !opcao[tipo][col][row].visible)
              {
                if (mesa[coluna+col][linha+row].visible && opcao[tipo][col][row].visible)
                {
                  valido = false;
                }
              }
            }
          }

          if (valido && opcaoPos[tipo].x != 35 + 150*tipo && opcaoPos[tipo].y != 475)
          {
            for (int row=0; row<5; row++)
            {
              for (int col=0; col<5; col++)
              {
                if(opcao[tipo][col][row].visible)
                {
                  mesa[coluna+col][linha+row].visible = true;
                }

                opcao[tipo][col][row].visible = false;
              }
            }
          } else
          {
            size = 20;
            opcaoPos[tipo] = new PVector(35 + 150*tipo, 475);
          }
        }

        this.update();

        fill(255, 128, 0);
        break;

      case 3: // MESA
        fill(255, 128, 0);
        break;

      case 4: // BASE
        fill(64, 32, 0);
        break;
      }

      rect(pos.x, pos.y, size, size);
    }
  }
}