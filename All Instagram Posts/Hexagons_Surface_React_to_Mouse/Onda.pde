class Onda
{
  PVector posInicial;
  PVector[] posRaio = new PVector[60];
  float raio = 0;
 
  Onda(int posInicialX, int posInicialY)
  {
    posInicial = new PVector(posInicialX, posInicialY);
    
    for(int i=0; i<60; i++)
    {
      posRaio[i] = posInicial;
    }
  }
  
  void update()
  {
    raio +=60;
    
    for(int i=0; i<60; i++)
    {
      float angulo = map(i, 0, 60, 0, TWO_PI);
      posRaio[i] = new PVector(posInicial.x + raio*cos(angulo), posInicial.y + raio*sin(angulo));
    }
    
  }
}