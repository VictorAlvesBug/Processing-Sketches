class Bloco
{
  int X, Y, Z, size = 40, cont = 0;
  PVector pos;
  String status; // (None, Snake, Food)

  Bloco(int x, int y, int z)
  {
    this.X = x;
    this.Y = y;
    this.Z = z;

    if (x == cabeca.x && y == cabeca.y && z == cabeca.z)
    {
      this.status = "Snake";
    } else
    {
      this.status = "None";
      cont = 0;
    }

    pos = new PVector(x*size, y*size, z*size);
  }

  void update()
  {
    if (this.status == "Snake")
    {
      this.cont++;

      if (this.cont > limite)
      {
        this.status = "None";
        this.cont = 0;
      }
    } else
    {
      this.cont = 0;
    }
  }

  void draw()
  {
    
    noStroke();
    
    if (this.status == "Snake")
    {
      fill(255);
      stroke(64);
    } else if (this.status == "Food")
    {
      fill(255, 128, 0);
    }
    else if (this.status == "None" && 
            ((this.X == food.x && this.Y == food.y) || 
             (this.Y == food.y && this.Z == food.z) || 
             (this.Z == food.z && this.X == food.x)))
    {
      fill(255, 128, 0);
    }
    else
    {
      noFill();
    }
    
    
    if((this.pos.x == 0 || this.pos.x == (maxX-1)*size) &&
       (this.pos.y == 0 || this.pos.y == (maxY-1)*size) &&
       (this.pos.z == 0 || this.pos.z == (maxZ-1)*size))
       {
         stroke(64);
       }
    
    pushMatrix();
    translate(pos.x+size/2, pos.y+size/2, pos.z+size/2);
    
    if(this.status == "Food")
    {
      sphere(size*0.4);
    }
    else if (this.status == "None" && 
            ((this.X == food.x && this.Y == food.y) || 
             (this.Y == food.y && this.Z == food.z) || 
             (this.Z == food.z && this.X == food.x)))
    {
      sphere(size*0.1);
    }
    else if (this.status == "None" && 
            ((this.X == cabeca.x && this.Y == cabeca.y) || 
             (this.Y == cabeca.y && this.Z == cabeca.z) || 
             (this.Z == cabeca.z && this.X == cabeca.x)))
    {
      fill(255);
      box(size*0.25);
    }
    else
    {
      box(size);
    }
    popMatrix();
  }
}