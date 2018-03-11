class Magnet
{
  PVector pos, vel, acc, forca;
  float massa = 80;
  float carga, cargaReal;
  String mode = "Default";

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
    if (mode == "Default")
    {
      textAlign(CENTER);
      textSize(25);

      if (carga > 0)
      {
        fill(0, 0, 255);
      } else if (carga < 0)
      {
        fill(255, 0, 0);
      } else
      {
        fill(255, 0, 255);
      }

      ellipse(pos.x, pos.y, massa, massa);
      fill(255);
      text((carga>0?"+":"") + ceil(carga), pos.x, pos.y+10);
      
    } else
    {
      noStroke();
      fill(0, 0, 255);
      arc(pos.x, pos.y, massa, massa, -PI, 0, PIE);
      fill(255, 0, 0);
      arc(pos.x, pos.y, massa, massa, 0, PI, PIE);
      noFill();
      stroke(255);
      line(pos.x, pos.y-massa*0.35, pos.x, pos.y-massa*0.15);
      line(pos.x-massa*0.1, pos.y-massa*0.25, pos.x+massa*0.1, pos.y-massa*0.25);
      line(pos.x-massa*0.1, pos.y+massa*0.25, pos.x+massa*0.1, pos.y+massa*0.25);
      ellipse(pos.x, pos.y, massa, massa);
      
      if (carga > 0)
      {
        fill(0, 0, 255);
      } else if (carga < 0)
      {
        fill(255, 0, 0);
      } else
      {
        fill(255, 0, 255);
      }

      noStroke();
      ellipse(pos.x, pos.y, massa*0.3, massa*0.3);
      fill(255);
      textSize(15);
      text((carga>0?"+":"") + ceil(carga), pos.x, pos.y+5);
    }
  }

  /*void pop()
   {
   
   }*/
}