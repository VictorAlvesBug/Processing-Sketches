class Planeta
{
  PVector posicao;
  float raio;
  Sol foco;
  PVector cor;
  float angulo=0, velocidade;
  float distancia;
    
  
  Planeta(float posX, float posY, Sol foco, int corX, int corY, int corZ, float raio, float velocidade)
  {
    this.posicao = new PVector(posX, posY);
    this.raio = raio/divisorSizes;
    this.foco = foco;
    this.cor = new PVector(corX, corY, corZ);
    this.velocidade = velocidade;
    this.distancia = dist(this.foco.posicao.x, this.foco.posicao.y, this.posicao.x, this.posicao.y);
  }
  
  void play()
  {
    this.update();
    this.draw();
  }
  
  void update()
  {
    angulo += velocidade;
    this.posicao.x = this.foco.posicao.x + distancia * cos(angulo);
    this.posicao.y = this.foco.posicao.y + distancia * sin(angulo);
  }
  
  void draw()
  {
    //stroke(this.cor.x, this.cor.y, this.cor.z);
    stroke(30);
    strokeWeight(1);
    noFill();
    float distFoco = dist(this.foco.posicao.x, this.foco.posicao.y, this.posicao.x, this.posicao.y);
    ellipse(this.foco.posicao.x, this.foco.posicao.y, 2*distFoco, 2*distFoco);
    
    noStroke();
    fill(this.cor.x, this.cor.y, this.cor.z);
    ellipse(this.posicao.x, this.posicao.y, 2*this.raio, 2*this.raio);
  }
  
}