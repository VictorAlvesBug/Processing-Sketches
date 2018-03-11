class Hexagono
{
  float lado, altura;
  // LADO E ALTURA SE REFEREM AS DIMENSOES DOS 6 TRIANGULOS QUE COMPOEM O HEXAGONO
  PVector posicao = new PVector(0, 0);
  PVector posicaoOriginal = new PVector(0, 0);
  PVector cor;
  // A DIMENSAO X CORRESPONDE A 2*ALTURA
  // A DIMENSAO Y CORRESPONDE A 2*LADO
  
  Hexagono(int linha, int coluna, int dimX)
  {
    this.altura = dimX/2;
    this.lado = this.altura/(sqrt(3)/2);
    // h = l*sqrt(3)/2
    // l = h/(sqrt(3)/2)
    this.posicaoOriginal = new PVector(coluna*this.altura*2+(linha%2)*this.altura, linha*1.5*this.lado);
    this.posicao.x = this.posicaoOriginal.x;
    this.posicao.y = this.posicaoOriginal.y;
    
    this.cor = new PVector(255, 0, 0); 
  }
  
  void SeAfastar(float posX, float posY)
  {
    this.posicao.x -= map((this.posicao.x - posX), -100, 100, 10, -10);
    this.posicao.y -= map((this.posicao.y - posY), -100, 100, 10, -10);
  }
  
  void SeAproximar(float posX, float posY)
  {
    this.posicao.x -= (this.posicao.x - posX)/10.0;
    this.posicao.y -= (this.posicao.y - posY)/10.0;
  }
  
  void update()
  {
    float distanciaPos = dist(mouseX, mouseY, this.posicao.x, this.posicao.y);
    float distanciaPosOriginal = dist(mouseX, mouseY, this.posicaoOriginal.x, this.posicaoOriginal.y);
    
    if(distanciaPos<100 && distanciaPosOriginal<100)
    {
      this.SeAfastar(mouseX, mouseY);
    }
    else
    {
      this.SeAproximar(this.posicaoOriginal.x, this.posicaoOriginal.y);
    }
  }
  
  void draw()
  {
    //stroke(0);
    //strokeWeight(2);
    noStroke();
    fill(this.cor.x, this.cor.y, this.cor.z);
    
    beginShape();
    
    vertex(this.posicao.x+this.lado*cos(PI/6), this.posicao.y+this.lado*sin(PI/6));
    vertex(this.posicao.x+this.lado*cos(PI/2), this.posicao.y+this.lado*sin(PI/2));
    vertex(this.posicao.x+this.lado*cos(5*PI/6), this.posicao.y+this.lado*sin(5*PI/6));
    vertex(this.posicao.x+this.lado*cos(7*PI/6), this.posicao.y+this.lado*sin(7*PI/6));
    vertex(this.posicao.x+this.lado*cos(3*PI/2), this.posicao.y+this.lado*sin(3*PI/2));
    vertex(this.posicao.x+this.lado*cos(11*PI/6), this.posicao.y+this.lado*sin(11*PI/6));
    
    endShape(CLOSE);
  }
}