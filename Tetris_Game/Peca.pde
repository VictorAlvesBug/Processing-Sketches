class Peca
{
  boolean[][] regiao = new boolean[4][4];
  String nome; // (L, J, S, Z, T, I, O)
  int orientacao = 0;
  PVector cor;

  Peca(int num)
  {
    switch(num)
    {
    case 0:
      this.nome = "L";
      break;

    case 1:
      this.nome = "J";
      break;

    case 2:
      this.nome = "S";
      break;

    case 3:
      this.nome = "Z";
      break;

    case 4:
      this.nome = "T";
      break;

    case 5:
      this.nome = "I";
      break;

    case 6:
      this.nome = "O";
      break;
    }
    String regiaoArray = "";

    switch (this.nome)
    {
    case "L":
      cor = new PVector(255, 128, 0);
      regiaoArray = 
        "0000" +
        "0100" +
        "0100" +
        "0110";
      break;

    case "J":
      cor = new PVector(0, 0, 128);
      regiaoArray = 
        "0000" +
        "0010" +
        "0010" +
        "0110";
      break;

    case "S":
      cor = new PVector(0, 255, 0);
      regiaoArray = 
        "0000" +
        "0000" +
        "0110" +
        "1100";
      break;

    case "Z":
      cor = new PVector(255, 0, 0);
      regiaoArray = 
        "0000" +
        "0000" +
        "1100" +
        "0110";
      break;

    case "T":
      cor = new PVector(138, 43, 226);
      regiaoArray = 
        "0000" +
        "0000" +
        "0100" +
        "1110";
      break;

    case "I":
      cor = new PVector(0, 0, 255);
      regiaoArray = 
        "0100" +
        "0100" +
        "0100" +
        "0100";
      break;

    case "O":
      cor = new PVector(255, 255, 0);
      regiaoArray = 
        "0000" +
        "0000" +
        "0110" +
        "0110";
      break;
    }

    for (int j=0; j<4; j++)
    {
      for (int i=0; i<4; i++)
      {
        regiao[i][j] = (regiaoArray.charAt(4*j + i) == '1');
      }
    }
  }

  // 00 10 20 30
  // 01 11 21 31
  // 02 12 22 32   -.  
  // 03 13 23 33     \
  //                  )  GIRO 90° SENTIDO HORÁRIO
  // 03 02 01 00     /
  // 13 12 11 10  <-'  
  // 23 22 21 20
  // 33 32 31 30

  // 00 10 20 30   01 11 21 31   02 12 22 32   03 13 23 33
  // 03 02 01 00   13 12 11 10   23 22 21 20   33 32 31 30

  void girar()
  {
    boolean[][] aux = new boolean[4][4];
    for (int j=0; j<4; j++)
    {
      for (int i=0; i<4; i++)
      {
        aux[i][j] = regiao[i][j];
      }
    }

    for (int j=0; j<4; j++)
    {
      for (int i=0; i<4; i++)
      {
        regiao[i][j] = false;

        if (aux[j][3-i])
        {
          regiao[i][j] = true;
        } else
        {
          regiao[i][j] = false;
        }
        //regiao[i][j] = aux[j][3-i];
      }
    }
  }

  void congelar()
  {
    for (int j=0; j<4; j++)
    {
      for (int i=0; i<4; i++)
      {
        if (regiao[i][j])
        {
          bloco[(int)pos.x + i][(int)pos.y + j].Status = "Static";

          /*if (pos.y + j - 1 >= 0)
           {
           if (bloco[(int)pos.x + i][(int)pos.y + j - 1].Peca == "Static")
           {
           descivel = false;
           }
           }*/
        }
      }
    }
  }

  boolean draw(PVector pos)
  {
    boolean descivel = true;

    for (int j=0; j<4; j++)
    {
      for (int i=3; i>=0; i--)
      {
        if (regiao[i][j])
        {
          bloco[(int)pos.x + i][(int)pos.y + j].draw(cor);

          /*if (pos.y + j - 1 >= 0)
           {
           if (bloco[(int)pos.x + i][(int)pos.y + j - 1].Peca == "Static")
           {
           descivel = false;
           }
           }*/
          descivel = false;
        }
      }
    }

    return descivel;
  }
}