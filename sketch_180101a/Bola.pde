class Bola
{
  PVector cor;
  float diametro, angulo = 0;
  int r, ang;
  
  Bola(int r, int ang)
  {
    this.r = r;
    this.ang = ang;
    this.diametro = 15;
    this.cor = new PVector(map(min(abs(ang-0), abs(ang-numBolas)), 0, numBolas/2, 255, 0), map(min(abs(ang-numBolas/3), abs(ang-4*numBolas/3)), 0, numBolas/2, 255, 0), map(min(abs(ang+numBolas/3), abs(ang-2*numBolas/3)), 0, 30, 255, 0));
  }
  
  void update()
  {
    if(r == 1)
    {
      this.angulo += 0.05;
      //this.angulo = map(mouseX, 0, width, 0, TWO_PI);
    }
  }
  
  void draw()
  {
    /*stroke(cor.x, cor.y, cor.z);
    stroke(128);
    noFill();
    line(-raio*cos(angulo), -raio*sin(angulo), raio*cos(angulo), raio*sin(angulo));*/
    
    noStroke();
    fill(cor.x, cor.y, cor.z);
    
    float p1x, p1y, p2x, p2y;
    float anguloRotacao = map(ang, 0, numBolas, 0, TWO_PI);
    
    p1x = 400*cos(anguloRotacao);
    p1y = 400*sin(anguloRotacao);
    
    p2x = p1x-((400-100)*sin(anguloRotacao))/**cos(anguloRotacao)*/ + 50*cos(this.angulo+anguloRotacao);
    p2y = p1y-((400-100)*sin(anguloRotacao))/**sin(anguloRotacao)*/ + 50*sin(this.angulo+anguloRotacao);
    
    if(r == 0)
    {
      ellipse(p1x, p1y, this.diametro, this.diametro);
    }
    else
    {
      ellipse(p2x, p2y, this.diametro, this.diametro);
      stroke(cor.x, cor.y, cor.z);
      strokeWeight(2);
      line(p1x, p1y, p2x, p2y);
    }
    
  }
  
}