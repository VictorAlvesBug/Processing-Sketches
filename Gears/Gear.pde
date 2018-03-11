class Gear
{
  float dentes;
  float raio;
  float anguloRotacao;
  float velocidade;
  float voltas;
  PVector posicao;
  
  Gear(float dentes, int index)
  {
    this.dentes = dentes;
    this.voltas = 0;
    
    if(index == 0)
    {
      //this.anguloRotacao = 0;
      this.raio = raioPrincipal;
      this.velocidade = velocidadePrincipal;
    }
    else
    {
      // d1/r1 = d2/r2
      // r2 = d2/(d1/r1)
      this.raio = this.dentes / (engrenagem[0].dentes / engrenagem[0].raio);
      
      // d1*v1 = d2*v2
      // v2 = (d1*v1)/d2
      this.velocidade = - (engrenagem[index-1].dentes * engrenagem[index-1].velocidade) / this.dentes;
      
      //this.anguloRotacao = 0;
      //this.anguloTranslacao = map(index, 0, 3, 0, TWO_PI);
    }
    
    
  }
  
  void update()
  {
    this.anguloRotacao += this.velocidade;
    this.voltas += abs(this.velocidade/TWO_PI);
  }
  
  void draw()
  {
    translate(this.posicao.x, this.posicao.y);
    
    stroke(255);
    strokeWeight(1);
    line(0, 0, this.raio*cos(3*PI/2), this.raio*sin(3*PI/2));
    stroke(255, 0, 0);
    strokeWeight(2);
    
    rotate(this.anguloRotacao);
    
    for(float i=0; i<TWO_PI; i+=0.001)
    {
      float alturaDente = ((TWO_PI*this.raio)/this.dentes)/3;
      float raioCompleto = this.raio + alturaDente*sin(i*this.dentes);
      
      point(raioCompleto*cos(i), raioCompleto*sin(i));
    }
    
    line(0, 0, this.raio*cos(3*PI/2), this.raio*sin(3*PI/2));
    rotate(-this.anguloRotacao);
    
    textSize(20);
    text(this.voltas, -35, +10);
    
    translate(-this.posicao.x, -this.posicao.y);
    
  }
}