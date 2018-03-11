class Bloco
{
  int col, row;
  PVector pos;
  int value;

  Bloco(int coluna, int linha)
  {
    this.pos = new PVector(50+50*coluna, 50+50*linha);
    this.col = coluna;
    this.row = linha;
    this.value = (int)pow(2,(int)random(1, maxValue));
  }

  void click()
  {
    int valor = this.value;
    if(this.findSimilarNeighbors())
    {
      this.value = valor*4;
    }
    else
    {
      this.value = valor;
    }
  }

  boolean findSimilarNeighbors()
  {
    int valor = this.value;
    boolean thereAreSomeNeighbors = false;
    this.value*=2;

    if (col>0)
    {
      if (valor == bloco[col-1][row].value)
      {
        bloco[col-1][row].findSimilarNeighbors();
        thereAreSomeNeighbors = true;
      }
    }

    if (col<blocoQtde-1)
    {
      if (valor == bloco[col+1][row].value)
      {
        bloco[col+1][row].findSimilarNeighbors();
        thereAreSomeNeighbors = true;
      }
    }

    if (row>0)
    {
      if (valor == bloco[col][row-1].value)
      {
        bloco[col][row-1].findSimilarNeighbors();
        thereAreSomeNeighbors = true;
      }
    }

    if (row<blocoQtde-1)
    {
      if (valor == bloco[col][row+1].value)
      {
        bloco[col][row+1].findSimilarNeighbors();
        thereAreSomeNeighbors = true;
      }
    }
    
    return thereAreSomeNeighbors;
  }

  void update()
  {
    if (this.value == 0)
    {
      this.value = (int)pow(2,(int)random(1, maxValue));
    }
  }

  void draw()
  {
    noStroke();
    fill(map(this.value%30, 1, 48, 0, 360), 255, 200);
    ellipse(this.pos.x, this.pos.y, size, size);
    fill(255);
    textSize(25);
    text(this.value, this.pos.x-(8), this.pos.y+9);
  }
}