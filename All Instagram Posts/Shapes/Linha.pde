class Linha
{
  PVector index, inicio, fim;
  float percent = 0;
  
  Linha(int x, int y, PVector i, PVector f)
  {
    this.index = new PVector(x, y);
    this.inicio = i;
    this.fim = f;
  }
  
  void showLine()
  {
    this.percent = 1;
    line(this.inicio.x, this.inicio.y, this.fim.x, this.fim.y);
  }
  
  void showPoints()
  {
    this.percent -= 0.0015;
    PVector pi = linha[(int)this.index.x][(int)(this.index.y+1)%linha[0].length].inicio;
    PVector pf = linha[(int)this.index.x][(int)(this.index.y+1)%linha[0].length].fim;
    
    line(this.inicio.x, this.inicio.y, pi.x, pi.y);
    line(this.fim.x, this.fim.y, pf.x, pf.y);
  }
}