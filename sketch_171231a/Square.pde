class Square
{
  int col, row;
  PVector posicao, cor;
  boolean revelado = false;
  
  Square(int col, int row, float corR,  float corG,  float corB)
  {
    this.col = col;
    this.row = row;
    this.posicao = new PVector(col*10, row*10);
    this.cor = new PVector(corR, corG, corB);
  }
  
  void update()
  {
    this.revelado = true;
    this.draw();
    
    if(col>0 && !square[col-1][row].revelado)
    {
      square[col-1][row].update();
    }
    
    if(col<99 && !square[col+1][row].revelado)
    {
      square[col+1][row].update();
    }
    
    if(row>0 && !square[col][row-1].revelado)
    {
      square[col][row-1].update();
    }
    
    if(row<99 && !square[col][row+1].revelado)
    {
      square[col][row+1].update();
    }
  }
  
  void draw()
  {
    if(this.revelado)
    {
      noStroke();
      fill(cor.x, cor.y, cor.z);
    }
    else
    {
      stroke(64);
      noFill();
    }
    
    rect(this.posicao.x, this.posicao.y, 10, 10);
  }
}