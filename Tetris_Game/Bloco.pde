class Bloco
{
  int col, row;
  PVector pos;
  String Status; // (Peca, None, Static)
  
  Bloco(int coluna, int linha)
  {
    this.col = coluna;
    this.row = linha;
    this.pos = new PVector(coluna*size, -4*size + linha*size);
  }
  
  void draw(PVector cor)
  {
    noStroke();
    
    fill(cor.x, cor.y, cor.z);
    triangle(this.pos.x, this.pos.y, this.pos.x, this.pos.y+size, this.pos.x+size, this.pos.y);
    
    fill(cor.x*0.5, cor.y*0.5, cor.z*0.5);
    triangle(this.pos.x, this.pos.y+size, this.pos.x+size, this.pos.y, this.pos.x+size, this.pos.y+size);
    
    fill(cor.x*0.7, cor.y*0.7, cor.z*0.7);
    rect(this.pos.x+7, this.pos.y+7, size-14, size-14);
  }
}