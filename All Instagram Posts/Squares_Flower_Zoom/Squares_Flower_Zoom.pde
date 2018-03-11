Losango[][] losango;
int maxRaio = 20;
int maxAngulo = 12;
float amplitude = 600;

void setup()
{
  size(800, 800);
  
  losango = new Losango[maxRaio][maxAngulo];
  
  /*for(int raio=0; raio<maxRaio; raio++)
  {
    for(int angulo=0; angulo<maxAngulo; angulo++)
    {
      float diagonalExterior = 0, radiusExterior = 300;
      
      if(raio>0)
      {
        diagonalExterior = losango[raio-1][0].diagonalLosango;
        radiusExterior = losango[raio-1][0].radius;
      }
      
      losango[raio][angulo] = new Losango(raio, angulo, radiusExterior, diagonalExterior);
    }
  }*/
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  
  for(int raio=0; raio<maxRaio; raio++)
  {
    for(int angulo=0; angulo<maxAngulo; angulo++)
    {
      float diagonalExterior = 0, radiusExterior = amplitude;
      
      if(raio>0)
      {
        diagonalExterior = losango[raio-1][0].diagonalLosango;
        radiusExterior = losango[raio-1][0].radius;
      }
      
      losango[raio][angulo] = new Losango(raio, angulo, radiusExterior, diagonalExterior);
    }
  }
  
  for(int raio=0; raio<maxRaio; raio++)
  {
    for(int angulo=0; angulo<maxAngulo; angulo++)
    {
      losango[raio][angulo].update();
      losango[raio][angulo].draw();
    }
  }
  
}