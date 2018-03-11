class Circle
{
  PVector pos;
  int col, row;
  float size = 50;
  float distanciaH = size/2, direcao = -1;
  float distanciaV;

  Circle(int coluna, int linha)
  {
    this.col = coluna-20;
    this.row = linha-20;
  }

  void update()
  {
    this.distanciaH += this.direcao*0.1*this.size/20;

    if (this.distanciaH<9*size/20 || this.distanciaH>size/2)
    {
      this.direcao *= -1;
    }

    /*if (this.distanciaH<this.size/2 || this.distanciaH>this.size)
     {
     this.direcao *= -1;
     }*/

    // ALTURA DO TRIANGULO EQUILATERO
    // h = l*sqrt(3)/2
    this.distanciaV = this.distanciaH*(sqrt(3)/2);

    this.pos = new PVector(this.col*this.distanciaH-(this.row%2)*(this.distanciaH/2), this.row*this.distanciaV);
  }

  void draw()
  {
    pushMatrix();
    //translate(pos.x, pos.y);

    /////////////////////////ellipse(pos.x, pos.y, size, size);

    for (float row = pos.y - size/2; row <= pos.y + size/2; row++)
    {
      // a² = b² + c²
      // pow(size/2, 2) = pow(row, 2) + pow(col, 2);
      // pow(col, 2) = pow(size/2, 2) - pow(row, 2);
      // col = sqrt(pow(size/2, 2) - pow(row, 2));

      float colLimite = abs(sqrt(pow(size/2, 2) - pow(row-pos.y, 2)));

      for (float col=pos.x-colLimite; col<=pos.x+colLimite; col++)
      {
        if (col<0)
        {
          col = 0;
        } else if (col>=width)
        {
          col = width - 1;
        }

        if (row<0)
        {
          row = 0;
        } else if (row>=height)
        {
          row = height - 1;
        }

        //ponto[(int)(pos.x + col)][(int)(pos.y + row)]++;/// ERRO !!!
        ponto[(int)(col)][(int)(row)]++;/// ERRO !!!
      }
    }

    popMatrix();
  }
}