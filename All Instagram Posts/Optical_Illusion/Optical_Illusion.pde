Bola[] bola;
int raio = 400;

void setup()
{
  size(1000, 1000);
  
  bola = new Bola[8];
  
  for(int i=0; i<8; i++)
  {
    //---------------  angulo      ,  size   ,                      cor                         , raio
    bola[i] = new Bola(i*TWO_PI/16 , raio/8 , random(50, 255), random(50, 255), random(50, 255), raio);
  }
  
}

void draw()
{
  translate(width/2, height/2);
  background(0);
  
  stroke(255);
  noFill();
  ellipse(0, 0, 2*raio, 2*raio);
  
  for(int i=0; i<8; i++)
  {
    bola[i].update();
    bola[i].draw();
  }
  
}