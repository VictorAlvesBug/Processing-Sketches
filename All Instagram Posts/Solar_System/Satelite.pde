class Satelite
{
  PVector posicao;
  float raio;
  Planeta foco;
  PVector cor;
  float angulo = 0, velocidade;
  float distancia;
  
  Satelite(float posX, float posY, Planeta foco, int corX, int corY, int corZ, float raio, float velocidade)
  {
    this.posicao = new PVector(posX, posY);
    this.raio = raio/divisorSizes;
    this.foco = foco;
    this.cor = new PVector(corX, corY, corZ);
    this.velocidade = velocidade;
    this.distancia = dist(this.foco.posicao.x, this.foco.posicao.y, this.posicao.x, this.posicao.y);
  }
  
  void update()
  {
    angulo += velocidade;
    this.posicao.x = this.foco.posicao.x + distancia * cos(angulo);
    this.posicao.y = this.foco.posicao.y + distancia * sin(angulo);
  }
  
  void draw()
  {
    noStroke();
    fill(this.cor.x, this.cor.y, this.cor.z);
    ellipse(this.posicao.x, this.posicao.y, 2*this.raio, 2*this.raio);
  }
  
}