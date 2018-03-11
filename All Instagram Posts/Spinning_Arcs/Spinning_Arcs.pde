Arco[] arco;
PVector cor = new PVector(0, 255, 0);

void setup()
{
  size(800, 800);
  translate(width/2, height/2);
  
  arco = new Arco[40];
  
  for(int i=0; i<40; i++)
  {
    arco[i] = new Arco(10+i*20, 0, PI/3);
  }
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  
  for(int i=0; i<20; i++)
  {
    arco[i].update(i);
    arco[i].draw();
  }
  
  AtualizarCor();
}

void AtualizarCor()
{
  if(cor.x > 0 && cor.y == 255)
  {
    cor.x--;
  }
  else if(cor.z < 255 && cor.y == 255)
  {
    cor.z++;
  }
  else if(cor.y > 0 && cor.z == 255)
  {
    cor.y--;
  }
  else if(cor.x < 255 && cor.z == 255)
  {
    cor.x++;
  }
  else if(cor.z > 0 && cor.x == 255)
  {
    cor.z--;
  }
  else if(cor.y < 255 && cor.x == 255)
  {
    cor.y++;
  }
}