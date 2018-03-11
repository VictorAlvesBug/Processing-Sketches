float anteriorX = 0;
float anteriorY = 0;
float primeiroX = 0;
float primeiroY = 0;
float petalas = 0.01;

void setup()
{
  size(1000, 1000);
  background(0);
}

void draw()
{
  
  while(petalas>10000){}
  
  translate(width/2, height/2);
  
  fill(0, 0, 0, 60);
  rect(-width/2, -height/2, width, height);
  
  stroke(255);
  
  petalas+=0.05;
    
    float grausPorPetala = TWO_PI/petalas;
  
  for(float a=0; a<TWO_PI; a+=0.001)
  {
      float angulo = a;
      
      while(angulo>grausPorPetala)
      {
        angulo-=grausPorPetala;
      }
      
      float min = -35;
      float max = 40;
      
      float multiplicador = max(map(abs(angulo-grausPorPetala), 0, grausPorPetala, min, max), map(abs(angulo-grausPorPetala), 0, grausPorPetala, max, min));
      
      float pX = 10*cos(a)*multiplicador;
      float pY = 10*sin(a)*multiplicador;
          
      if(primeiroX == 0 && primeiroY == 0)
      {
        primeiroX = pX; 
        primeiroY = pY;
      }
      
      DrawNewLine(pX, pY);
  }
  
  DrawNewLine(primeiroX, primeiroY);
  
}

void DrawNewLine(float atualX, float atualY)
{
  if(anteriorX != 0 && anteriorY != 0)
  {
    line(anteriorX,anteriorY, atualX, atualY);
  }
  anteriorX = atualX;
  anteriorY = atualY;
}