class Bola
{
  float angulo;
  int size;
  PVector cor;
  float distAngulo;
  float raio;
  
  Bola(float angulo, int size, float R, float G, float B, float raio)
  {
    this.angulo = angulo;
    this.size = size;
    this.cor = new PVector(R, G, B);
    this.raio = raio;
    this.distAngulo = angulo;
  }
  
  void update()
  {
    //this.angulo += 0.03;
    this.distAngulo += 0.05;
  }
  
  void draw()
  {
    stroke(cor.x, cor.y, cor.z);
    stroke(128);
    noFill();
    line(-raio*cos(angulo), -raio*sin(angulo), raio*cos(angulo), raio*sin(angulo));
    
    noStroke();
    fill(cor.x, cor.y, cor.z);
    ellipse(raio*sin(distAngulo)*cos(angulo), raio*sin(distAngulo)*sin(angulo), this.size, this.size);
  }
  
  
  
}