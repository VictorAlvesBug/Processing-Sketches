class Block
{
  PVector pos, index;
  boolean up = true, down = true, left = true, right = true, isolated = true;
  float size = (width - 100) / maxCols;

  Block(int x, int y)
  {
    this.index = new PVector(x, y);
    this.pos = new PVector(50+size*x, 50+size*y);
  }

  void update(int direcao)
  {
    switch(direcao)
    {
    case 0:
      walker.x--;
      block[(int)this.index.x][(int)this.index.y].left = false;
      block[(int)walker.x][(int)walker.y].right = false;
      break;

    case 1:
      walker.x++;
      block[(int)this.index.x][(int)this.index.y].right = false;
      block[(int)walker.x][(int)walker.y].left = false;
      break;

    case 2:
      walker.y--;
      block[(int)this.index.x][(int)this.index.y].up = false;
      block[(int)walker.x][(int)walker.y].down = false;
      break;

    case 3:
      walker.y++;
      block[(int)this.index.x][(int)this.index.y].down = false;
      block[(int)walker.x][(int)walker.y].up = false;
      break;
    }

    cont++;
    walkerHist[cont] = new PVector(walker.x, walker.y);

    
  }

  void show()
  {
    if (!this.left || !this.right || !this.up || !this.down)
    {
      this.isolated = false;
    }
    
    pushMatrix();

    rotate(angle);
    translate(initialPos.x + this.pos.x, initialPos.y + this.pos.y);

    noStroke();

    if (this.isolated)
    {
      fill(64);
      rect(0, 0, this.size, this.size);
    }

    if (this.index.x == walker.x && this.index.y == walker.y)
    {
      fill(255, 0, 0);
      rect(0, 0, this.size, this.size);
    }

    strokeWeight(this.size/10);
    stroke(255);
    noFill();
    
    int excesso = 1;
    
    if (left) {
      line(0, 0, 0, this.size-excesso);
    }
    if (right) {
      line(this.size-excesso, 0, this.size-excesso, this.size-excesso);
    }
    if (up) {
      line(0, 0, this.size-excesso, 0);
    }
    if (down) {
      line(0, this.size-excesso, this.size-excesso, this.size-excesso);
    }

    popMatrix();
  }
}