Hexagono[][] hexagono;
PVector[] histPos = new PVector[200];
int cont = 0;
float distanciaMax = 100;
int cliques = 0;

Onda[] onda = new Onda[20];

void setup()
{
  //size(800, 800);
  fullScreen();
  
  hexagono = new Hexagono[50][50];
  
  for(int row=0; row<50; row++)
  {
    for(int col=0; col<50; col++)
    {
      hexagono[col][row] = new Hexagono(col, row, 50);
      
      hexagono[col][row].draw();
    }
  }
}

void draw()
{
  background(255, 0, 0);
  
  for(int clk=0; clk<cliques; clk++)
  {
    onda[clk].update();
  }
  
  for(int row=0; row<50; row++)
  {
    for(int col=0; col<50; col++)
    {
      hexagono[col][row].update();
      hexagono[col][row].draw();
    }
  }
    
}

void mouseClicked()
{
  onda[cliques] = new Onda(mouseX, mouseY);
  cliques++;
  
  if(cliques == 20)
  {
    cliques = 0;
  }
}