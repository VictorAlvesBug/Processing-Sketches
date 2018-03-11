class Gear
{
  float dentes;
  float raio;
  float anguloRotacao;
  float anguloTranslacao;
  float velocidade;
  
  Gear(float dentes, float raio, float velocidade)
  {
    this.dentes = dentes;
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
      float alturaDente = ((TWO_PI*this.raio)/this.dentes)/3;
      float raioCompleto = this.raio + alturaDente*sin(i*this.dentes);
      
      point(raioCompleto*cos(i), raioCompleto*sin(i));
    }
    
    
    rotate(-this.anguloRotacao);
    
    if(this.dentes == engrenagemInterior.dentes)
    {
      line(0, 0, porcentagemRaio*this.raio*cos(this.anguloRotacao), porcentagemRaio*this.raio*sin(this.anguloRotacao));
    }
    
    translate(-centroX, -centroY);
    
  }
}