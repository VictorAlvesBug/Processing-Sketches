class Arco
{
  int diametro;
  float anguloInicial, anguloAbertura;
  
  Arco(int raio, float anguloInicial, float anguloAbertura)
  {
    this.diametro = raio*2;
    this.anguloInicial = anguloInicial;
    this.anguloAbertura = anguloAbertura;
  }
  
  void update(int index)
  {
    this.anguloInicial += index*0.005;
  }
  
  void draw()
  {
    stroke(cor.x, cor.y, cor.z);
    strokeWeight(3);
    noFill();
    
    arc(0, 0, this.diametro, this.diametro, this.anguloInicial, this.anguloInicial+5);
  }
}