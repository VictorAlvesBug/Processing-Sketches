class Bloco
{
  PVector pos;
  int col, row, value;

  Bloco(int coluna, int linha)
  {
    this.pos = new PVector(10+coluna*110, 10+linha*110);
    this.col = coluna;
    this.row = linha;
  }

  void update()
  {
  }

  void draw()
  {
    if (this.value != 0)
    {
      fill(map(this.value%64, 0, 48, 0, 360), 255, 200);
      rect(pos.x, pos.y, 100, 100, 10);
      fill(255);
      textSize(36);
      textAlign(CENTER);
      text(this.value, pos.x+50, pos.y+60);
    }
    else
    {
      fill(200);
      rect(pos.x, pos.y, 100, 100, 10);
    }
  }
}