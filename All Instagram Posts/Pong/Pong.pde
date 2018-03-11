Puck puck;
Paddle paddle1;
Paddle paddle2;
float paddlesVel = 0.1;

void setup()
{
  size(800, 600);
  rectMode(CENTER);
  
  puck = new Puck();
  paddle1 = new Paddle(1);
  paddle2 = new Paddle(2);
}

void draw()
{
  translate(width/2, height/2);
  
  noStroke();
  
  //fill(0, 0, 0, 60);
  //rect(0, 0, width, height);
  background(0);
  
  PFont font = createFont("Code", 100);
  textFont(font);
  textAlign(CENTER);
  int distCenter = width/6;
  fill(255);
  text(paddle1.score, -distCenter, - height/2 + 100);
  text(paddle2.score, distCenter, - height/2 + 100);

  puck.collision();
  puck.update();
  puck.draw();

  paddle1.draw();
  paddle2.draw();
}

void keyPressed()
{
  switch(keyCode)
  {
  case 'W':
  case 'w':
    paddle1.percent -= paddlesVel;
    break;

  case 'S':
  case 's':
    paddle1.percent += paddlesVel;
    break;

  case UP:
    paddle2.percent -= paddlesVel;
    break;

  case DOWN:
    paddle2.percent += paddlesVel;
    break;
  }
}