class Sol
{
  PVector posicao;
  float raio;
  Planeta foco;
  PVector focoPos;
  PVector cor;
  
  Sol(float posX, float posY, int corX, int corY, int corZ, float raio)
  {
    this.posicao = new PVector(posX, posY);
    divisorSizes = raio/200;
    this.raio = raio/(divisorSizes*5);
    this.cor = new PVector(corX, corY, corZ);
  }
  
  void update()
  {
    /*angulo += 0.05;
    float distancia = dist(this.foco.posicao.x, this.foco.posicao.y, this.posicao.x, this.posicao.y);
    this.posicao.x = distancia * cos(angulo);
    this.posicao.y = distancia * sin(angulo);*/
  }
  
  void draw()
  {
    noStroke();
    fill(this.cor.x, this.cor.y, this.cor.z);
    ellipse(this.posicao.x, this.posicao.y, 2*this.raio, 2*this.raio);
  }
  
}