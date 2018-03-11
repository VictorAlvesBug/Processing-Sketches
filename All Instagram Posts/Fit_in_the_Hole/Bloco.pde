class Bloco
{
  PVector pos, index;
  boolean visible;
  String tipo;

  Bloco(int x, int y, String t, boolean v)
  {
    this.index = new PVector(x, y);
    this.pos = new PVector(x*100, y*100, 0);
    this.visible = v;
    this.tipo = t;

    if (t == "Wall")
    {
      this.pos.z = wallPos;
    } else
    {
      this.pos.z = -200;
    }
  }

  void draw()
  {
    if (this.visible)
    {
      if (this.tipo == "Wall")
      {
        this.pos.z = wallPos;
        stroke(0);
        strokeWeight(2);
      }
      else
      {
        noStroke();
      }
      
      if (index.x == playerPos.x && index.y == playerPos.y)
      {
        stroke(0);
        strokeWeight(2);
      }

      pushMatrix();
      translate(pos.x, pos.y, pos.z);
      box(100);
      
      popMatrix();
    }
  }
}