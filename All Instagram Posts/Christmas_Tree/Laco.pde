class Laco
{
  int tipo;
  float index = 0, weight, angulo = 0;
  PVector anterior, anterior2, anterior3, cor, posicao;
  
  Laco(int tipo, PVector cor)
  {
    this.anterior = new PVector(0, 30);
    this.anterior2 = new PVector(0, 30);
    this.anterior3 = new PVector(0, 30);
    this.cor = cor;
    this.tipo = tipo;
    this.weight = max(map(PI + (2*tipo*PI/6 + index/3)%TWO_PI, PI, TWO_PI, 2, 3), map(PI + (2*tipo*PI/6 + index/3)%TWO_PI, PI, TWO_PI, 3, 2));
    
  }
  
  void mudarPosicao(float angulo)
  {
    this.angulo = angulo;
  }
  
  void update()
  {
    index += 0.05;
    this.posicao = new PVector(3*index*cos(this.angulo + 4*tipo*PI/6 + index/3), 30+index*10);
  }
  
  void draw()
  {
    if(this.posicao.y < 650)
    {
      this.weight = max(map(PI + (2*this.angulo + 2*tipo*PI/6 + index/3)%TWO_PI, PI, TWO_PI, 2, 3), map(PI + (2*tipo*PI/6 + index/3)%TWO_PI, PI, TWO_PI, 3, 2));
      this.anterior = DrawLine(this.weight, this.anterior, this.posicao, this.cor);
      //this.anterior2 = DrawLine(1, this.anterior2, new PVector(this.posicao.x, this.posicao.y+10*sin(index*2)), new PVector(cor.y/2, cor.z/2, cor.x/2));
      //this.anterior3 = DrawLine(1, this.anterior3, new PVector(this.posicao.x, this.posicao.y-10*sin(PI/2+index*2)), new PVector(cor.z/2, cor.x/2, cor.y/2));
      
      if(abs(this.posicao.x)%10 < 1)
      {
        float raio;
        
        noStroke();
        fill(cor.y, cor.z, cor.x);
        raio = random(-3,3);
        ellipse(this.posicao.x, this.posicao.y+10*sin(index*3), raio, raio);
        
        noStroke();
        fill(cor.z, cor.x, cor.y);
        raio = random(-3,3);
        ellipse(this.posicao.x, this.posicao.y-10*sin(PI/2+index*3), raio, raio);
      }
      
      /*if(random(1)<0.002)
      {
        stroke(cor.y*2, cor.z*2, cor.x*2);
        fill(cor.y*2, cor.z*2, cor.x*2);
        ellipse(this.posicao.x, this.posicao.y+20, 10, 10);
      }*/
      
    }
  }
}