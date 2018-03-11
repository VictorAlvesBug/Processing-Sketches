class Bloco
{
  PVector pos, index;
  boolean desenhar;

  Bloco(int x, int y, int z)
  {
    this.index = new PVector(x, y, z);
    this.pos = new PVector(size*x, size*y, size*z);
  }

  void draw()
  {
    /*if (this.desenhar)
     {*/
    pushMatrix();

    stroke(0);

    if (index.x%10 == 0 && index.z%10 == 0)
    {
      fill(255, 0, 0);
    } else
    {
      fill(0, 0, 255);
    }

    translate(pos.x, pos.y, pos.z);
    box(size);

    popMatrix();
    /*}*/
  }
}