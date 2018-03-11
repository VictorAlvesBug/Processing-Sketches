class Magnet
{
  PVector pos, vel, acc, forca;
  float massa = 80;
  float carga;
  
  Magnet(float px, float py, float q)
  {
    carga = q;
    pos = new PVector(px, py);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    forca = new PVector(0, 0);
  }
  
  void update()
  {
    // F = (k*q1*q2) / d^2
    // F = m*a
    // a = F/m
    /*float F = 0;
    
    for(Magnet m : magnet)
    {
      float d = dist(pos.x, pos.y, m.pos.x, m.pos.y);
      F += (k * carga * m.carga) / pow(d,2);
    }*/
    
    acc.x = forca.x/massa;
    acc.y = forca.y/massa;
    
    vel.x += acc.x;
    vel.y += acc.y;
    
    pos.x += vel.x;
    pos.y += vel.y;
    
    vel.x *= 0.99;
    vel.y *= 0.99;
  }
  
  void show()
  { 
    if(carga > 0)
    {
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, massa/2, massa/2);
    line(pos.x-massa/8, pos.y, pos.x+massa/8, pos.y);
    line(pos.x, pos.y-massa/8, pos.x, pos.y+massa/8);
    }
    else
    {
      fill(255, 0, 0);
    ellipse(pos.x, pos.y, massa/2, massa/2);
    line(pos.x-massa/8, pos.y, pos.x+massa/8, pos.y);
    }
  }
  
  /*void pop()
  {
    
  }*/
}