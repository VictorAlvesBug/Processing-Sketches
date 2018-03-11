PVector anterior;
String modo = "Espelho Horizontal";
float colorCont = 0;

void setup()
{
  size(800, 800);
  background(0);
  colorMode(HSB);
  anterior = new PVector(0, 0);
}

void draw()
{
  //background(0);
}

void mouseDragged()
{
  strokeWeight(2);
  stroke(colorCont%360, 255, 255);
  colorCont++;
  if (anterior.x == 0 && anterior.y == 0)
  {
    anterior = new PVector(mouseX, mouseY);
  }

  switch(modo)
  {
  case "Normal":
    line(anterior.x, anterior.y, mouseX, mouseY);
    break;

  case "Espelho Horizontal":
    line(anterior.x, anterior.y, mouseX, mouseY);
    line(anterior.x, height-anterior.y, mouseX, height-mouseY);
    break;

  case "Espelho Vertical":
    line(anterior.x, anterior.y, mouseX, mouseY);
    line(width-anterior.x, anterior.y, width-mouseX, mouseY);
    break;

  case "Espelho Duplo":
    line(anterior.x, anterior.y, mouseX, mouseY);
    line(width-anterior.x, anterior.y, width-mouseX, mouseY);
    line(anterior.x, height-anterior.y, mouseX, height-mouseY);
    line(width-anterior.x, height-anterior.y, width-mouseX, height-mouseY);
    break;

  case "Espelho Invertido":
    line(anterior.x, anterior.y, mouseX, mouseY);
    line(width-anterior.x, height-anterior.y, width-mouseX, height-mouseY);
    break;
  }

  anterior = new PVector(mouseX, mouseY);
}

void mouseReleased()
{
  anterior = new PVector(0, 0);
}

void keyPressed()
{
  if (key == BACKSPACE)
  {
    background(0);
  }

  switch(keyCode)
  {
  case 'n':
  case 'N':
    modo = "Normal";
    break;

  case 'h':
  case 'H':
    modo = "Espelho Horizontal";
    break;

  case 'v':
  case 'V':
    modo = "Espelho Vertical";
    break;

  case 'a':
  case 'A':
    modo = "Espelho Duplo";
    break;

  case 'c':
  case 'C':
    modo = "Espelho Invertido";
    break;

  case 'e':
  case 'E':

    /*strokeWeight(1);
     stroke(255);
     switch(modo)
     {
     case "Normal":
     break;
     
     case "Espelho Horizontal":
     line(0, height/2, width, height/2);
     break;
     
     case "Espelho Vertical":
     line(width/2, 0, width/2, height);
     break;
     
     case "Espelho Duplo":
     line(0, height/2, width, height/2);
     line(width/2, 0, width/2, height);
     break;
     
     case "Espelho Invertido":
     line(width/2, height/2, width/2, height/2);
     break;
     }*/

    break;
  }
}