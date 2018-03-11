class Hexagono
{
  float lado, altura;
  // LADO E ALTURA SE REFEREM AS DIMENSOES DOS 6 TRIANGULOS QUE COMPOEM O HEXAGONO
  PVector posicao;
  PVector cor;
  // A DIMENSAO X CORRESPONDE A 2*ALTURA
  // A DIMENSAO Y CORRESPONDE A 2*LADO
  
  Hexagono(int linha, int coluna, int dimX)
  {
    this.altura = dimX/2;
    this.lado = this.altura/(sqrt(3)/2);
    // h = l*sqrt(3)/2
    // l = h/(sqrt(3)/2)
    this.posicao = new PVector(coluna*this.altura*2+(linha%2)*this.altura, linha*1.5*this.lado);
    
    this.cor = new PVector(0, 0, 128); 
  }
  
  void update()
  {
    float distanciaMouse = dist(mouseX, mouseY, this.posicao.x, this.posicao.y);
    float dimX;
    
    /*if(distanciaMouse<distanciaMax)
    {*/
      
    for(int clk=0; clk<cliques; clk++)
    {
      for(int i=0; i<60; i++)
      {
        if(distanciaMouse > dist(onda[clk].posRaio[i].x, onda[clk].posRaio[i].y, this.posicao.x, this.posicao.y))
        {
          distanciaMouse = dist(onda[clk].posRaio[i].x, onda[clk].posRaio[i].y, this.posicao.x, this.posicao.y);
        }
      }
    }
    
    dimX = map(distanciaMouse, 0, distanciaMax, 30, 50);
    /*}
    else
    {
      dimX = 50;
    }*/
    
    this.altura = dimX/2;
    this.lado = this.altura/(sqrt(3)/2) + 1;
  }
  
  void draw()
  {
    //stroke(0);
    //strokeWeight(2);
    noStroke();
    fill(this.cor.x, this.cor.y, this.cor.z);
    fill(0);
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