class Bloco
{
  PVector pos, index;
  float size;
  String id = "Empty"; /// Bomb, Num, Empty
  String status = "Closed"; /// Open, Closed, Flag
  String mode; /// Array, Bomb, Flag
  int num = 0, quantidade;

  Bloco(int px, int py)
  {
    mode = "Bomb";
    size = 50;
    pos = new PVector(px, py);
  }

  Bloco(int i, int j, int qtde)
  {
    mode = "Array";
    size = (width-100)/qtde;
    index = new PVector(i, j);
    pos = new PVector(50+i*size, 75+j*size);
  }

  void click()
  {
    if (mode == "Array")
    {
      if (status != "Open")
      {
        if (flagMode)
        {
          if (status == "Closed")
          {
            status = "Flag";
          } else
          {
            status = "Closed";
          }
        } else if (status == "Closed")
        {
          status = "Open";

          if (id == "Empty")
          {
            openNeighbors(int(index.x), int(index.y));
          }
        }
      }
    } else if (mode == "Bomb")
    {
      mode = "Flag";
      flagMode = true;
    } else
    {
      mode = "Bomb";
      flagMode = false;
    }
  }

  void show()
  {
    switch(mode)
    {
    case "Array":
      switch (status)
      {
      case "Open":
        drawBlock(this, "LightBackground");

        switch (id)
        {
        case "Bomb":
          drawBlock(this, "Bomb");
          break;

        case "Num":
          drawBlock(this, "Num");
          break;
        }
        break;

      case "Closed":
        drawBlock(this, "DarkBackground");
        break;

      case "Flag":
        drawBlock(this, "DarkBackground");
        drawBlock(this, "Flag");
        break;
      }
      break;

    case "Bomb":
      drawBlock(this, "DarkBackground");
      drawBlock(this, "Bomb");
      break;

    case "Flag":
      drawBlock(this, "DarkBackground");
      drawBlock(this, "Flag");
      break;
    }
  }
}

void drawBlock(Bloco b, String type)
{
  switch(type)
  {
  case "LightBackground":
    stroke(64);
    strokeWeight(2);
    fill(255);
    rect(b.pos.x, b.pos.y, b.size, b.size);
    break;

  case "DarkBackground":
    stroke(64);
    strokeWeight(2);
    fill(224);
    rect(b.pos.x+b.size/10, b.pos.y+b.size/10, b.size*0.8, b.size*0.8);
    noStroke();
    triangle(b.pos.x, b.pos.y, b.pos.x+b.size, b.pos.y, b.pos.x, b.pos.y+b.size);
    fill(128);
    triangle(b.pos.x+b.size, b.pos.y+b.size, b.pos.x+b.size, b.pos.y, b.pos.x, b.pos.y+b.size);
    fill(192);
    rect(b.pos.x+b.size/10, b.pos.y+b.size/10, b.size*0.8, b.size*0.8);
    //triangle
    break;

  case "Bomb":
    noStroke();
    fill(64);
    float cx = b.pos.x+b.size/2;
    float cy = b.pos.y+b.size/2;
    float r = b.size/4;

    ellipse(cx, cy, 2*r, 2*r);
    r*=1.1;
    strokeWeight(b.size/10);
    stroke(64);
    line(cx + r*cos(0), cy + r*sin(0), cx + r*cos(PI), cy + r*sin(PI));
    line(cx + r*cos(0+PI/4), cy + r*sin(0+PI/4), cx + r*cos(PI+PI/4), cy + r*sin(PI+PI/4));
    line(cx + r*cos(0+2*PI/4), cy + r*sin(0+2*PI/4), cx + r*cos(PI+2*PI/4), cy + r*sin(PI+2*PI/4));
    line(cx + r*cos(0+3*PI/4), cy + r*sin(0+3*PI/4), cx + r*cos(PI+3*PI/4), cy + r*sin(PI+3*PI/4));
    break;

  case "Flag":
    stroke(64);
    strokeWeight(2);
    fill(255, 0, 0);
    beginShape(); // FLAG
    vertex(b.pos.x+b.size/3, b.pos.y+3*b.size/4);
    vertex(b.pos.x+b.size/3, b.pos.y+b.size/4);
    vertex(b.pos.x+2*b.size/3, b.pos.y+b.size/4);
    vertex(b.pos.x+2*b.size/3, b.pos.y+2*b.size/4);
    vertex(b.pos.x+b.size/3, b.pos.y+2*b.size/4);
    endShape();
    break;

  case "Num":
    noStroke();
    fill(64);
    textSize(40);
    textAlign(CENTER);
    text(b.num, b.pos.x+b.size/2, b.pos.y+b.size/2+10);
    break;

  case "Restart":
    stroke(64);
    strokeWeight(5);
    noFill();
    arc(b.pos.x+b.size/2, b.pos.y+b.size/2, b.size/2, b.size/2, PI/6, 11*PI/6);
    fill(64);
    PVector p = new PVector(b.pos.x+b.size/2 + b.size/4*cos(-PI/6+0.1), b.pos.y+b.size/2 + b.size/4*sin(-PI/6+0.1));
    triangle(p.x, p.y, p.x-7, p.y, p.x, p.y-7);
    break;
  }
}