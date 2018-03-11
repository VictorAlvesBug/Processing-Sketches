float[][] angulo;

void setup()
{
  size(800, 800);
  
  angulo = new float[80][80];
  
  for(int row=0; row<80; row++)
  {
    for(int col=0; col<80; col++)
    {
      angulo[col][row] = sin(col/PI)*sin(row/PI);///*map(abs(40-col), 0, 40, 0, TWO_PI)*//*%map(abs(40-row), 0, 40, 0, TWO_PI)*/;
    }
  }
}

void draw()
{
  background(0);
  
  for(int row=0; row<80; row++)
  {
    for(int col=0; col<80; col++)
    {
      arc(5+col*10+3*cos(angulo[col][row]+PI/2), 5+row*10+3*sin(angulo[col][row]+PI/2), 10, 10, angulo[col][row], angulo[col][row]+PI);
    }
  }
  
  for(int row=0; row<80; row++)
  {
    for(int col=0; col<80; col++)
    {
      angulo[col][row]+=0.3;
    }
  }
  
}