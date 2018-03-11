class Bola
{
  PVector posicao;
  PVector cor;
  PVector velocidade;
  boolean movendo;
  
  Bola(int x, int y)
  {
    this.posicao = new PVector(x,y); 
    this.cor = new PVector(random(55, 255), random(55, 255), random(55, 255));
  }
  
  void velocidadeInicial()
  {
    PVector versor = new PVector(mouse.x - this.posicao.x,mouse.y - this.posicao.y);
    while(abs(versor.x) > 10 || abs(versor.y) > 10)
    {
      versor.x *= 0.99;
      versor.y *= 0.99;
    }
    this.velocidade = new PVector(versor.x, versor.y);
  }
  
  void update()
  {
    if(this.posicao.y < height-15)
    {
      this.posicao.x += this.velocidade.x;
      this.posicao.y += this.velocidade.y;
    }
    else
    {
      this.movendo = false;
    }
  }
  
  void draw()
  {
    noStroke();
    fill(this.cor.x, this.cor.y, this.cor.z);
    ellipse(this.posicao.x, this.posicao.y, 30, 30);
  }
  
}