class Turtle
{
  PVector pos;
  float move;
  float angle;
  ArrayList<PVector> point = new ArrayList<PVector>();
  ArrayList<Boolean> visible = new ArrayList<Boolean>();

  Turtle(float px, float py, float a)
  {
    pos = new PVector(px, py);
    angle = a;

    point.add(pos);
    visible.add(false);
  }

  void setPosition(float px, float py)
  {
    float ang = angle;
    angle = 0;

    pos = new PVector(px, py);

    angle = ang;

    point.add(pos);
    visible.add(false);
  }

  void setAngle(float ang)
  {
    angle = ang;
  }

  void goForward(float dist)
  {
    for (float i=1; i<=abs(dist); i++)
    {
      stroke(255);
      float x1 = lerp(pos.x, pos.x+dist*cos(radians(angle)), i/abs(dist));
      float y1 = lerp(pos.y, pos.y+dist*sin(radians(angle)), i/abs(dist));
      float x2 = lerp(pos.x, pos.x+dist*cos(radians(angle)), (i+1)/abs(dist));
      float y2 = lerp(pos.y, pos.y+dist*sin(radians(angle)), (i+1)/abs(dist));

      //line(x1, y1, x2, y2);

      point.add(new PVector(x1, y1));
      visible.add(true);
    }

    pos = new PVector(pos.x+dist*cos(radians(angle)), pos.y+dist*sin(radians(angle)));

    point.add(pos);
    visible.add(true);
  }

  void jumpForward(float dist)
  {
    pos = new PVector(pos.x+dist*cos(radians(angle)), pos.y+dist*sin(radians(angle)));

    point.add(pos);
    visible.add(false);
  }

  void turn(float ang)
  {
    angle += ang;
  }

  void write(String str, float sizeY, String font, float space)
  {
    turn(90);
    jumpForward(sizeY/2);
    turn(-90);

    for (int i=0; i<str.length(); i++)
    {
      drawLetter(str.charAt(i), sizeY, font);
      float spc = space;

      switch(str.charAt(i))
      {
      case 'A':
        spc = 1.5*space;
        break;

      case 'I':
        spc = 1.5*space;
        break;

      case 'O':
        spc = 1.5*space;
        break;
      }

      jumpForward(sizeY*0.8+(str.charAt(i)=='O' ? 1.5*space : space));
    }
  }

