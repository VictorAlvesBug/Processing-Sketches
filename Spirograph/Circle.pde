class Circle
{
  float raio;
  float anguloRotacao;
  float anguloTranslacao;
  float velocidade;
  
  Circle(float raio, float velocidade)
  {
    this.raio = raio/2;
    this.anguloRotacao = 0;
    this.anguloTranslacao = 0;
    this.velocidade = velocidade;
  }
  
  void addPonto(float centroX, float centroY)
  {
    ponto[cont] = new PVector(centroX+porcentagemRaio*this.raio*cos(this.anguloRotacao), centroY+porcentagemRaio*this.raio*sin(this.anguloRotacao));
    cont++;
  }
  
  void update()
  {
    this.anguloTranslacao += this.velocidade;
  }
  
  void draw(float centroX, float centroY)
  {
    translate(centroX, centroY);
    rotate(this.anguloRotacao);
    
    for(float i=0; i<TWO_PI; i+=0.001)
    {
      point(this.raio*cos(i), this.raio*sin(i));
    }
    
    
    rotate(-this.anguloRotacao);
    translate(-centroX, -centroY);
    
  }
}