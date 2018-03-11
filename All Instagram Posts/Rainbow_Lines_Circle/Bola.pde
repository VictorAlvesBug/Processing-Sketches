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
    this.cor = new PVector(map(min(abs(ang-0), abs(ang-60)), 0, 30, 255, 0), map(min(abs(ang-20), abs(ang-80)), 0, 30, 255, 0), map(min(abs(ang+20), abs(ang-40)), 0, 30, 255, 0));
  }
  
  void update()
  {
    if(r == 1)
    {
      this.angulo += 0.01;
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
    
    p1x = 400*cos(map(ang, 0, 60, 0, TWO_PI));
    p1y = 400*sin(map(ang, 0, 60, 0, TWO_PI));
    
    p2x = 300*cos(this.angulo+map(ang, 0, 60, 0, TWO_PI));
    p2y = 300*sin(this.angulo+map(ang, 0, 60, 0, TWO_PI));
    
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