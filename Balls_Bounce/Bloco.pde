class Bloco
{
  PVector posicao;
  int valor;
  PVector cor;
  char tipo;
  
  Bloco(int x, int y, int value, char tipo)
  {
    this.tipo = tipo;
    this.valor = value;
    this.posicao = new PVector(x,y);
  }
  
  PVector crash(Bola ball)
  {
      if(abs(ball.posicao.x-this.posicao.x)>width/20 &&
         abs(ball.posicao.y-this.posicao.y)<=width/20)
       {
         return new PVector(-ball.velocidade.x, ball.velocidade.y);
       }
       else if(abs(ball.posicao.x-this.posicao.x)<=width/20 &&
               abs(ball.posicao.y-this.posicao.y)>width/20)
       {
         return new PVector(ball.velocidade.x, -ball.velocidade.y);
       }
       else
       {
         return new PVector(-ball.velocidade.x, -ball.velocidade.y);
       }
  }
  
  void descer(Bloco blocoSuperior)
  {
    this.valor = blocoSuperior.valor;
    this.tipo = blocoSuperior.tipo;
  }
  
  void update()
  {
    switch(this.tipo)
    {
      case 'n'://NONE
      this.cor = new PVector(0, 0, 0);
      this.valor = 0;
      break;
      
      case 'b'://BLOCK
      this.cor = new PVector(map(this.valor % 50, 0, 50, 20, 128), map(this.valor % 70, 0, 70, 128, 20), map(this.valor % 120, 0, 120, 128, 20));
      break;
      
      case 'a'://ADDBALL
      this.cor = new PVector(255, 255, 255);
      this.valor = 0;
      break;
    }
  }
  
  void draw()
  {
    this.update();
    rectMode(CENTER);
    fill(this.cor.x, this.cor.y, this.cor.z);
    
    if(this.tipo == 'b')
    {
      rect(this.posicao.x, this.posicao.y, width/7, width/7);
      textSize(16);
      fill(255);
      textMode(CENTER);
      text(this.valor, this.posicao.x/* + width/14*/, this.posicao.y/* + width/14*/);
    }
    else if(this.tipo == 'a')
    {
      ellipse(this.posicao.x, this.posicao.y, width/10, width/10);
    }
    
  }
}