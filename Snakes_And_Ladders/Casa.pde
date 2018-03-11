class Casa
{
  PVector pos, index;
  int num;

  Casa(int col, int row)
  {
    this.index = new PVector(col, row);
    this.pos = new PVector(col*70, row*70);

    if ((maxRows - row)%2 == 1)
    {
      this.num = (maxRows-1 - row)*maxCols + col;
    }
    else
    {
      this.num = (maxRows-1 - row)*maxCols + (maxCols-1-col);
    }
  }
  
  void show()
  {
    rect(pos.x, pos.y, 70, 70);
  }
}