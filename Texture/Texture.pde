float[][] anguloBlack;
float[][] anguloWhite;

void setup()
{
  size(800, 800);
  
  anguloBlack = new float[25][25];
  anguloWhite = new float[25][25];
  
  for(int row=0; row<25; row++)
  {
    for(int col=0; col<25; col++)
    {
      anguloWhite[col][row] = -map(dist(-20+col*40+(row%2)*20, 0+row*40*sqrt(3)/2, width/2, height/2), 0, dist(0, 0, width/2, height/2), 0, PI);
      anguloBlack[col][row] = -map(anguloWhite[col][row], 0, PI, 0, anguloWhite[col][row]);//sin(map(col*row, 0, 24, 0, TWO_PI));
    }
  }
}

void draw()
{
  background(0);
  
  for(int row=0; row<25; row++)
  {
    for(int col=0; col<25; col++)
    {
      fill(255);
      ellipse(-20+col*40+(row%2)*20, 0+row*40*sqrt(3)/2, 40*sin(anguloWhite[col][row]), 40*sin(anguloWhite[col][row]));
      fill(0);
      ellipse(-20+col*40+(row%2)*20, 0+row*40*sqrt(3)/2, 40*sin(anguloBlack[col][row]), 40*sin(anguloBlack[col][row]));
    }
  }
  
  for(int row=0; row<25; row++)
  {
    for(int col=0; col<25; col++)
    {
      anguloWhite[col][row] += 0.05;
      anguloBlack[col][row] += 0.05;
    }
  }
  
}