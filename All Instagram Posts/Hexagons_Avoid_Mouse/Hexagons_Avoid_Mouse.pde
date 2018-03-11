Hexagono[][] hexagono;

void setup()
{
  size(800, 800);
  
  hexagono = new Hexagono[20][20];
  
  for(int row=0; row<20; row++)
  {
    for(int col=0; col<20; col++)
    {
      hexagono[col][row] = new Hexagono(col, row, 50);
      
      hexagono[col][row].draw();
    }
  }
}

void draw()
{
  background(0);
  
  for(int row=0; row<20; row++)
  {
    for(int col=0; col<20; col++)
    {
      hexagono[col][row].update();
      hexagono[col][row].draw();
    }
  }
}