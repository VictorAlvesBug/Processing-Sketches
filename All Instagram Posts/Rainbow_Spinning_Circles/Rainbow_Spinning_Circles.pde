Bola[][] bola;
int raio = 400;
int rMax = 25;
int angMax = 60;

void setup()
{
  size(900, 900);
  
  bola = new Bola[rMax][angMax];
  
  for(int r=0; r<rMax; r++)
  {
    for(int ang=0; ang<angMax; ang++)
    {
      bola[r][ang] = new Bola(r, ang);
    }
  }
  
}

void draw()
{
  translate(width/2, height/2);
  background(0);
  
  stroke(255);
  noFill();
  //ellipse(0, 0, 2*raio, 2*raio);
  
  for(int r=0; r<rMax; r++)
  {
    for(int ang=0; ang<angMax; ang++)
    {
      bola[r][ang].update();
      bola[r][ang].draw();
    }
  }
  
}