  void drawLetter(char letter, float sizeY, String font)
  {
    PVector initialPos = new PVector(pos.x, pos.y);
    float initialAngle = angle;
    float sizeX = sizeY*0.8;

    if (font == "Normal")
    {
      switch (letter)
      { 
      case 'A':
        float ang = degrees(atan2(sizeY, sizeX/2));
        float diagonal = dist(0, 0, sizeX/2, sizeY);
        turn(-ang);
        goForward(diagonal);
        turn(2*ang);
        goForward(diagonal);
        turn(-ang);
        turn(-90-degrees(atan2(3*sizeX/4, sizeY/2)));
        jumpForward(dist(0, 0, 3*sizeX/4, sizeY/2));
        turn(90+degrees(atan2(3*sizeX/4, sizeY/2)));
        goForward(sizeX/2);
        break;

      case 'C':
        turn(-45);
        jumpForward(sizeY/2*sqrt(2));
        turn(45);
        for (float i=45; i<315; i+=2)
        {
          angle=i;
          jumpForward(sizeY/2);
          turn(-90);
          goForward(-1);
          jumpForward(1);
          turn(-90);
          jumpForward(sizeY/2);
        }
        break;

      case 'E':
        jumpForward(sizeX);
        goForward(-sizeX);
        turn(-90);
        goForward(sizeY);
        turn(90);
        goForward(sizeX);
        turn(90);
        jumpForward(sizeY/2);
        turn(-90);
        jumpForward(-sizeX);
        goForward(sizeX);
        break;

      case 'H':
        turn(-90);
        goForward(sizeY);
        jumpForward(-sizeY/2);
        turn(90);
        goForward(sizeX);
        turn(90);
        jumpForward(sizeY/2);
        goForward(-sizeY);
        break;

      case 'O':
        turn(-45);
        jumpForward(sizeY/2*sqrt(2));
        turn(45);
        for (int i=0; i<360; i+=2)
        {
          setAngle(i);
          jumpForward(sizeY/2);
          turn(-90);
          goForward(-1);
          jumpForward(1);
          turn(-90);
          jumpForward(sizeY/2);
        }
        break;

      case 'T':
        jumpForward(sizeX/2);
        turn(-90);
        goForward(sizeY);
        turn(90);
        jumpForward(-sizeX/2);
        goForward(sizeX);
        break;
      }
      setPosition(initialPos.x, initialPos.y);
      setAngle(initialAngle);
    } else
    {
      switch (letter)
      { 
      case 'A':
        sizeX = sizeY*1.1/1.3;
        float ang = degrees(atan2(sizeY, sizeX/2));
        float diagonal = dist(0, 0, sizeX/2, sizeY);
        turn(-ang);
        goForward(diagonal);
        turn(2*ang);
        goForward(diagonal/2);
        jumpForward(diagonal/4);
        goForward(diagonal/4);
        break;

      case 'F':
        sizeX = sizeY*1.4/1.1;
        turn(-90);
        goForward(sizeY);
        turn(90);
        goForward(sizeX);
        turn(90);
        jumpForward(sizeY/2);
        turn(-90);
        jumpForward(-sizeX*3/4);
        goForward(sizeX/2);
        break;

      case 'I':
        sizeX = sizeY/20;
        turn(-90);
        goForward(sizeY);
        break;

      case 'P':
        sizeX = sizeY*1.4/1.3;
        turn(-90);
        goForward(sizeY);
        turn(90);
        float reto = sizeY*0.9/1.3;
        goForward(reto);//////////////////////////////////////////////////////
        for (int i=-90; i<90; i+=2)
        {
          setAngle(0);
          jumpForward((sizeX/2)*cos(radians(i)));
          turn(90);
          jumpForward((sizeY/2)*sin(radians(i)));
          turn(i);/////
          goForward(1);
          jumpForward(-1);
          turn(-i);/////
          jumpForward(-(sizeY/2)*sin(radians(i)));
          turn(-90);
          jumpForward(-(sizeX/2)*cos(radians(i)));
        }
        break;

      case 'E':
        jumpForward(sizeX);
        goForward(-sizeX);
        turn(-90);
        goForward(sizeY);
        turn(90);
        goForward(sizeX);
        turn(90);
        jumpForward(sizeY/2);
        turn(-90);
        jumpForward(-sizeX);
        goForward(sizeX);
        break;

      case 'H':
        turn(-90);
        goForward(sizeY);
        jumpForward(-sizeY/2);
        turn(90);
        goForward(sizeX);
        turn(90);
        jumpForward(sizeY/2);
        goForward(-sizeY);
        break;

      case 'O':
        turn(-45);
        jumpForward(sizeY/2*sqrt(2));
        turn(45);
        for (int i=0; i<360; i+=2)
        {
          setAngle(0);
          jumpForward((sizeX/2)*cos(radians(i)));
          turn(90);
          jumpForward((sizeY/2)*sin(radians(i)));
          turn(i);/////
          goForward(1);
          jumpForward(-1);
          turn(-i);/////
          jumpForward(-(sizeY/2)*sin(radians(i)));
          turn(-90);
          jumpForward(-(sizeX/2)*cos(radians(i)));
        }
        break;

      case 'T':
        jumpForward(sizeX/2);
        turn(-90);
        goForward(sizeY);
        turn(90);
        jumpForward(-sizeX/2);
        goForward(sizeX);
        break;
      }
    }
    //setPosition(initialPos.x, initialPos.y);
    //setAngle(initialAngle);
  }
}