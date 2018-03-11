float posX=0, posY=0, cont = 0;
float direcao = 1;

Square[][] square = new Square[100][100];

void setup()
{
  size(800, 800);
  
  for(int row=0; row<100; row++)
  {
    for(int col=0; col<100; col++)
    {
      //int cor;
      
      /*if(col + row == 50)*/
      
      
      square[col][row] = new Square(col, row, random(20,255), random(20,255), random(20,255));
    }
  }
}

void draw()
{
  background(0);
  
  rectMode(CENTER);
  noStroke();
  fill(255,0,0);
  
  for(int row=0; row<100; row++)
  {
    for(int col=0; col<100; col++)
    {
      square[col][row].draw();
    }
  }
  
}

void mouseClicked()
{
  for(int row=0; row<100; row++)
  {
    for(int col=0; col<100; col++)
    {
      if(mouseX>(col)*10 && mouseX<(col+1)*10 && mouseY>(row)*10 && mouseY<(row+1)*10)
      {
        square[col][row].update();
      }
      //square[col][row].draw();
    }
  }
}