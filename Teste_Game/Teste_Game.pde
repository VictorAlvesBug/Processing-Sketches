int blocoQtde = 10, maxValue = 3, size = 40;
Bloco[][] bloco = new Bloco[blocoQtde][blocoQtde];

void setup()
{
  size(550, 550);
  colorMode(HSB);

  for (int col=0; col<blocoQtde; col++)
  {
    for (int row=0; row<blocoQtde; row++)
    {
      bloco[col][row] = new Bloco(col, row);
    }
  }
}

void draw()
{
  for (int col=0; col<blocoQtde; col++)
  {
    for (int row=0; row<blocoQtde; row++)
    {
      bloco[col][row].update();
      bloco[col][row].draw();
    }
  }
}

void mouseClicked()
{
  for (int col=0; col<blocoQtde; col++)
  {
    for (int row=0; row<blocoQtde; row++)
    {
      if (dist(mouseX, mouseY, bloco[col][row].pos.x, bloco[col][row].pos.y)<size/2)
      {
        bloco[col][row].click();
        return;
      }
    }
  }
}