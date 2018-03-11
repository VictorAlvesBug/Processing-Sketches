class Bola
{
  PVector cor;
  float diametro, angulo = 0;
  int r, ang;
  
  Bola(int r, int ang)
  {
    this.r = r;
    this.ang = ang;
    this.angulo = map(this.ang, 0, angMax, 0, TWO_PI);
    this.diametro = r/2;
    this.cor = new PVector(map(min(abs(this.ang-0), abs(this.ang-angMax)), 0, angMax/2, 255, 0), map(min(abs(this.ang-angMax/3), abs(this.ang-4*angMax/3)), 0, angMax/2, 255, 0), map(min(abs(this.ang+angMax/3), abs(this.ang-2*angMax/3)), 0, angMax/2, 255, 0));
  }
  
  void update()
  {
    this.angulo += 0.001*(rMax - this.r);
  }
  
  void draw()
  {
    /*stroke(cor.x, cor.y, cor.z);
    stroke(128);
    noFill();
    line(-raio*cos(angulo), -raio*sin(angulo), raio*cos(angulo), raio*sin(angulo));*/
    
    noStroke();
    fill(cor.x, cor.y, cor.z);
    
    float p1x, p1y;
    
    p1x = r*17*cos(this.angulo);
    p1y = r*17*sin(this.angulo);
    
    //float dia = map();
    
    ellipse(p1x, p1y, this.diametro, this.diametro);
    
  }
  
}